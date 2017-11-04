####
#RAID的自动学习校准问题
###
#查看电池备份单元测试 BBU 的状态
MegaCli64 -AdpBbuCmd GetBbuStatus -aAll;

#查看 RAID 的缓存策略
MegaCli64 -LDInfo -Lall -aAll

#修改缓存策略
MegaCli64 -LDSetProp -WB -Lall -aAll

#高峰期故障，设置策略为 CachedBadBBU ，提高性能
MegaCli64 -LDSetProp CachedBadBBU -Lall -aAll

#高峰期过后，恢复策略为 NoCachedBadBBU 避免断电数据损失
MegaCli64 -LDSetProp NoCachedBadBBU -Lall -aAll

#获取 BBU 的下次校准时间
MegaCli64 -fwtermlog -dsply -a0 -nolog

#获取 BBU 的下次校准时间2
MegaCli64 -AdpBbuCmd -GetBbuProperties -aall

#手工触发 BBU 校准
MegaCli64 -AdpBbuCmd -BbuLearn -aAll;