#! /bin/bash
echo """
==================================================
  Creating certificate for foo.test
==================================================
"""
mkcert foo.test

echo """
==================================================
  Copying foo.test certificates to ./caddy/certs
==================================================
"""

cp ./foo.test.pem ./caddy/certs
cp ./foo.test-key.pem ./caddy/certs

echo """
==================================================
  Copying foo.test certificates to ./caddy-gen/certs
==================================================
"""

cp ./foo.test.pem ./caddy-gen/certs
cp ./foo.test-key.pem ./caddy-gen/certs

echo """
==================================================
  Copying foo.test certificates to ./nginx/certs
==================================================
"""

cp ./foo.test.pem ./nginx/certs/foo.test.crt
cp ./foo.test-key.pem ./nginx/certs/foo.test.key

echo """
==================================================
  Adding the following to /etc/hosts file:

  127.0.0.1 foo.test
==================================================
"""

if ! grep -q foo.test /etc/hosts ; then echo "127.0.0.1 foo.test" >> /etc/hosts ; fi

