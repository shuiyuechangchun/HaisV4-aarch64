FILE="/system/init.miui.rc"			#文件路径+名称，

#字符串替换，请二选一，不要同时开启
DEFAULT_CODE='on boot'


#要替换的内容
REPLACE_CODE='on boot
service delapp /system/bin/sh -c "rm -rf /data/data/com.xiaomi.market/app_analytics/"
    seclabel u:r:su:s0
    user root
    oneshot
    disabled

on property:sys.boot_completed=1
    start delap
'
