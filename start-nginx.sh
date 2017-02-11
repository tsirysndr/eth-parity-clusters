#!/bin/bash
sed -i s/"<external-ip>"/`hostname -i`/g /etc/nginx/sites-enabled/parity.ui
service nginx start