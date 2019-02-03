# PGM-Causal-Reasoning
Experiments on structure learning of Bayesian Networks with emphasis on finding causal relationship

These experiments are done in context of the course Probabilistic Graphical Models (WiSe 18/19) held by Prof. Kristian Kersting at at the Technische Universität Darmstadt.

## Datasets

### Artifical generated data

LUCAS (LUng CAncer Simple set)
* http://www.causality.inf.ethz.ch/data/LUCAS.html

### Real world data

CINA-dataset (Census Is Not Adult dataset)
* http://www.causality.inf.ethz.ch/challenge.php?page=datasets

---

### Frameworks

#### SPFlow - An Easy and Extensible Library for Sum-Product Networks
* https://github.com/SPFlow/SPFlow


#### bnlearn - An R package for Bayesian network learning and inference 
* http://www.bnlearn.com/

#### BNFinder - tool for learning bayesian networks 
* https://github.com/sysbio-vo/bnfinder
* http://bioputer.mimuw.edu.pl/software/bnf/
* https://academic.oup.com/bioinformatics/article/25/2/286/218091
_Note: I needed to install a slightly older version for scipy in order to avoid: https://github.com/scipy/scipy/issues/9606_
```bash
SyntaxError: Non-ASCII character '\xe2'
```
using
```bash
sudo pip2 install scipy==1.1.0
```

#### BayesSpy
* _seems that it doesn't support structure learning functionality_
* https://github.com/bayespy/bayespy

#### OpenGM - a C++ template library for discrete factor graph models and distributive operations
* _seems that it doesn't support structure learning functionality_
* http://hciweb2.iwr.uni-heidelberg.de/opengm/

### References

Graphical Models for Probabilistic and Causal Reasoning, Judea Pearl
* https://link.springer.com/chapter/10.1007%2F978-94-017-1735-9_12#authorsandaffiliations

Towards A Rigorous Science of Interpretable Machine Learning, Finale Doshi-Velez, Been Kim
* https://arxiv.org/abs/1702.08608

Partial orientation and local structural learning of causal networks for prediction, Jianxin Yin, You Zhou, Changzhang Wang, Ping He, Cheng Zheng, Zhi Geng
* http://proceedings.mlr.press/v3/yin08a/yin08a.pdf
