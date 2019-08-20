#!/bin/bash


diretorios=(
    /home/caiomartins/Documentos/shell/opt/01  
    /home/caiomartins/Documentos/shell/opt/02   
)

for ((i=0; i<${#diretorios[@]}; i++))
do
    f=$(find ${diretorios[$i]} -name "*.xlsx" -mmin +30 | wc -l)
    
    if [[ $f -ge 0 ]];then
        arr+="${diretorios[$i]}"            
    fi
    
    total=$[$total+$f]
done

echo $total
echo ": "${arr[@]}