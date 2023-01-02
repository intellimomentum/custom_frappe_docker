#!/bin/bash

# Initialize Bench
bench init \
  --frappe-branch=version-14 \
  --apps_path=apps.json \
  --skip-redis-config-generation \
  --verbose frappe-bench

# Change to frappe-bench
cd frappe-bench

# Set global bench configs
echo "Configuring Bench ..."
echo "Set db_host to mariadb"
bench set-config -g db_host mariadb
echo "Set redis_cache to redis://redis-cache:6379"
bench set-config -g redis_cache redis://redis-cache:6379
echo "Set redis_queue to redis://redis-queue:6379"
bench set-config -g redis_queue redis://redis-queue:6379
echo "Set redis_socketio to redis://redis-socketio:6379"
bench set-config -g redis_socketio redis://redis-socketio:6379

# Create erpnext.localhost site
echo "Create erpnext.localhost, install apps"
bench new-site \
  --no-mariadb-socket \
  --db-root-password=123 \
  --admin-password=admin \
  --install-app=erpnext  \
  --install-app=hrms \
  --install-app=erpnext_germany \
  --install-app=erpnext_datev \
  --install-app=erpnext_customization \
  --install-app=erpnextfints \
  erpnext.localhost

bench --site erpnext.localhost enable-scheduler
