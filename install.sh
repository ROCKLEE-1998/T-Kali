#!/bin/bash
function main(){
	RED='\033[1;31m'
	WHITE='\033[1;37m'
	ORANGE='\033[01;38;5;166m'
	GREEN='\033[01;38;5;118m'
	echo -e "                                        ${RED}T-Kail${WHITE}"
	echo -e "                                    ${RED}(Version - 1.O)                                "
	echo -e "                                  ${ORANGE}亲测Debian及乌班图20                                    "
	echo -e "                            ${ORANGE}如有报错 错的不是我而是这个世界                         "
	echo -e "                                     ${ORANGE} 测试版本                     "
	echo -e " "
	echo -e "   ${GREEN}       是否安装你滴kali亲"
	echo -e "           1. Yes"
	echo -e ""
	echo -e "           2. No"
	COUNTER=0
	while [  $COUNTER -lt 4 ]; do
		read -p 'Input Your Choice: ' i
		if (($i == 1)); then 
				chmod +x ./files/kali
				./files/kali
				break
		elif (($i == 2)); then 	
				echo "再见，亲爱的"
				break
		elif (($i == note)); then
			echo -e "\n*****************************************************************"
			echo "hxd，答应我，请输入1或2好吗"
		else
			echo -e "\n\n hxd，答应我，请输入1或2好吗？你还有  $((3-$COUNTER)) 次机会就会退出脚本"
		fi
		let COUNTER=COUNTER+1
done
}
if [ `whoami` == "root" ]; then
	main
else
	echo "必须是root用户哦亲"
fi

