systemctl stop iptables
systemctl disable iptables
systemctl stop firewalld
systemctl disable firewalld
yum -y install openldap-clients nss-pam-ldapd
yum install net-tools vim authconfig-tui nss-pam-ldapd.x86_64 -y
#authconfig --enableforcelegacy --enableldap --enableldapauth --enablemd5 --enableshadow --ldapserver="" --ldapbasedn="dc=zp,dc=net,dc=br"  --update
yum -y update

