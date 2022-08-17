#!/bin/bash
SHELL=$(readlink -f "$0")			#脚本文件
SHELL_PATH=$(dirname $SHELL)		#脚本路径
PROJECT=${1}						#项目路径
if [[ $(uname -m) != "aarch64" ]]; then su="sudo ";fi;
getProp() { grep "$1" "${PROJECT}/system/system/build.prop" | head -1 | cut -d "=" -f 2; }

AndroidApi=$(getProp 'ro.build.version.sdk')

if [ "$AndroidApi" == '33' ] ; then
	${su} sed -i "/services.jar/d" "${SHELL_PATH}/FileConfig.ini"
	${su} echo -e "/system_ext/framework/miui-services.jar" >> "${SHELL_PATH}/FileConfig.ini"
elif [ "$AndroidApi" = '32' ] || [ "$AndroidApi" = '31' ] ; then
	${su} sed -i "/services.jar/d" "${SHELL_PATH}/FileConfig.ini"
	${su} echo -e "#/system/system/framework/services.jar" >> "${SHELL_PATH}/FileConfig.ini"
else
	${su} sed -i "/services.jar/d" "${SHELL_PATH}/FileConfig.ini"
	${su} echo -e "/system/system/framework/services.jar" >> "${SHELL_PATH}/FileConfig.ini"
fi
