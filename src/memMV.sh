#!/bin/bash

######################################
# CREADO POR: Carlos Álvarez         #
# Este comando/script auxiliar de    #
# VirtStat. Es llamado desde el      #
# servidor principal para extraer    #
# información de las MV y RAM local  #
#				     #
# FECHA DE CREACIÓN: 12/03/2014      #
# ULTIMA MOD: 12/03/2014             #
######################################

#VARIABLES
mvr="/tmp/mvr"
mvstatustemp="/tmp/mvstatustemp"


### COMIENZO DEL SCRIPT
virsh list |grep -v Id |grep -v "\--" |awk -F" " '{print $2}'| sed '$d' >> $mvr
while read line
      do
           memMVm=`cat /etc/libvirt/qemu/$line.xml |grep  memory | awk -F "<memory'*'>" '{print $1}' |awk -F"</memory>" '{print $1}' |awk -F">" '{print $2}'`
           memMVmb=$(($memMVm / 1024))
           memMVt=$(($memMVt + $memMVmb))
           echo "$line:$memMVmb" >> $mvstatustemp
      done < $mvr
echo "TOTAL ASSIGNED: $memMVt MB" >> $mvstatustemp
rm -f $mvr
