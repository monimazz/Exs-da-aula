#Exercicios aula 2

#ex_1 (use a funcao seq para criar a seguinte sequencia: 2, 5, 8, 11)
ex_1 <- seq(2,11, by=3)

#ex_2 (use a funcao rep para criar a seguinte sequencia: 1,2,3,4,1,2,3,4,1,2,3,4)
rep(1:4, 3, NA, 1)

#ex_3 (use a fun??o rep para criar a seguinte sequencia: 1,1,1,2,2,2,3,3,3,4,4,4)
rep(1:4, 1, NA, 3)

#Para os exercicios 4 a 9, voce vai precisar carregar uma base de dados did?tica que j? vem instalada no R. Para fazer isso, rode o comando  bd <- mtcars, e voc? ver? um dataframe chamado bd no seu ambiente. Examine a documenta??o da base de dados com o comando help(mtcars), e use o comando View(bd) para inspecionar visualmente a base de dados.
bd <- mtcars

#ex_4 crie um novo objeto que contenha carros cujo consumo(mpg) esteja entre 15 e 20
ex_4 <- mtcars$mpg
ex_4a <- mtcars[ex_4 >= 15 & ex_4 <= 20,]

#ex_5 Crie um novo objeto que contenha apenas os carros com transmiss?o automo?tica e valor de cyl igual a 6.
ex_5 <- mtcars$cyl
ex_5a <- mtcars[ex_5 == 6,]

#ex_6 Crie um novo objeto que contenha apenas os carros cujos valores de gear ou  carb sejam iguais a 0.
ex_6 <- mtcars [mtcars$gear ==0| mtcars$carb == 0,]

#ex_7 Crie um novo objeto que tenha apenas as linhas pares de bd.
ex_7 <- mtcars[c(FALSE, TRUE),]

#ex_8 Rode o comando TRUE * FALSE e explique o resultado.
TRUE*FALSE
0 #TRUE = 1 E FALSE = 0, Logo, 0*1=0

#ex_9 Troque todos os valores 0 por 2 na coluna am
bd[bd$am] <- 2

#ex_10 Rode os comandos abaixo e explique o resultado
x <- c(2, 4, 6, 8)
y <- c(TRUE, TRUE, FALSE, TRUE)
sum(x[y])
14
#explicacao: 2 4 0 8, pois 2,4 e 8 s?o TRUE em Y e 6 ? FAlSE, logo 0. Logo, a soma ? 14

#ex_11 O NEP -  calculado dividindo-se 1 pelo somat?rio do quadrado das propor??es de votos ou de cadeiras obtidos pelos partidos em uma dada elei??o conforme a f?rmula abaixo, onde indica a fra??o de votos ou cargos obtidos pelo partido
#ex_ 11 Calcule o NEP
cadeiras <- c(55, 54, 38, 35, 34, 33, 32, 31, 30, 28, 27, 13, 11, 10, 10, 10, 8, 8, 8, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1)
prop_cadeiras <- cadeiras / sum(cadeiras) # propor??es de cadeiras por partido
prop_cadeiras_quad <- prop_cadeiras^2
NEP <- 1 / sum(prop_cadeiras_quad) # aplica??o da f?rmula

# No R, geralmente existe mais de um jeito de fazer as coisas. Esta ? outra alternativa de c?lculo, resolvendo a conta em apenas uma linha (mas com c?digo mais denso)
1 / sum((cadeiras / sum(cadeiras))^2)
16.20399
