#!/bin/bash
addr=""
prtlocal=80
prtCont=80
nbr=0
choix=""
i=0

clear && echo "Entrez le nombre de containers que vous voulez lancer : "
read nbr
clear && echo "Entrez l'adresse local de votre machine hôte pour le mapping"
read addr
clear && echo "Entre le port ou tu veux que le mapping commence (incrémentation +1 par containers)"
read prtlocal

while [ $i -lt $nbr ]; do
     i=`expr $i + 1`;
     echo "Lacement du conteneur n°$i Mapping du Port $prtlocal sur $prtCont"
     docker run -itd -p $addr:$prtlocal:$prtCont --name=containera$i lolight/test:v2 | exit
     echo "Conteneur n°$i lancé"
     prtlocal=`expr $prtlocal + 1`;
     echo "Debug : Port Container $prtCont - Ip addresse : $addr -"
done
echo "Les $nbr conteneurs on été lancé"
clear
docker info
