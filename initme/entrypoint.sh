#!/bin/bash

apt-get update
apt-get install -y --no-install-recommends openssl postgresql-client
DB_URL="postgresql://root:toor@postgres:5432"


if [[ ! -d /data ]]; then
    echo "ERROR: No mounted '/data'"
    echo "I will not do anything...!"
    exit 1
fi



# Root CA
if [[ ! -f /data/ssl/demoCA/cacert.pem ]]; then
    mkdir -p  /data/ssl/demoCA
    openssl genrsa -out /data/ssl/demoCA/cakey.pem 2048 
    openssl req -x509 -new -nodes -key /data/ssl/demoCA/cakey.pem -days 3650 -out /data/ssl/demoCA/cacert.pem -subj "/CN=Very very important Root CA"
    echo "Info: ROOT CA created"
fi

if [[ -n "$INITDOMAIN" ]]; then
    for i in "mail.$INITDOMAIN"
    do
        if [[ ! -f "/data/ssl/$i-cert.pem" ]]; then
            echo "Info: $i"
            echo "subjectAltName=DNS:$i" > /data/ssl/san.ext
            openssl genrsa -out /data/ssl/$i-key.pem 2048
            openssl req -new -key /data/ssl/$i-key.pem -out /data/ssl/$i.csr -subj "/CN=$i"
            openssl x509 -req -in /data/ssl/$i.csr -CA /data/ssl/demoCA/cacert.pem -CAkey /data/ssl/demoCA/cakey.pem -out /data/ssl/$i-cert.pem -days 3650 -sha256 -extfile /data/ssl/san.ext
            rm /data/ssl/san.ext
            rm /data/ssl/$i.csr
            echo "Info: SSL certificate for $i created!"
        fi
    done
else
    echo "WARNING: The 'INITDOMAIN' environment variable is not set. Please set the 'INITDOMAIN' Docker environment variable of your hostname(s)."
    echo " Example: INITDOMAIN='example.local'"
    exit 1
fi



if [[ ! -f /data/ssl/demoCA/cacert.crt ]]; then
    openssl x509 -in /data/ssl/demoCA/cacert.pem -out /data/ssl/demoCA/cacert.crt
fi


if [[ -n $initusers ]]; then
    echo "Init users"
else
    echo "Default users"
fi

# Mail users

if [[ ! -f /data/postfix-accounts.cf ]]; then
for i in \
    "rtir@$INITDOMAIN:$GLOBAL_PASS" \
    "admin@$INITDOMAIN:$GLOBAL_PASS" \
    "tony@$INITDOMAIN:$GLOBAL_PASS" \
    "yoda@$INITDOMAIN:$GLOBAL_PASS" \
    "joker@$INITDOMAIN:$GLOBAL_PASS" \
    "hr@$INITDOMAIN:$GLOBAL_PASS" \
    "mm@$INITDOMAIN:$GLOBAL_PASS" \
    "gov@gov.local:$GLOBAL_PASS" \
    "admin@gov.local:$GLOBAL_PASS"
do
    echo "$(echo $i | cut -d: -f1)|{SHA512-CRYPT}$(openssl passwd -6 -salt $(tr -dc 'A-Za-z0-9./' </dev/urandom | head -c 16) -password $(echo $i | cut -d: -f2))" >> /data/postfix-accounts.cf
done
fi

# Random ticketing users
for i in gmail mail yahoo icloud outlook proton
do
    for j in admin root bot security ammy tori john casady ben martha spam
    do
        echo "$j@$i.local|{SHA512-CRYPT}$(openssl passwd -6 -salt $(tr -dc 'A-Za-z0-9./' </dev/urandom | head -c 16) -password $GLOBAL_PASS)" >> /data/postfix-accounts.cf
    done
done


/bin/touch /data/ready
echo "Sleep to be healty :)"
/bin/sleep 7
/bin/rm /data/ready

echo "Waiting for psql connection..."
until psql "${DB_URL}/mattermost" -c "SELECT 1" >/dev/null 2>&1; do
  echo "Still waiting.."
  sleep 1
done
echo "psql connection works."

# Init RT6
if ! psql ${DB_URL}/rt6 -tAc "SELECT 1 FROM queues WHERE name='Incidents' LIMIT 1;" | grep -q 1; then

  if [[ -f /tmpdata/rt6.sql ]]; then
    psql ${DB_URL}/mattermost < /tmpdata/rt6.sql
    RT_DB_URL=${DB_URL}/rt6
    
    set +H
    ROOT_ID=$(psql ${RT_DB_URL} -tAqc "SELECT id FROM users WHERE name='root';")
    psql $RT_DB_URL -c "UPDATE users SET emailaddress = 'admin@${INITDOMAIN}' WHERE id = ${ROOT_ID};"

    ROOT_ID=$(psql $RT_DB_URL -tAqc "SELECT id FROM users WHERE name='tony';")
    psql $RT_DB_URL -c "UPDATE users SET emailaddress = 'tony@${INITDOMAIN}' WHERE id = ${ROOT_ID};"

    ROOT_ID=$(psql $RT_DB_URL -tAqc "SELECT id FROM users WHERE name='yoda';")
    psql $RT_DB_URL -c "UPDATE users SET emailaddress = 'yoda@${INITDOMAIN}' WHERE id = ${ROOT_ID};"

    ROOT_ID=$(psql $RT_DB_URL -tAqc "SELECT id FROM users WHERE name='joker';")
    psql $RT_DB_URL -c "UPDATE users SET emailaddress = 'joker@${INITDOMAIN}' WHERE id = ${ROOT_ID};"
  fi
fi

# Init faketotal
if ! psql ${DB_URL}/faketotal -tAc "SELECT 1 FROM faketotal WHERE ioc='example.com' LIMIT 1;" | grep -q 1; then
  if [[ -f /tmpdata/faketotal.sql ]]; then
    psql ${DB_URL}/mattermost < /tmpdata/faketotal.sql
  fi
fi


/bin/echo "[Info] I'm done here! Bye, bye!"
exit 0