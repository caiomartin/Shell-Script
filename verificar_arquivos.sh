#!/bin/bash
###Codigo que verifica se existe arquivos .xlsx criados por mais de 30 min

# Array dos diretorios a ser verificados
diretorios=(
    Diretorio/01 #colocar espaço 
    diretorios/02 #sem espaço. 
)


# Verifica cada diretorio do array
for ((i=0; i<${#diretorios[@]}; i++))
do
    # Pesquisa os aquivos no diretorios com mais de 30 min e retorna a quantidade
    find=$(find ${diretorios[$i]} -name "*.xlsx" -mmin +30 | wc -l)
    
    # Verifica se $find é maior que 0 e add diretorio ao array
    if [[ $find -ge 0 ]];then
        arr_diretorios+="${diretorios[$i]}"            
    fi
    # Soma a quantidade de arquivos de cada diretorio
    total=$[$total+$f]
done

echo "Total de arquivos: "$total
echo "Diretorios que contem os arquivos: "${arr_diretorios[@]}
