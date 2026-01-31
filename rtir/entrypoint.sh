#!/bin/bash

set -e


DB_URL="postgresql://${PG_USER}:${PG_PASS}@postgres:5432/rt6"
FILE="/data/ssl/demoCA/cacert.crt"

# Fetchmail config
if [[ ! -n $INITDOMAIN ]]; then
  echo "ERROR: NOT set INITDOMAIN in ENV"
  exit 1
fi

if [[ ! -f "/etc/fetchmailrc" ]]; then
cat <<EOF > /etc/fetchmailrc
set daemon 20

poll mail.$INITDOMAIN proto IMAP port 993
  user "rtir@$INITDOMAIN" password "${GLOBAL_PASS}"
  ssl
  folder "Inbox"
  mda "/opt/rt6/bin/rt-mailgate --queue 'Incident Reports' --action correspond --url http://rtir/"
  no keep
EOF
chmod 700 /etc/fetchmailrc
fi

# MSMTP config

if [[ ! -f "/etc/msmtprc" ]]; then
cat <<EOF > /etc/msmtprc
auth           on
tls            on
tls_starttls   on
port           587
logfile        /var/log/msmtp.log

host           mail.$INITDOMAIN
from           rtir@$INITDOMAIN
user           rtir@$INITDOMAIN
password       $GLOBAL_PASS
EOF
fi



# CERT
if [[ -f $FILE ]]; then
  echo "Setting Very important ROOT CA..."
  cp $FILE /usr/local/share/ca-certificates/
  update-ca-certificates
else
  echo "[ERROR]; $FILE not found"
fi

echo "START_DAEMON=yes" > /etc/default/fetchmail


# RTIR custom config..
cat <<EOF > /opt/rt6/etc/RT_SiteConfig.pm
use utf8;

Set(\$rtname, '$INITDOMAIN');
Set(\$Organization , '$INITDOMAIN');

# E-mail setup
Set(\$OwnerEmail , 'admin@$INITDOMAIN');
Set(\$CorrespondAddress , 'rtir@$INITDOMAIN');
Set(\$CommentAddress , 'rtir@$INITDOMAIN');
Set(\$RTAddressRegexp , '^rtir\@$(echo $INITDOMAIN | sed 's/\./\\\./g')$');

# Plugins
Plugin('RT::IR');

Set(\$DatabaseHost, 'postgres');
Set(\$DatabaseName, 'rt6');
Set(\$DatabasePassword, '${PG_PASS}');
Set(\$DatabasePort, 5432);
Set(\$DatabaseType, 'Pg');
Set(\$DatabaseUser, '${PG_USER}');
Set(\$WebPort, 80);
Set(\$LogToFile, 'debug');
Set(\$LogToFileNamed, 'rt6.log');
Set(\$LogDir, '/opt/rt6/var/log');
Set(\$WebSecureCookies, 0);

Set(\$MessageBoxRichText, 0);
Set(\$RTIR_RedirectOnLogin, 1);
Set(\$RTIR_RedirectOnSearch, 1);


Set(\$MailCommand, 'sendmailpipe');
Set(\$SendmailPath, '/usr/bin/msmtp');
Set(\$SendmailArguments, '-t -i');

1;

EOF

# Init RT
if ! psql $DB_URL -tAc "SELECT 1 FROM information_schema.tables WHERE table_schema='public' AND table_name='users' LIMIT 1;" | grep -q 1; then
  /usr/bin/perl -I/opt/rt6/local/lib -I/opt/rt6/lib  /opt/rt6/sbin/rt-setup-database --action init --dba-password $PG_PASS
fi


# Init RTIR
if ! psql $DB_URL -tAc "SELECT 1 FROM queues WHERE name='Incidents' LIMIT 1;" | grep -q 1; then
  /usr/bin/perl -I/app/rtir -I/app/rtir/lib -I/opt/rt6/local/lib -I/opt/rt6/lib /opt/rt6/sbin/rt-setup-database --action insert --datadir /app/rtir/etc --datafile /app/rtir/etc/initialdata --dba $PG_USER --dba-password $PG_PASS --package RT::IR --ext-version $RTIR_VERSION
fi


# And finaly...
echo "Running fetchmail..."
/etc/init.d/fetchmail start
echo "Running RTIR..."
exec /opt/rt6/sbin/rt-server --host 0.0.0.0
