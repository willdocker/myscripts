systemctl stop iptables
systemctl disable iptables
systemctl stop firewalld
systemctl disable firewalld
mkdir /opt/zabbix-repo
cd /opt/zabbix-repo
rpm -Uvh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
yum -y remove zabbix-agent
yum update -y && yum install zabbix-agent -y
echo "Ajustando arquivo de configura��o"
sed -i 's/127.0.0.1/192.168.20.53/g' /etc/zabbix/zabbix_agentd.conf
sed -i '136s/^/#/' /etc/zabbix/zabbix_agentd.conf
sed -i "147s/.*/$HOSTNAME/" /etc/zabbix/zabbix_agentd.conf
echo "Iniciando Servi�o"
systemctl enable zabbix-agent.service
systemctl start zabbix-agent.service
echo "Verificando se os servi�o esta rondando"
#cat /var/log/zabbix/zabbix_agentd.log
ps -aux | grep zabbix
echo "Instala��o encerrada!"
exit


