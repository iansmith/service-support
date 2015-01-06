#!/bin/sh

## restart and re-read config
sudo -u postgres /usr/lib/postgresql/9.3/bin/pg_ctl -w -o "--config-file=/etc/postgresql/9.3/main/postgresql.conf" -D /var/lib/postgresql/9.3/main start    

## add any databases you want to always be there
#sudo -u postgres /usr/lib/postgresql/9.3/bin/createdb candidate
sudo -u postgres /usr/lib/postgresql/9.3/bin/pg_ctl -o "--config-file=/etc/postgresql/9.3/main/postgresql.conf" -D /var/lib/postgresql/9.3/main stop

