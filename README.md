# T-Kali
打造云上kali武器库
可以把乌班图20及Debian9-10系统转化为kali系统，建议系统为Debian9及以上
脚本完全开源，内置常用安全工具，后续功能会不断完善添加中
支持云服务器安装，有图像化界面及vnc安装选项
谢谢青山师傅的文章给的灵感和建议，参考文章http://8io.io/archives/31
如有其他建议请联系邮箱：
zhantang233@gmail.com

使用方法:apt update && apt install git -y && git clone https://github.com/ROCKLEE-1998/T-Kali.git && cd T-Kali/ &&chmod +x install.sh &&./install.sh





若是选择开启vnc建议所有步骤安装后reboot重启一下，vnc启动命令是vncserver，使用方法是使用vnc客户端登入，输入ip:5900+pid号，如显示pid为1，则应为：ip:5901，可重复输入vncserver开启不同pid
供多人在线使用，防火墙建议开放5900-6000端口


已添加工具：
acunetix_13.0.201126145
cobaltstrike4.1
