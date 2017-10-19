#!/bin/sh
# Set DNS Server in Ubuntu

head=/etc/resolvconf/resolv.conf.d/head
config_resolvconf(){
	cp -a ${head} ${head}.save
	cat >${head} <<EOF
options attempts=2 timeout=2 rotate
nameserver 119.29.29.29
nameserver 182.254.116.116
nameserver 223.5.5.5
nameserver 223.6.6.6
EOF
	/sbin/resolvconf -u
	
	echo "Reconfig /etc/resolv.conf success."
}

restore_resolvconf(){
	if [ -e ${head}.save ];then
		cat ${head}.save > ${head}
	else
		true > ${head}
	fi

	/sbin/resolvconf -u
	
	echo "Resotre /etc/resolv.conf success."
}

action=$1

if [ $(cat /etc/issue |grep -iwc ubuntu) -ne 1 ];then
	echo "Only support Ubuntu OS"
	exit
fi

if [ "${action}" != "restore" ];then
	config_resolvconf
else
	restore_resolvconf
fi

echo '--------------------------------------'
cat /etc/resolv.conf

#End
