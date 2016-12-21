#!/bin/bash
addr=""
prtlocal=80
prtCont=80
nbr=0
choix=""
i=0
image=""
patern=""

/sbin/ifconfig eth0 | awk '/inet adr:/{print $2}' | awk -F ':' '{print $2}' >result.tmp
read addr < result.tmp

clear && echo "Quel patern utiliser ?"
read patern
clear && echo "Combien de containers à lancer ?"
read nbr
clear && echo "A partir de quel port mapper ?"
read prtlocal
clear && docker images && echo "Quel image utiliser ? Type [REPOSITORY:TAG]"
read image
clear
while [ $i -lt $nbr ]; do
     i=`expr $i + 1`;
     docker run -itd -p $addr:$prtlocal:$prtCont --name=$patern$i $image | exit
     echo "Conteneur n°$i lancé"
     top -n1 | grep 'Cpu(s)'
     prtlocal=`expr $prtlocal + 1`;
     sleep 1
done
echo "Les $nbr conteneurs on été lancé"
rm result.tmp
clear
docker stats
