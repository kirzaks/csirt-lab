#!/bin/bash

pip3 install -r /app/init/requirements.txt

cat > /usr/local/bin/initme << "EOF"
#!/bin/bash
exec python3 /app/init/init_ir.py
EOF
chmod +x /usr/local/bin/initme

cat > /usr/local/bin/sendmail << "EOF"
#!/bin/sh
exec python3 /app/init/mailsend.py "$@"
EOF
chmod +x /usr/local/bin/sendmail

python3 /app/api.py

echo "Nothing to do. I will just run..."

sleep infinity