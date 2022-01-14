#!/bin/bash
printf "\033c"
SHELL=$(readlink -f "$0")			#脚本文件
SHELL_PATH=$(dirname $SHELL)		#脚本路径
if [[ $(uname -m) != "aarch64" ]]; then su="sudo ";fi;

echo "
	
		·····································
		
		正在安装HaisV4所需依赖，请耐心等待！
		
		·····································
		
	"

${su} apt install -y cpio bc file aria2 brotli android-sdk-libsparse-utils openjdk-11-jre curl python3 python3-pip zipalign zip unzip img2simg dos2unix jq p7zip-full