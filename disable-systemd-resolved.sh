#!/bin/bash
# Author: Amberson

systemctl disable systemd-resolved.service
systemctl stop systemd-resolved

rm -f /etc/resolv.conf

tee /etc/resolv.conf << END
nameserver 8.8.8.8
nameserver 1.1.1.1
END

echo "systemd-resolved is disabled."
