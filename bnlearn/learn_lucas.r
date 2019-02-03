library(bnlearn)

# basic example as shown in: https://arxiv.org/pdf/0908.3817.pdf

# read csv file 
lucas = read.csv("/home/queensgambit/Desktop/WiSe_18_19/PGM/project/PGM-Causal-Reasoning/data/LUCAS/lucas0_train.csv", header = TRUE) 

# https://stackoverflow.com/questions/43789278/convert-all-columns-to-characters-in-a-data-frame
# convert dataset into logical and afterwards into factor format
lucas[, ] <- lapply(lucas[, ], as.logical)
lucas[, ] <- lapply(lucas[, ], as.factor)

# show the lucas data represented as a string
print(str(lucas))

# apply different struture learning algorithms
bn.gs <- gs(lucas)
bn2 <- iamb(lucas)
bn3 <- fast.iamb(lucas)
bn4 <- inter.iamb(lucas)

# compare the found graph structures between them
compare(bn.gs, bn2)
compare(bn.gs, bn3)
compare(bn.gs, bn4)

# compute the score value
bn.hc <- hc(lucas, score = "aic")
bn.hc
compare(bn.hc, bn.gs)

# plot the found structures
par(mfrow = c(1,2))
plot(bn.gs, main = "Constraint-based algorithms") #, highlight = highlight.opts)
plot(bn.hc, main = "Hill-Climbing") #, highlight = highlight.opts)

# plot using graphviz
highlight.opts <- list(nodes = c("Smoking"), arcs = c("Smoking", "Yellow_Fingers"), col = "red", fill = "grey")
graphviz.plot(bn.gs, title("Constraint-based algorithms"), highlight = highlight.opts)
graphviz.plot(bn.hc, title("Hill Climbing"), highlight = highlight.opts)
