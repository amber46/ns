#!/bin/bash

/bin/sed -i "s/#Port 22/Port 1111/g" /etc/ssh/sshd_config
/bin/sed -i "s/#Protocol 2/Protocol 2/g" /etc/ssh/sshd_config
/bin/sed -i "s/#UseDNS yes/UseDNS no/g" /etc/ssh/sshd_config
/bin/sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
/bin/sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config

service sshd restart
