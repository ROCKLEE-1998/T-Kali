#!/bin/bash
function menu()
{
echo -e `date`
cat <<EOF
-----------------------------------
>>>T-KALI:
`echo -e " version:2.2 " `
`echo -e " debian && Ubuntu20 " `
`echo -e "\033[35m 1) install kali \033[0m"`
`echo -e "\033[35m 2) install vnc \033[0m"`
`echo -e "\033[35m 3) 返回主界面     \033[0m"`
`echo -e "\033[35m Q)退出\033[0m"`
EOF
read -p "请输入对应序列号：" num1
case $num1 in
    1)
    echo -e "\033[32m >>>install kali-> \033[0m"
     echo -e "begin install kali"
     system_kali
    ;;
    2)
    echo -e "\033[32m >>>install vnc-> \033[0m"
    system_vnc
    ;;
    3)
    echo -e "\033[32m >>>返回主界面 -> \033[0m"
    
    ./install.sh
    ;;
    Q|q)
    echo -e "\033[32m--------退出--------- \033[0m"
    exit 0
    ;;
    *)
    echo -e "\033[31m err：请输入正确的编号\033[0m"
    menu
esac
}
function system_kali()
{
echo -e " 更新源中....."
apt-get update
apt-get install -y dirmngr

echo -e " 给kali更新源加key "
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6

echo -e "更换kali更新源 默认更新源是阿里镜像 "
cat <<EOF > /etc/apt/sources.list
#aliyun
deb http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
deb-src http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
EOF

echo -e " 更新系统并安装kali "
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove --purge
apt-get -y install kali-linux*

echo -e "清理垃圾中...."
apt-get -y autoremove --purge
apt-get clean
        menu
}
function system_vnc()
{
 apt-get install xfce4 xfce4-goodies xorg lxde-core tightvncserver -y --allow-unauthenticated
		vncserver
		vncserver -kill :1
		sed -i '171i $localhost="no"; ' /etc/vnc.conf   #开放监听地址，不再仅限本地使用
		chmod +x /etc/vnc.conf
		mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
		echo "#!/bin/bash
		xrdb $HOME/.Xresources
		startxfce4 &
		lxterminal &
		/usr/bin/lxsession -s LXDE &" >> ~/.vnc/xstartup
		  chmod +x ~/.vnc/xstartup
		echo "#!/bin/bash
		PATH="$PATH:/usr/bin/"
		export USER="user"
		DISPLAY="1"
		DEPTH="16"
		GEOMETRY="1024x768"
		OPTIONS="-depth ${DEPTH} -geometry ${GEOMETRY} :${DISPLAY} -localhost"
		. /lib/lsb/init-functions" >> /etc/init.d/vncserver
		  chmod +x /etc/init.d/vncserver
		rm /etc/hostname
		echo "Kali" >> /etc/hostname
		vncserver
		clear
		echo -e "============================================================================================================================="
		myip="$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com)" 
		echo "Connect it!!! Using :-  ${myip}:1 in VNC Viewer"
		echo -e "============================================================================================================================="
menu
}

menu




