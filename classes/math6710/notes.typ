#import "@local/preamble:0.1.0": *
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#show: project.with(
  course: "MATH6710",
  sem: "Summer",
  title: "Probability Theory I",
  subtitle: "Notes",
  authors: (
    "Shaleen Baral",
  ),
)

= Introduction

We will be covering the following material

+ Measure Theory,
+ Random Variables,
+ Law of Large Numbers,
+ Weak Convergence, Central Limit Theorems.

The main textbook is R. Durrett, Probability, Theory & Examples (5th edition). See the following books for an alternate perspective
- D. WIlliams, Probability with Martingales
- K.L. Chung, A Course in Probability

In _naive_ probability theory, we consider a countable sample space $Omega subset.eq NN$ of possible outcomes and a function $PP: cal(P)(Omega) -> [0, 1]$ such that 
+ $PP(Omega) = 1$
+ If we have disjoint _events_ $A, B in cal(P)(Omega)$ then $PP(A union B) = PP(A) + PP(B)$ _(finite additivity)_

#prop($PP "is monotone"$)[Let $A subset.eq B subset.eq Omega$. Then $ PP(A) <= PP(B) $]
#proof[
  Consider the disjoint events $A$ and $B - A$. Then, 
  $ PP(B) = PP(A) + PP(B - A) >= PP(A). $
]

#prop($PP(A^C)$)[$ PP(A^C) = 1 - PP(A) $]
#proof[
  $ 1 = PP(Omega) = PP(Omega - A) + PP(A) \ implies PP(A^C) = 1 - PP(A). $
]

#prop("inclusion-exclusion")[For any events $A, B subset.eq Omega$, we have  $ PP(A union B) = PP(A) + PP(B) - PP(A sect B). $]
#proof[
  We have $A union B = (A - B) union (B - A) union (A sect B)$. 
]

#corollary("finite subadditivity")[For any events $A, B subset.eq Omega$, we have $ PP(A union B) <= PP(A) + PP(B) $]

*Why should we be dissatisfied with finite additivity?*

Consider an infinite sequence of independent, random variables $ X_j = cases(+1 "w.p." 1/2, -1 "w.p." 1/2) $

We consider the random walk defined by $S_n = sum_(j = 1)^N X_j$. Then, define the event $ A &= {S "visits" 0 "infinitely often"} \ &= sect.big_(N >= 1) underbrace({exists k >= N, S_ k = 0}, A_n) \ &= sect.big_(N >= 1) A_n $

We want to be able to use 'finite observations' or 'approximations', $A_n$ to compute $A$. Ideally, $ PP(A) = lim_(N -> oo) PP(A_N) $

Note that for $N' >= N$, we have $A_(N') subset.eq A_N$. Note also that $ PP(sect.big_(N >= 1) A_N) = 1 - PP(union.big_(N >= 1) A_N^C) $

The sequence of complements is increasing $A_1^C subset.eq A_2^C subset.eq dots$. 

Before moving on note that the prior statement is equivalent to sayign $ PP(B) = lim_(N -> oo) PP(B_N) $ for $B_1 subset.eq B_2 subset.eq dots$ and $B = union.big_(N >= 1) B_N$.

We convert ${B_N}$ to a disjoint family by considering the family given by $B_i \\ B_(i - 1)$ (for convenience, take $B_0 = emptyset$).  Then, using finite additivity, we would like to say

$ PP(B) = lim_(N -> oo) sum_(j = 1)^N PP(B_j \\ B_(j - 1)) $

Equivalently, in our theory of probability we would want, for a _countable_, disjoint family ${C_i}$ the following holds $ PP(union.big_(j = 1)^oo C_j) = sum_(j = 1)^oo PP(C_j). $

*Why do we want countable and not arbitrary additivity*?

Consider a probability measure on $[0, 1]$. Then, if we have arbitrary additivity, $ PP(union.big_(j in I) A_i) = sum_(j in I) PP(A_j), $ it leads to contradictions of the following form 

$ PP(union.big_(j in [0, 1]) j) = sum_(j in [0, 1]) PP({j}) $

The left hand side must be $1$ whereas the equality holds only under very particular probability measures. In fact, this already rules out, for example the uniform measure on $[0, 1]$. 

Now, we move on to actually developing a measure theory that incorporates these ideas.

#definition[$ mu^star (A) = inf {sum_(j = 1)^N |B_j| "for" {B_j} "such that" A subset.eq union.big B_j} \ mu_star (A) = sup {sum_(j = 1)^N |B_j| "for" {B_j} "such that" A subset.eq union.big B_j} $]

#definition("Jordan-measurable")[We call $A$ _Jordan measurable_ if $mu^star (A) = mu_star (A)$.]

#prop[The Jordan measure is finitely additive.]
#proof[Consider disjoint sets $A, B$. Then note that any open cover of $A$ and $B$ give rise to an open cover of $A union B$. From this, we immediately have $mu(A union B) <= mu(A) + mu(B)$.

For the converse, consider a sufficiently fine open cover ${U_i}$ of $A union B$. Then define open covers for $A$ and $B$ as follows. 

]

