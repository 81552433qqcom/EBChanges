#! /bin/bash
cd /home/erpnext/ebchanges_staging/ebchanges
git pull

ls /home/erpnext/ebchanges_staging/ebchanges/apps/erpnext/erpnext/translations
ls /home/erpnext/frappe-bench/apps/erpnext/erpnext/translations

cp -Rf /home/erpnext/ebchanges_staging/ebchanges/apps/erpnext/erpnext/* /home/erpnext/frappe-bench/apps/erpnext/erpnext/
cp -Rf /home/erpnext/ebchanges_staging/ebchanges/apps/frappe/frappe/* /home/erpnext/frappe-bench/apps/frappe/frappe/

chown erpnext:erpnext /home/erpnext/frappe-bench/apps/frappe/frappe/translations/zh-cn.csv
chown erpnext:erpnext /home/erpnext/frappe-bench/apps/erpnext/erpnext/translations/zh-cn.csv

ls /home/erpnext/frappe-bench/apps/frappe/frappe/translations/zh-cn.csv
ls /home/erpnext/frappe-bench/apps/erpnext/erpnext/translations/zh-cn.csv

cd /home/erpnext/frappe-bench
bench frappe --build
bench frappe --clear_cache

cd /home/erpnext/frappe-bench/apps/frappe/frappe
git status
