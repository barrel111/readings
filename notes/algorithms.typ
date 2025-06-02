#import "@local/preamble:0.1.0": *

#show: project.with(
  course: "Algorithms",
  sem: "Winter",
  title: "Algorithms",
  subtitle: "",
  // authors: ("Shaleen Baral",),
)

= Matchings

== Bipartite Maximum Matching

#definition("matching")[A _matching_ in an undireted graph is an edge set such that every vertex belongs to either one (_matched vertex_) or $emptyset$ (_free vertex_) edges of the matching.]

_#underline[Maximum Matching Problem]: Given a graph $G$, find a matching with as many edges as possible._

Given a graph $G$ and a suboptimal matching $M$, how should we improve it? 

#definition([$M$-augmenting path])[Suppose $G$ is a graph and $M$ is a matching. Then, an $M$-augmenting path in $G$ is a path $P$ in $G$ that starts and ends at free vertices and alternates between edges in $M$ and not in $M$.]

#lemma[If $P$ is an $M$-augmenting path then $M xor P$ is a matching and $ abs(M xor P) = abs(M) + 1. $]
#proof[ Consider a vertex $v in M xor P$. It suffices to prove that $v$ is adjacent exactly one edge of $M xor P$. Note that $M xor P = (M backslash P) union.sq (P backslash M)$. If $v in M backslash P$ then $v$ is adjacent to exactly one edge in $M backslash P$ as $M$ is a matching. Similarly, if $v in P backslash M$ then there are two cases to consider. First, if $v$ is free with respect to $M$, then $v$ is an endpoint of $P$ and hence, is only adjacent to one edge in $P$. Second, if $v$ is matched with respect to $M$, then $v$ must be an interior vertex of $P$ as it isn't free. Thus, it must be adjacent to exactly one edge in $M$ and one edge not in $M$. Consequently, $v$ is adjacent to exactly one edge in $P backslash M$.

Note that $P$ alternates between edges in $M$ and not in $M$ and starts and ends with edges not in $M$. We have $abs(P backslash M) = abs(M) + 1$ and $abs(M inter P) = abs(M)$. Thus, $abs(M xor P) = abs(M) + 1$.

] 

== Hopcroft-Karp Algorithm

== Min-cost Bipartite Perfect Matching, LP Relaxation

== _Mise en Place_ : Ski-Rental Problem

== Online Matching

== Algebraic Algorithms

// = Linear Programming
//
// == Definition
//
// == Duality
//
// == Simplex Method
//
// == Strong Duality
//
// == Separation Oracles
//
// == Ellipsoid Algorithm
//
// = Network Flow
//
// == Minimum Cut
//
// == Maximum Flow
//
// == Ford-Fulkerson
//
// == Dinitz's Algorithm
//
// == Applications
//
// = Multicommodity Flow
//
// == Sparsest Cut & Multicommodity Flow
//
// == _Mise en Place_: The Chernoff Bound
//
// == Randomized Rounding for Approximate Congestion Minimization
//
// == Approximate Max-Flow Min-Cut
//
// = Multiplicative Weights
//
// == Halving & Weighted Majority
//
// == Hedge
//
// == Minimax Theorem
//
// == Solving Multicommodity Flow
//
// = Spectral Methods
//
// == Graph Laplacian
//
// == Degree-weighting & Normalization
//
// == Cheeger's Inequality
//
// == Max-Cut and the Goemans-Williamson Algorithm
//
// = Markov Chains
//
// == Sampling Problems
//
// == Metropolis Algorithm
//
// == Mixing Times and Couplings
//
// == Sampling Matchings
