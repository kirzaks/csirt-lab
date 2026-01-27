FROM ubuntu:24.04

LABEL author="Armins Palms" \
      version="1.0" \
      description="This image is part of the 'csirt-lab' setup (RTIR + Adminer + Mattermost + Email + Roundcube + FakeTotal)" \
      linkedin="https://www.linkedin.com/in/armins-palms/" \
      git-repo="https://github.com/kirzaks/csirt-lab"

ARG RT=rt-6.0.2
ARG RTIR=RT-IR-6.0.1


ARG DEBIAN_FRONTEND=noninteractive
ARG RT_FIX_DEPS_CMD=/usr/local/bin/cpanm


RUN apt-get update && apt-get install -y --no-install-recommends curl perl make build-essential ca-certificates libpq-dev libpq-dev \
    netbase libexpat1-dev tzdata zlib1g-dev msmtp postgresql-client fetchmail w3m elinks links html2text lynx
RUN rm -rf /var/lib/apt/lists/*
RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata


RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm --self-upgrade --sudo
RUN printf "yes\nq\n" | /usr/bin/perl -MCPAN -e shell
RUN cpanm CSS::Inliner



WORKDIR /app
RUN curl -fsSL "https://download.bestpractical.com/pub/rt/release/${RT}.tar.gz"  | tar xz  && mv $RT rt
WORKDIR /app/rt/
RUN ./configure --with-db-host=postgres --with-db-rt-host=rtir --with-db-type=Pg --with-db-rt-user=root --with-db-rt-pass=toor --with-db-port=5432 --with-db-dba=root
RUN make fixdeps
RUN make install



#Install RTIR
WORKDIR /app
RUN curl -fsSL "https://download.bestpractical.com/pub/rt/release/${RTIR}.tar.gz"  | tar xz  && mv $RTIR rtir
WORKDIR /app/rtir
RUN printf "yes\n" | perl Makefile.PL
RUN make
RUN make install

COPY ./init_demo.sh /app/entrypoint.sh
ENTRYPOINT [ "/bin/bash", "/app/entrypoint.sh" ]