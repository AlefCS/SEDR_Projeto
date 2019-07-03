# SEDR - Projeto Final
Trabalho final da disciplina de Sistemas Eletrônicos Digitais Reconfiguráveis (SEDR), realizado com [lucamoura](https://github.com/lucamoura).

## Equipe
* Alef Carneiro de Sousa ([AlefCS](https://github.com/AlefCS))
* Luca Israel de Moura Cruz ([lucamoura](https://github.com/lucamoura))

## Descrição
O trabalho aqui desenvolvido se trata de um Algoritmo Genético que será desenvolvido utilizando-se tanto de códigos em Vivado HLS como em Verilog.

Um Algoritmo Genético é um algoritmo que se baseia na teoria evolutiva de Darwin para resolver problemas de otimização. Assim como outros problemas de otimização, este é um algoritmo que possui um custo computacional considerável e, portanto, convém a utilização de um _hardware_ dedicado para solução do problema.

O fato de haver um _hardware_ dedicado (ao invés de uma CPU de propósito geral), para solução de um problema de Algoritmo Genético, já representa por si só um ganho na performance. Entretanto, neste trabalho também temos a proposta de utilizar paralelização na função de custo do AG para que o ganho seja ainda mais significativo.

## Descrição do Repo
* HLS: esta pasta contém o arquivo .cpp que representa o código fonte do _core_ do Algoritmo Genético, além das funções que são necessárias para sua execução;
* RTL: esta pasta contém o projeto do Vivado em que é realizado o _import_ dos arquivos RTL gerados no Vivado HLS e que foram utilizados para realizar uma simulação.