SMALI_FILE='/smali/com/miui/server/SecurityManagerService$1.smali'						#文件路径
FIND_START='.method public run()V'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method public  run()V
    .locals 7

    return-void
.end method
'