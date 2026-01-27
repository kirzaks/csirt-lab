#!/bin/bash
set -e

cp /data/ssl/demoCA/cacert.crt /usr/local/share/ca-certificates/
update-ca-certificates
