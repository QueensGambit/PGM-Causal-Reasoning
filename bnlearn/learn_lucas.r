library(bnlearn)
library(dplyr)
# basic example as shown in: https://arxiv.org/pdf/0908.3817.pdf

# read csv file 
lucas = read.csv("/home/queensgambit/Desktop/WiSe_18_19/PGM/project/PGM-Causal-Reasoning/data/LUCAS/lucas0_train.csv", header = TRUE) 
cina = read.csv("/home/queensgambit/Desktop/WiSe_18_19/PGM/project/PGM-Causal-Reasoning/data/Adult_Cina/adult.data", header = TRUE)

cina_sel = select(cina, race, occupation, relationship, sex, income, workclass, native.country, marital.status, education)

# https://stackoverflow.com/questions/43789278/convert-all-columns-to-characters-in-a-data-frame
# convert dataset into logical and afterwards into factor format
lucas[, ] <- lapply(lucas[, ], as.logical)
lucas[, ] <- lapply(lucas[, ], as.factor)

cina_sel[, ] <- lapply(cina_sel[, ], as.factor)

# show the lucas data represented as a string
print(str(lucas))

learn_bn <- function (data) {
  
  ## Constraint based
  
  # Define plot layout
  par(mfrow = c(1, 3))
  
  # Grow-Shink
  bn.gs <- gs(data)
  plot(bn.gs, main = "Grow-Shrink")
  
  # Incremental Association
  bn.ia <- iamb(data)
  plot(bn.ia, main = "Incremental Association")
  
  par(mfrow = c(1, 3))
  
  # Fast Incremental Association
  bn.fia <- fast.iamb(data)
  plot(bn.fia, main = "Fast Incremental Association")
  
  # Interleaved Incremental Association
  bn.iia <- inter.iamb(data)
  plot(bn.iia, main = "Interleaved Incremental Association")
  
  # Max-Min Parents and Children
  bn.mmpc <- bnlearn::mmpc(data)
  plot(bn.mmpc, main = "Max-Min Parents and Children")
  
  ## Find bayesian networks based on score values
  # Hill Climbing
  
  # Define plot layout
  par(mfrow = c(1, 3))
  
  # Akaike Information Criterion
  bn.hc.aic <- hc(data, score = "aic")
  plot(bn.hc.aic, main = "Akaike Information Criterion")
  
  # Bayesian Information Criterion
  bn.hc.bic <- hc(data, score = "bic")
  plot(bn.hc.bic, main = "Bayesian Information Criterion")
  
  # Bayesian Dirichlet Equivalent Score 
  # bn.hbde <- hc(data, score = "bde")
  # plot(bn.hbde, main = "Bayesian Dirichlet Equivalent Score")
  
  # Log-Likelihood
  bn.hc.ll <- hc(data, score = "loglik")
  plot(bn.hc.ll, main = "Log-Likelihood")
  
  # Tabu Search - Compute the score value

  # Define plot layout
  par(mfrow = c(1, 3))
  
  # Akaike Information Criterion
  bn.hc.aic <- tabu(data, score = "aic")
  plot(bn.hc.aic, main = "Akaike Information Criterion")
  
  # Bayesian Information Criterion
  bn.hc.bic <- tabu(data, score = "bic")
  plot(bn.hc.bic, main = "Bayesian Information Criterion")
  
  # Bayesian Dirichlet Equivalent Score 
  # bn.hbde <- tabu(data, score = "bde")
  # plot(bn.hbde, main = "Bayesian Dirichlet Equivalent Score")
  
  # Log-Likelihood
  bn.hc.ll <- tabu(data, score = "loglik")
  plot(bn.hc.ll, main = "Log-Likelihood")
  
}

# run all bn finder algo and generate the plots
# learn_bn(lucas)
learn_bn(cina_sel)

