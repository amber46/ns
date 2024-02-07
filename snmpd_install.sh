apt-get install -y snmpd
mv /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.orig
echo "Create file /etc/snmp/snmpd.conf"
tee /etc/snmp/snmpd.conf << END
#       sec.name  source          community
com2sec local     localhost       oVVty4n2eZyr
com2sec mynetwork 80.178.157.0/24  oVVty4n2eZyr
com2sec monitor  80.178.157.0/24  oVVty4n2eZyr
com2sec monitor  172.17.0.0/16  oVVty4n2eZyr
com2sec monitor  141.226.232.0/24  oVVty4n2eZyr
com2sec monitor  37.60.47.125  oVVty4n2eZyr

#               sec.model  sec.name
group MyROGroup v2c        local
group MyROGroup v2c        mynetwork
group MyROGroup v2c        monitor

#           incl/excl subtree                          mask
view all    included  .1                               80

####
# Finally, grant the 2 groups access to the 1 view with different
# write permissions:
#                context sec.model sec.level match  read   write  notif
access MyROGroup ""      any       noauth    exact  all    none   none
access MyRWGroup ""      any       noauth    exact  all    all    none

includeAllDisks 10%

includeDir /etc/snmp/snmpd.conf.d/
END
service snmpd restart
service snmpd status
