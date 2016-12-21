#!/bin/bash
patern=""
nomContainer=""
suffix=0
nbr=0
i=0

echo "Entrez le partern de vos containers à supprimer."
read patern
echo "Entrez votre suffix de départ."
read suffix
echo "Combien de containers à suprimer ?"
read nbr

while [ $i -lt $nbr ]; do
     nomContainer="$patern$suffix"
     docker stop $nomContainer && docker rm $nomContainer
     suffix=`expr $suffix + 1`;
     i=`expr $i + 1`;
done
echo "Terminé"
