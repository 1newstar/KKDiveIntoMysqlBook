####
#IO 调度算法
###

#查看支持的调度算法
dmsg | grep -i scheduler;

#查看当前使用的调度算法
more /sys/block/sda/queue/scheduler
noop anticipatory deadline[cfg]

#修改当前的io调度算法，直接生效
echo "deadline" > /sys/block/sda/queue/scheduler

#永久修改调度算法
vi /boot/grub/menu.lst
#更改为
kernel /boot/vmlinuz-2.6.18-308.e15 ro root=LABEL=/ elevator=deadline