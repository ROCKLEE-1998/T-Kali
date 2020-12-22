#!/bin/bash
function menu()
{
mkdir scan
apt update -y && apt upgrade -y && apt-get install p7zip 
clear
echo -e `date`
cat <<EOF
-----------------------------------
>>>T-KALI:
`echo -e " version:2.2 " `
`echo -e " debian && Ubuntu20 " `
`echo -e "\033[35m 1) install awvs \033[0m"`
`echo -e "\033[35m 2) install cs4.1 \033[0m"`
`echo -e "\033[35m 3) 返回主界面     \033[0m"`
`echo -e "\033[35m Q)退出\033[0m"`
EOF
read -p "请输入对应序列号：" num1
case $num1 in
    1)
    echo -e "\033[32m >>>install awvs-> \033[0m"
     echo -e "begin install awvs"
     system_awvs
    ;;
    2)
    echo -e "\033[32m >>>install cs-> \033[0m"
    system_cs
    ;;
    3)
    echo -e "\033[32m >>>返回主界面 -> \033[0m"
    cd ..
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
function system_awvs()
{

        echo -e "\033[1;40;32m download tools \033[0m "
        cd scan &&  wget   http://oss.jizhiidc.cn/oss/acunetix.7z && 7z x acunetix.7z && cd acunetix  &&chmod +x acunetix_13.0.201126145_x64.sh && ./acunetix_13.0.201126145_x64.sh
        echo -e " \033[1;40;32m  install end.. begin pojie  (｡>∀<｡) \033[0m "
        systemctl stop acunetix
        rm -rf /home/acunetix/.acunetix/data/license/license_info.json
        rm -rf /home/acunetix/.acunetix/v_201126145/scanner/wvsc
        cp license_info.json  /home/acunetix/.acunetix/data/license
        cp wvsc /home/acunetix/.acunetix/v_201126145/scanner
        chmod +x /home/acunetix/.acunetix/data/license/license_info.json
        chmod +x /home/acunetix/.acunetix/v_201126145/scanner/wvsc
        systemctl start acunetix
        echo -e "\033[1;40;32m  pojie end ... \033[0m "
        echo -e "\033[1;40;32m  my english is very poor , so guizimen may be see bu dong ,heiheihei (｡>∀<｡)  \033[0m "
		cd ../../
        menu
}
function system_cs()
{
        cd scan &&  wget  http://oss.jizhiidc.cn/oss/Cobalt%20Strike%204.1.7z && 7z x Cobalt Strike 4.1.7z && cd Cobalt Strike 4.1  &&chmod +x start.sh
        menu
}

menu


