#!/bin/bash
echo "ctrl group num test"
cd /sys/fs/resctrl
for((i=0;i<=99;i++));
do
        mkdir test_$i
        if [ $? -eq 0 ]
        then
                echo "success create ctrl group :test_$i "
        else
                break
        fi
done
echo "create num : $i"
cgroup_num_c=$(ls /sys/fs/resctrl|grep -c "test")

for((j=0;j<$i;j++));
do
        rmdir test_$j
        if [ $? -eq 0 ]
        then
                echo "success delete ctrl group :test_$j "
        else
                break
        fi
done

cgroup_num_d=$(ls /sys/fs/resctrl|grep -c "test")
if [ $cgroup_num_d -eq 0 ]
then
        echo "delete all ctrl group success  "
else
        echo "delete all ctrl group fail  "
        ls /sys/fs/resctrl
fi
echo "creat ctrl group max num is : $cgroup_num_c"
