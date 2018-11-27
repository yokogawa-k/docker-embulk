#!/bin/sh
export PATH=$PATH:/usr/local/bin/digdag/

# オンメモリ
# exec /usr/local/bin/digdag server --memory --bind 0.0.0.0 --log /var/lib/digdag/logs/server --task-log /var/lib/digdag/logs/tasks

# PostgreSQL
exec /usr/local/bin/digdag server --bind 0.0.0.0 --log /var/lib/digdag/logs/server --task-log /var/lib/digdag/logs/tasks --config /etc/postgresql.conf