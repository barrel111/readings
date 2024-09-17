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

= Introduction & Motivation

We will be covering the following material

+ Measure Theory,
+ Random Variables,
+ Law of Large Numbers,
+ Weak Convergence, Central Limit Theorems.

The main textbook is _R. Durrett, Probability, Theory & Examples (5th edition)_. See the following books for an alternate perspective
- _D. WIlliams, Probability with Martingales_
- _K.L. Chung, A Course in Probability_

In _naive_ probability theory, we consider a countable sample space $Omega subset.eq NN$ of possible outcomes and a function $PP: cal(P)(Omega) -> [0, 1]$ such that 
+ $PP(Omega) = 1$
+ If we have disjoint _events_ $A, B in cal(P)(Omega)$ then $PP(A union B) = PP(A) + PP(B)$ _(finite additivity)_

We can deduce a few properties of $PP$ immediately. 

#prop($"Properties of " PP$)[
  Let $A, B subset.eq Omega$. Then 

  + If $A subset.eq B$ then $PP (A) <= PP(B)$ #h(1fr) _(monotonicity)_
  + $PP(A^c) = 1 - PP(A) $ #h(1fr) _(complements)_
  + $PP(A union B) = PP(A) + PP(B) - PP(A sect B)$ #h(1fr) _(inclusion exclusion)_
]
#proof[
  + Consider the disjoint decomposition $A = A union (B \\ A)$, #align(center)[$ PP(B) = PP(A) + PP(B \\ A) >= PP(A). $]

  + Consider the disjoint decomposition $A = A union (Omega \\ A)$, $ 1 = PP(Omega) &= PP(Omega \\ A) + PP(A) \ implies PP(A^c) &= 1 - PP(A). $

  + Consider the disjoint decomposition $A union B = (A \\ B) union (B \\ A) union (A sect B)$, $ PP(A union B) &= PP(A \\ B) + PP(B \\ A) + PP(A sect B) $ Since $A = (A \\ B) union (A sect B)$ and $B = (B \\ A) union (A sect B)$, $ &= PP(A) + PP(B) - 2 PP(A sect B) + PP(A sect B) \ &= PP(A) + PP(B) - PP(A sect B) . $
]

#corollary("finite subadditivity")[For any events $A, B subset.eq Omega$, we have $ PP(A union B) <= PP(A) + PP(B) $]

== Motivating Countable Additivity

Consider an infinite sequence of independent, random variables $ X_j = cases(+1 "w.p." 1/2, -1 "w.p." 1/2) $

We consider the random walk defined by $S_n = sum_(j = 1)^N X_j$. Then, define the event $ A &= {S "visits" 0 "infinitely often"} \ &= sect.big_(n >= 1) underbrace({exists k >= n, S_ k = 0}, A_n) \ &= sect.big_(n >= 1) A_n $

We want to be able to use 'finite observations' or 'approximations', $A_n$ to compute $A$. Ideally, #numbered_eq($ PP(A) = lim_(N -> oo) PP(A_N) $)

Note that for $n' >= n$, we have $A_(n') subset.eq A_n$. Note also that $ PP(sect.big_(n >= 1) A_n) = 1 - PP(union.big_(n >= 1) A_n^C) $

The sequence of complements is increasing $A_1^c subset.eq A_2^c subset.eq dots$. 

Thus, note that eq. (1) is equivalent to saying $ PP(B) = lim_(n -> oo) PP(B_n) $ for $B_1 subset.eq B_2 subset.eq dots$ and $B = union.big_(n >= 1) B_n$.

We convert ${B_n}$ to a disjoint family by considering the family given by $B_i \\ B_(i - 1)$ (for convenience, take $B_0 = emptyset$).  Then, using finite additivity, we would like to say

$ PP(B) = lim_(N -> oo) sum_(j = 1)^N PP(B_j \\ B_(j - 1)) $

Equivalently, in our theory of probability we would want, for a _countable_, disjoint family ${C_i}$ the following holds $ PP(union.big_(j = 1)^oo C_j) = sum_(j = 1)^oo PP(C_j). $

== Problems with Arbitrary Additivity

Consider a probability measure on $[0, 1]$. Then, if we have arbitrary additivity, $ PP(union.big_(j in I) A_i) = sum_(j in I) PP(A_j), $ it leads to contradictions of the following form 

$ PP(union.big_(j in [0, 1]) j) = sum_(j in [0, 1]) PP({j}) $

The left hand side must be $1$ whereas the equality holds only under very particular probability measures. In fact, this already rules out, for example the uniform measure on $[0, 1]$. 

