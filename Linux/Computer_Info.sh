
## Model Du CPU ##
cpu=`cat /proc/cpuinfo |grep model |awk '{print $4}' |sed -n 2p`
model=`cat /proc/cpuinfo |grep model |awk '{print $5}' |sed -n 2p`
cpumodel="$cpu $model"
echo "$cpumodel"

### LAN ID
ifconfig enp3s0 |grep inet |awk '{print $2}' |sed -n 1p

### Test RAID
raid=`cat /proc/mdstat |grep level |awk {'print $12'}`
if [ "$raid" = "[UUUUU]" ]
then raid="BON"
else raid="HORS SERVICE"
fi
echo "$raid";

### Total Memory
free -t |grep Mem |awk '{print $2}'

### Used Memory
free -t |grep Mem |awk '{print $3}'
