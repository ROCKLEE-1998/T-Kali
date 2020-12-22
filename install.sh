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
`echo -e "\033[35m 2) install tools \033[0m"`
`echo -e "\033[35m 3)主菜单\033[0m"`
`echo -e "\033[35m Q)退出\033[0m"`
EOF
read -p "请输入对应序列号：" num1
case $num1 in
    1)
    echo -e "\033[32m >>>install kali-> \033[0m"
    system_kali
    ;;
    2)
    echo -e "\033[32m >>>install tools-> \033[0m"
    system_tools
    ;;
    3)
    echo -e "\033[32m >>>返回主菜单-> \033[0m"
    menu
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

chmod +x files/kali.sh
        ./files/kali.sh
}
function system_tools()
{

chmod +x files/tools.sh
        ./files/tools.sh
}

menu