Now, we move on to actually developing a measure theory that incorporates these ideas.

#definition[$ mu^star (A) = inf {sum_(j = 1)^N |B_j| "for" {B_j}_( j = 1 )^n "such that" A subset.eq union.big B_j} \ mu_star (A) = sup {sum_(j = 1)^N |B_j| "for" {B_j}_( j = 1 )^n "such that" A supset.eq union.big B_j} $]

#definition("Jordan-measurable")[A set $A$ is _Jordan measurable_ if $mu^star (A) = mu_star (A)$.]

#prop[The Jordan measure is finitely additive.]
#proof[Consider disjoint sets $A, B$. 

For the forward direction, consider finite covers ${A_i}_( i = 1 )^n$ and ${B_i}_( i = 1 )^n$ of $A$ and $B$ respective. Note that they give rise to a finite cover ${C_i}_(i = 1)^n$ of $A union B$ defined by $C_i = A_i union B_i$. From this, we immediately have $ mu(A union B) <= sum_(i = 1)^N abs(C_i) <= sum_(i = 1)^N abs(A_i) + sum_(i = 1)^N abs(B_i) \ implies mu(A union B) <= mu(A) + mu(B). $.

For the converse, suppose ${C_i}_( i = 1 )^n$ is such that $union_(i = 1)^n C_i subset.eq A union B$. We define finite collections of sets ${A_i}_( i = 1 )^n$ and ${B_i}_(i = 1)^n$ by $A_i = A sect C_i$ and $B_i = B sect C_i$. Then, clearly $union_(i = 1)^n A_i subset.eq A$ and $union_(i = 1)^n B_i subset.eq B$. So, 

  $ mu(A union B) >= sum_(i = 1)^n abs(C_i) = sum_(i = 1)^n abs(C_i sect A) + sum_(i = 1)^n abs(C_i sect B) \ implies mu(A union B) >= mu(A) + mu(B). $

]

= Algebras and Measure

== Definitions
#definition("semialgebra")[A collection $cal(S) subset.eq cal(P)(X)$ of sets is said to be a _semialgebra_ over $X$ if 
+ $nothing, X in cal(S)$
+ $S, T in cal(S)$ implies $S sect T in cal(S)$ #h(1fr) 
+ $S, T in cal(S)$ implies $S - T$ is a finite disjoint union of sets in $cal(S)$ ]

#definition("algebra")[A collection $cal(A) subset.eq cal(P)(X)$ is an _algebra_ over $X$ if 
+ $X in cal(A)$
+ $S, T in cal(A)$ implies $S\\ T in cal(A)$ ]

#prop[A collection $cal(A) subset.eq cal(P)(X)$ is an algebra if and only if it satisfies 
+ $X in cal(A)$
+ $S in cal(A)$ implies $S^c in cal(A)$
+ $S, T in cal(A)$ implies $S sect T in cal(A)$]
#proof[
  - $==>$

  Suppose $cal(A)$ is an algebra over $X$. Then note that $X in cal(A)$. Furthermore, $S in cal(A)$ implies $S^c = X \\ S in cal(A)$. Finally, note that for $S, T in cal(A)$, we have $S sect T = S \\ T^c in cal(A).$

  - $<==$

  Suppose $cal(A) subset.eq cal(P)(X)$ satisfies the given properties. So, $X in cal(A)$. Furthermore, for $S, T in cal(A)$ note that $S \\ T = S sect T^c in cal(A)$. Thus, $cal(A)$ is an algebra over $X$.

]

#corollary[An algebra over $X$ is also a semialgebra over $X$.]

#definition( $sigma"-algebra"$ )[A collection $Sigma subset.eq cal(P)(X)$ s a $sigma$-algebra over $X$ if
+ $Sigma$ is an algebra over $X$
+ ${F_i}_( i in NN ) subset.eq Sigma$ implies $union_(i in NN) F_i in Sigma$]

#lemma[If $cal(F)_i$ for $i in I$ are $sigma$-algebras then $sect_(i = 1)^n cal(F)_i$ is also a $sigma$-algebra.]

#definition[Let $X$ be a set and $cal(F)$ be a collection of subsets of $X$. Then, the _$sigma$-algebra generated by $cal(F)$_ is the intersection of all $sigma$-algebra containing $cal(F)$.]

#remark[The collection of $sigma$-algebras containing $cal(F)$ is non-empty since $cal(P)(X)$ is a $sigma$-algebra containing it. Thus, this is a well-defined concept.]

== Example: Borel Algebra

#definition[]

= Carathéodory's Extension Theorem

= Lebesgue Measure

