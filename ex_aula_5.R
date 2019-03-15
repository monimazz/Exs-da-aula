#Exercícios da aula 5
#Utilize o banco de dados sobre o Mensalão para responder as perguntas 1 a 5:
library(readr)
bd_csv <- read_delim("BD_CIS0539.csv", ";", escape_double = FALSE, trim_ws = TRUE)
# exercicio 1: Qual é a idade média dos respondentes da pesquisa? E a mediana?
mean(bd_csv$IDADE1)
40.41586
#exercicio 2: Quantos respondentes têm o ensino médio completo?
ensino_medio <- bd_csv$ESCOLA == 5 #o número 5 no questionário significa Colegial ou ensino médio completo.
summary(ensino_medio)
# Mode     FALSE    TRUE 
# logical   504     215 
#Dos entrevistados, 215 possuem ensino médio completo (TRUE);
#exercício 3: Quantas pessoas acreditam que Celso de Mello deveria votar a favor da reabertura do processo do Mensalão, mas acham que ele vai votar contra?
exerc3_1 <- bd_csv [bd_csv$P7 == 1 & bd_csv$P8 == 2,]
View(exerc3_1)
length(exerc3_1$P7)
83 #são 83 pessoas que acreditam que ele deveria votar a favor, mas irá votar contra
#exercício 4: Qual é a idade média dos respondentes que se declaram estagiário/aprendiz?
estagiarios <- bd_csv [bd_csv$PEA == 8,]
mean(estagiarios$IDADE1)
19 #primeiro criei uma planilha com os dados somente dos estagiários, depois tirei a média da idade deles, que chegou no resultado 19. Há uma forma mais fácil em que não seja necessário criar uma planilha nova?
# exercicio 5: Qual é o percentual de respondentes menores de idade?
menor_de_idade <- bd_csv[bd_csv$IDADE1 <= 17,]
25/719
0.03477051 #ao criar a nova tabela, sabemos que são 25 obs menores de idade, como sabemos que o total é de 719 obs, logo pela divisão de 25 por 719 se descobre que os menores de idade representam 3,47% do total da lista
#Utilize o pacote congressbr para responder as perguntas 6 a 10:
library("congressbr")
#ex 6: Crie uma base com os senadores que são suplentes
suplentes <- sen_senator_list(status = "S")
# ex 7: Quantas Medidas Provisórias tramitaram durante o primeiro ano de Dilma?
Dilma_mpvs <- sen_bills_passing(year = "2011", type = "MPV") #acho que é isso, mas não está funcionando, aparece como "No data match your query"
#todavia quando utilizei outra coisa, tive resultado:
Dilma_mpvs <- cham_bills(type = "MPV", year = "2011") #resultou em 36 obs
#8.	Identifique que Poder foi autor da PL 3962/2008 (não vale olhar no Google)
ex8 <- cham_bills(type = "PL", year = "2008", number = "3962")
#Poder Executivo (author 1 name)
#exercicio 9:. A votação da PEC 40/2003 na Câmara, que alterou profundamente a aposentadoria de funcionários públicos, foi uma das mais duras e divisivas do primeiro governo Lula. Identifique os deputados do PT que votaram contra a orientação do governo no segunto turno da votação
ex9 <- cham_votes( type = "PEC", number = 40, year = 2003)
ex9PT <- ex9[ex9$PT_orientation == "Nao",]
ex9PTindentificacao <- ex9PT[ex9PT$legislator_party == "PT",] #somente os que são do PT
##Percebi um problema, eu escolhi os que possuiam a orientação de votar não. Todavia, a orientação de alguns não se manteve na votação, acabando por votar em "sim" ou se abster, logo, refiz o exercicio:
ex9correcao <- ex9[ex9$legislator_party == "PT" & ex9$legislator_vote == "Nao",]
#Para saber quantos são:
ex9correcao <- ex9[ex9$legislator_party == "PT" & ex9$legislator_vote == "Nao" & ex9$rollcall_subject == "SEGUNDO TURNO",] #está errado pois nao adianta somente quem votou nao, pois há abstencao e nao comparecimento a sessao.
ex9correcao1 <- ex9correcao$legislator_vote == "Nao" #outra vez, apenas "nao" nao trará os dados totais dos que distoaram do governo. 
summary(ex9correcao1)
#Mode    TRUE    NA's 
#logical       4       2  Dessa forma, 4 do PT votaram contra
nomes_PT <- ex9correcao$legislator_name
nomes_PT #seus nomes são:
#"Walter Pinheiro", "Baba", "Luciana Genro" e "Joao Fontes" 
