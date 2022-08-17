#!/bin/bash
SHELL=$(readlink -f "$0")			#脚本文件
SHELL_PATH=$(dirname $SHELL)		#脚本路径
PROJECT=${1}						#项目路径
if [[ $(uname -m) != "aarch64" ]]; then su="sudo ";fi;
getProp() { grep "$1" "${PROJECT}/system/system/build.prop" | head -1 | cut -d "=" -f 2; }

#准备工作

#${su} rm -rf ${1}/system/system/app/FileExplorer/oat
#${su} rm -rf ${1}/system/system/priv-app/MiuiPackageInstaller/oat


AndroidApi=$(getProp 'ro.build.version.sdk')

if [ "$AndroidApi" == '33' ] ; then
	mkdir -p "${SHELL_PATH}/product"
	if [ ! -d "${SHELL_PATH}/product/data-app" ] && [ -d "${SHELL_PATH}/system/system/data-app" ] ;then
		mv "${SHELL_PATH}/system/system/data-app" "${SHELL_PATH}/product/data-app"
	fi
	if [ ! -d "${SHELL_PATH}/product/media" ] && [ -d "${SHELL_PATH}/system/system/media" ] ;then
		mv "${SHELL_PATH}/system/system/media" "${SHELL_PATH}/product/media"
	fi
else
	mkdir -p "${SHELL_PATH}/system/system"
	if [ -d "${SHELL_PATH}/product/data-app" ] && [ ! -d "${SHELL_PATH}/system/system/data-app" ] ;then
		mv "${SHELL_PATH}/product/data-app" "${SHELL_PATH}/system/system/data-app"
	fi
	if [ -d "${SHELL_PATH}/product/media" ] && [ ! -d "${SHELL_PATH}/system/system/media" ] ;then
		mv "${SHELL_PATH}/product/media" "${SHELL_PATH}/system/system/media"
	fi
fi
