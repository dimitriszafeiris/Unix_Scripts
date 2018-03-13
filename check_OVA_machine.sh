#!/bin/bash

################################################################################
echo "-----------------Check menu.lst file for 2 entries-----------------------"
chech_boot_menu=`cat /boot/grub/menu.lst | grep title | wc -l`
if [ $chech_boot_menu -ne 2 ]; then
                echo "Entries at menu.lst file is not equal to 2.Aborting..."
                exit 1
else
                echo "We have 2 entries to menu.lst file.Check passed..."
fi

################################################################################
echo "-----------------Check specific menu list-------------------------------"
cat /boot/grub/menu.lst | grep Linux-Active-primary-None-None
if [ $? -ne 0 ]; then
                echo "We have no entry for Linux-Active-primary-None-None.Aborting..."
                exit 1
else
                echo "We have 1 entry for Linux.Check passed..."
fi

cat /boot/grub/menu.lst | grep Failsafe
if [ $? -ne 0 ]; then
                echo "We have no entry for Failsafe.Aborting..."
                exit 1
else
                echo "We have 1 entry for Failsafe.Check passed..."
fi

##################################################################################
echo "-----------------Check history--------------------------------------------"
#History is kept at file ~/.bash_history file. We will use it to determine if history has been cleared or not.
if [ -s ~/.bash_history ]; then
                echo "We have history on this machine.Aborting..."
                exit 1
else
                echo "We have no history.Check passed..."
fi

##################################################################################
echo "-----------------Check top level rpm--------------------------------------"
host=`hostname | cut -d- -f1`
Sprint=$1
Revision=$2
rpm -qa | grep product-${host}node-version | grep ${Sprint} | grep 0-${Revision}
if [ $? -ne 0 ]; then
                echo "There is no rpm with current typenode.Aborting..."
                exit 1
else
                echo "Top rpm is correct.Check passed..."
fi

##################################################################################
echo "-----------------Check old common platform versions-----------------------"
rpm -qa | grep SMT | grep -v somathing | grep -v somethingelse | grep -v somethingmore | grep 41

if [ $? -eq 0 ]; then
                echo "We have 41 common platform entries.Aborting..."
                exit 1
else
                echo "We have no 41 common platform entries.Check passed..."
fi

##################################################################################
echo "-----------------Check zypper repositories---------------------------------"
zypper lr | grep "No repositories defined"
if [ $? -ne 0 ]; then
                echo "We found zypper repositories.Aborting..."
                exit 1
else
                echo "No zypper repositories found.Check passed..."
fi

##################################################################################
echo "-----------------Check networks--------------------------------------------"
#eth0
ifconfig -a | grep eth0
if [ $? -ne 0 ]; then
                echo "No eth0.Aborting..."
                exit 1
else
                echo "eth0 is okay.Check passed..."
fi

#eth1
ifconfig -a | grep eth1
if [ $? -ne 0 ]; then
                echo "No eth1.Aborting..."
                exit 1
else
                echo "eth0 is okay.Check passed..."
fi

#eth2
ifconfig -a | grep eth2
if [ $? -ne 0 ]; then
                echo "No eth2.Aborting..."
                exit 1
else
                echo "eth2 is okay.Check passed..."
fi

##################################################################################
echo "-----------------Check services--------------------------------------------"
pmc -show . | grep WAITING
if [ $? -eq 0 ]; then
                echo "We have services in WAITING status.Aborting..."
                exit 1
else
                echo "All services are up and running.Check passed..."
fi

: '
Comment:
vmware tools will be checked by transfer and then executing this script to all OVAs.
If this works, this means that vmware  tools will be up and running to all OVAs.
'

##################################################################################
echo "All checks have been passed."
exit 0
