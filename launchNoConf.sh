#!/bin/bash
nbr=0
choix=""
i=0
echo "Entre le nombre de containers que tu veux lancer : "
read nbr

while [ $i -lt $nbr ]; do
     i=`expr $i + 1`;
     echo "Lacement du conteneur n°$i"
     docker run -itd --name=container$i lolight/test:v2 | exit
     echo "Conteneur n°$i lancé"
done
echo "Les $nbr conteneurs on été lancé
clear
docker info
