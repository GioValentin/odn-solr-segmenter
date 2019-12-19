#!/bin/bash
mysql -h 204.232.142.171 -u mcplusa -pKkBzFNCH3XfWHkbD -N titan_store_pz < ./years.sql > /home/steph/Documents/CLIENTS/boats/vehicle_year_s.txt
mysql -h 204.232.142.171 -u mcplusa -pKkBzFNCH3XfWHkbD -N titan_store_pz < ./make.sql > /home/steph/Documents/CLIENTS/boats/vehicle_make_s.txt
mysql -h 204.232.142.171 -u mcplusa -pKkBzFNCH3XfWHkbD -N titan_store_pz < ./model.sql > /home/steph/Documents/CLIENTS/boats/vehicle_model_s.txt
mysql -h 204.232.142.171 -u mcplusa -pKkBzFNCH3XfWHkbD -N titan_store_pz < ./base_model.sql > /home/steph/Documents/CLIENTS/boats/vehicle_base_model_s.txt
mysql -h 204.232.142.171 -u mcplusa -pKkBzFNCH3XfWHkbD -N titan_store_pz < ./size.sql > /home/steph/Documents/CLIENTS/boats/vehicle_size_s.txt
mysql -h 204.232.142.171 -u mcplusa -pKkBzFNCH3XfWHkbD -N titan_store_pz < ./size.sql > /home/steph/Documents/CLIENTS/boats/vehicle_size_s.txt
mysql -h 204.232.142.171 -u mcplusa -pKkBzFNCH3XfWHkbD -N titan_store_pz < ./type.sql > /home/steph/Documents/CLIENTS/boats/vehicle_type_s.txt

