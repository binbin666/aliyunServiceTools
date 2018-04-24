#!/bin/bash
checkAliyunServiceStatus(){
  checkServiceList=("aliyun.service" "aegis.service" "cloudmonitor.service")
  #serviceStatusList=("active (running)" "inactive (dead)")
  echo -e "======================================================================================== \n"
  echo "check aliyun service status...."
  echo "======================================================================================== "
  statusCode="36m"
  for i in ${checkServiceList[@]}; do
    consoleRetTmp=`systemctl status ${i} | grep "Active:"`
    consoleStatus=`echo ${consoleRetTmp}|awk '{a=index($0,"Active: ");b=index($0,")");print substr($0,a+8,b-a-7)}'`
    if [[ $consoleStatus =~ "running" ]]; then
      statusCode="32m"
    elif [[ $consoleStatus =~ "dead" ]]; then
      statusCode="31m"
    fi
    echo -e "${i}:\033[${statusCode} ${consoleRetTmp} \033[0m" 
  done
  echo -e "======================================================================================== \n"
}
checkAliyunServiceStatus
echo -n -e "please enter an integer to operator-> \n"
echo "======================================================================================== "
echo -e "\033[5maliyun service op>>>>\033[0m 0:exit 1:start 2:stop "
echo "======================================================================================== "
read -p ">> " nump
if [[ $nump =~ ^-?[0-2]$ ]]; then
    case $nump in
        1)
        echo "going to start aliyun service"
        systemctl start aliyun.service
        systemctl start aegis.service
        systemctl start cloudmonitor.service
        echo "======================================================================================== "
        checkAliyunServiceStatus
        ;;
        2)
        echo "going to stop aliyun service"
        systemctl stop aliyun.service
        systemctl stop aegis.service
        systemctl stop cloudmonitor.service
        echo "======================================================================================== "
        checkAliyunServiceStatus
        ;;
        0)
        echo "Bye~"
        echo "======================================================================================== "
        exit
        ;;
        *)
        echo "Oh My God!!!"
        ;;
    esac
else
    echo "error inputs, please check it and have a try again"
    echo "======================================================================================== "
fi
