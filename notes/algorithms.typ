#import "@local/preamble:0.1.0": *
#import "@preview/lovelace:0.3.0": *

#show: project.with(
  course: "Algorithms",
  sem: "Winter",
  title: "Algorithms",
  subtitle: "",
  // authors: ("Shaleen Baral",),
)

#let algo(title, body) = {
  // Use the robust table-based layout for guaranteed full-width.
  block(
    width: 100%,
  )[
    #pseudocode-list(
      booktabs: true,
      booktabs-stroke: 1pt + black,
      title: block(width: 100%)[#title], body
    )
  ]
}

= Matchings

== Bipartite Maximum Matching

#definition("matching")[A _matching_ in an undireted graph is an edge set such that every vertex belongs to either one (_matched vertex_) or $emptyset$ (_free vertex_) edges of the matching.]

_#underline[Maximum Matching Problem]: Given a graph $G$, find a matching with as many edges as possible._

Given a graph $G$ and a suboptimal matching $M$, how should we improve it? 

#definition[An $M$-alternating component is an edge set that forms a connected subgraph of $G$ of maximum degree $2$, in which every degree-$2$ vertex belongs to exactly one edge of $M$.]

A connected subgraph of $G$ of maximum degree $2$ must be either a cycle or a path. It is a cycle iff every vertex has degree $2$. A proof for this can be furnished by considering the longest path in the subgraph.
#definition([$M$-augmenting path])[Suppose $G$ is a graph and $M$ is a matching. Then, an $M$-augmenting path in $G$ is a path $P$ in $G$ that starts and ends at free vertices and alternates between edges in $M$ and not in $M$.]

The following are some easy but useful properties of an $M$-augmenting path.

#lemma[Let $P$ be an $M$-augmenting path. Then 
+ $P$ has odd length;
+ $|P \\ M| = |M inter P| + 1.$]
#proof[
  + Let $P = v_0 v_1 ... v_k$. Then $v_i v_(i + 1) in M$ iff $ i equiv 1 (mod 2)$. As $v_k$ is free, we have $v_(k - 1) v_k in.not M$ which implies $(k - 1) equiv 0 (mod 2)$ so that $ell(P) = k equiv 1 (mod 2)$.
  + Let $P = v_0 v_1 ... v_k$. It suffices to show that $P' = v_0 v_1 ... v_(k - 1)$ is such that $|P' \\ M| = |P' inter M|$. For this just consider the $P' inter M -> P' \\ M$ bijection defined by $v_i v_(i + 1) |-> v_(i - 1) v_i$.
]

#prop[If $C$ is an $M$-alternating path then $M xor C$ is a matching such that $ |M xor C| = |M| + |C \\ M| - |M inter C|. $]
#proof[We first show that $M xor C$ is a matching. Consider a vertex $v in M xor C$. It suffices to prove that $v$ is adjacent to exactly one edge of $M xor C$. Note that $M xor C = (M backslash C) union.sq (C backslash M)$ (these induced subgraphs are vertex-disjoint). If $v in M backslash C$ then $v$ is adjacent to exactly one edge in $M backslash C$ as $M$ is a matching. Similarly, if $v in C backslash M$ then there are two cases to consider. First, if $v$ is free then it is only adjacent to one edge in $C$. Second, if $v$ is matched in $M$ then it must be adjacent to exactly one edge in $M inter C$ and one edge in $C backslash M$. Consequently, $v$ is adjacent to exactly one edge in $C backslash M$. 

Thus, $ |M xor C| &= |(M backslash C) union.sq (C backslash M)| \ &= |M backslash C| + |C backslash M| \ &= |M| + |C \\ M| - |M inter C|. $
]

#corollary[If $P$ is an $M$-augmenting path then $M xor P$ is a matching and $ abs(M xor P) = abs(M) + 1. $ Furthermore, every vertex matched in $M$ is also matched in $M xor P$.]<lem:augment-1>
#proof[ As $P$ is an $M$-alternating component, $M xor P$ is a matching. Furthermore, as $|P \\ M| = M inter P| + 1$ we have $M xor P| = |M| + 1$.

Furthermore, $V(M) subset.eq V(M xor P)$. Let $v in M$. Note that if $v in.not P$, then clearly $v in M \\ P subset.eq M xor P$. Otherwise, $v in P$ and as $v$ is not $M$-free, it must be an interior vertex that is adjacent to an edge in $P \\ M$ which implies $v in P \\ M subset.eq M xor P$.

] 

In fact, $M$-augmenting paths completely characterizes the maximum matching problem.


#lemma[If $M$ and $M'$ are matchings in $G$ then $M xor M'$ is a union of $M$-alternating components.]
#proof[Every $v in M xor M'$ has degree $in {1, 2}$ as every vertex has degree at most $1$ in each of $M, M'$ (with degree $1$ in at least one or the other). Furthermore, a vertex $v in M xor M'$ can only be adjacent to at most one edge in $M$ as $M$ is a matching. Thus, $M xor M'$ is a union of $M$-alternating components.

]

#lemma[If $M$ and $M'$ are matchings in $G$ with $|M| < |M'|$ then $M xor M'$ contains an $M$-augmenting path.]<lem:augment-2>
#proof[$M xor M'$ is a union of $M$-alternating components. An $M$-alternating component where all vertices have degree-$2$ must be a cycle. Since the edges must alternate between edges in $M$ and in $M'$, the cycle must have an equal number of edges from $M$ and $M'$. Since $|M| < |M'|$ we must then have an $M$-alternating component that is a path and contains more edges from $M'$ than $M$.

]

This motivates a family of algorithms for the maximum matching problem.

#algo("Computing a Maximum-Matching")[
    + *initialize* $M = nothing$
    + *repeat*
      + $P <-$ *find* an $M$-augmenting path
      + $M <- M xor P$
    + *until* there is no $M$-augmenting path
]

This algorithm terminates in at most $cal(O)(n\/2)$ iterations as each iteration increases the size of the matching by $1$ and a maximum matching has size at most $n\/2$.

Different strategies for finding the $M$-augmenting path $P$ yield different algorithms. 

#definition[A graph $G$ is said to be _bipartite_ if there exists a partition $V(G) = L union.sq R$ such that every edge has exactly one endpoint in $L$ and $R$.]

We now present a simple strategy that works when $G$ is bipartite.

#definition[Let $G=(L, R, E)$ be a bipartite graph and $M$ be a matching. The graph $G_M$ is defined as the directed graph formed from $G$ by orienting each edge from $L$ to $R$ if it does not belong to $M$ and from $L$ to $R$, otherwise.]

#lemma[Let $M$ be a matching in a bipartite graph $G$ and $F$ be the set of free vertices. The $M$-augmenting paths are in one-to-one correspondence with directed paths from $L inter F$ to $R inter F$ in $G_M$.]
#proof[
  Let $P$ be a directed path from $L inter F$ to $R inter F$ in $G_M$. First, its endpoints are free with respect to $M$. Since $G_M$ is bipartite, its edges alternate from edges $L -> R$ and edges $R -> L$. That is, the edges alternate from edges in $M$ and not in $M$. Thus, the undirected edge set corresponding to $P$ is an $M$-augmenting path.
  
  Next, let $P$ be an augmenting path. Note that $P$ has odd length, and hence, its endpoints are on opposite sides of the partition $(L, R)$. Since its endpoints are also free, it suffices to show that $P$ corresponds to a directed path in $G_M$. Note that every interior vertex of $P$ has exactly one edge in $M$ and one edge not in $M$. The former edge corresponds to a directed edge $R -> L$  and the latter corresponds to a directed edge $L -> R$. Thus, $P$ corresponds to a directed path in $G_M$ from $L inter F$ and $R inter F$. ]

This gives us a natural algorithm for maximum-matching in a bipartite graph. We merely build $G_M$ and find a path from $L inter F$ to $R inter F$ using BFS/DFS. Building $G_M$ and performing BFS/DFS both take $O(m + n)$ time. We may also assume $m >= n\/2$; otherwise, the graph contains isolated edges which can be removed in a preprocessing step taking $cal(O)(n)$ times. Thus, overall, we get a $cal(O)(m n)$ algorithm for maximum-matching in bipartite graphs.

== Hopcroft-Karp Algorithm

Choosing only one augmenting path at a time is quite wasteful. The Hopcroft-Karp algorithm improves upon this by attempting to find many disjoint augmenting paths in every iteration. We start with the following generalization of @lem:augment-1 and @lem:augment-2.

#definition[A set of subgraphs ${G_i}$ are _(externally) vertex-disjoint_ if they share no vertices. A set of paths ${P_i}$ are said to be _internally vertex-disjoint_ if they share no vertices other than their endpoints.]

#lemma[If $G$ is a graph and $M$ is a matching $G$ then the following are equivalent for all $k in NN$
+ there exists a matching $M'$ with $|M| + k$ edges;
+ $G$ contains $k$ vertex-disjoint $M$-augmenting paths;
+ there exists a matching $M'$ such that the edge set $M xor M'$ contains at least $k$ vertex-disjoint $M$-augmenting paths.]<lem:augment-f>
#proof[
- $a. => c.$ \ Consider $M'$ such that $|M'| = |M| + k$. Note that $M xor M' = (M \\ M') union.sq (M' \\ M)$ with $|M' \\ M| = |M \\ M'| + k$. Every vertex $v in M xor M'$ has degree $in {1, 2}$ as every vertex has degree at most $1$ in each of $M$, $M'$ and degree $1$ in at least one of $M$, $M'$. Thus, $M xor M'$ must be a union of vertex-disjoint paths and cycles. As $M$ and $M'$ are matchings, each vertex of degree $2$ in $M xor M'$ is adjacent to exactly one edge from $M$ and one edge from $M'$. Since a cycle can be alternating only if it has even length, it has an equal number of edges from $M$ and $M'$. Since $|M' \\ M| = |M \\ M'| + k$, there must be at least $k$-many $M$-alternating paths in $M xor M'$.

- $c. => b.$ \ This is immediate by noting that $M xor M' subset.eq E(G)$.

- $b. => a.$ \  It suffices to show that if $P$ and $P'$ are vertex disjoint $M$-augmenting paths then $P'$ is also a $(M xor P)$-augmenting path. As $P$ and $P'$ are vertex-disjoint, they are edge disjoint too. Since endpoints of $P'$ aren't adjacent to edges in $M$ or $P$, they will be free with respect to $M xor P$ too. Next, any edge of $M inter P' subset.eq M \\ P$ is still in $M xor P$. Furthermore, any edge of $P' \\ M$ isn't contained in $M$ or $P$ and hence, isn't an edge in $M xor P$. Thus, $P'$ is $(M xor P)$-alternating. ]

Again, we shall assume $G$ is bipartite. As always, we start with some helpful definitions to frame our algorithm. 

#definition[In the graph $G_M$, define $L_0, L_1, ..., L_oo$ to be the levels in a breadth-first traversal rooted at $L inter F$. That is, $ L_0 = &L inter F, \ L_(i + 1) = &"all vertices" v in.not union.big_(k = 0)^i L_k "s.t." G_M \ &"contains an edge from" L_i "to" v, \ L_oo = &"all vertices" v in.not union.big_(k = 1)^n L_k. $]


#definition[An edge $e = (u, v)$ is an _advancing edge_ if $u in L_i$ and $v in L_(i + 1)$. Otherwise, we call it a _retreating edge_. A path composed entirely of advancing edges is called an _advancing path_.]

By definition, if $e$ is an edge going from $L_i$ to $L_j$ for $j > i$, then we must have $j = i + 1$. Furthermore, $L_i$ consists of all vertices that are at a distance of $i$ from $L_0$.
The following lemma then somewhat clarifies the importance of advancing edges.

#lemma[ If $e = (u, v)$ is an advancing edge we must have $d(v) > d(u) => d(v) = d(u) + 1$.]

That is, an $s$-$t$ path $P$ is a shortest $s$-$t$ path if and only if it is an advancing path.

#definition[A _blocking set_ of $M$-augmenting paths is a maximal (under set-inclusion) set of vertex-disjoint advancing $M$-augmenting paths.]

#algo("Hopcroft-Karp Algorithm")[
  + $M = nothing$
  + *repeat*
    + ${P_i}_k<-$ *find* a blocking set of $M$-augmenting paths
    + $M <- M xor P_1 xor ... xor P_k$ 
  + *until* there is no $M$-augmenting path
]

As before, we know that this algorithm terminates in at most $n/2$ iterations as each iteration increases the cardinality of $M$ by at least $1$. To obtain a superior bound, we need to also integrate an alternative measure of progress. Particularly, we shall show that the length of the shortest augmenting path is strictly increasing every iteration. Intuitively, this occurs because augmenting by a path reverses the orientation of all its edges and hence, any future $s$-$t$ path taking these edges must be longer than the shortest $s$-$t$ paths available prior.

#lemma[If $M_t$ and $M_(t + 1)$ are the matchings in two consecutive iterations of the Hopcroft-Karp algorithm, the length of the shortest $M_(t + 1)$-augmenting path is strictly greater than the length of the shortest $M_t$-augmenting path.]
#proof[Let $L_0, L_1, ...$ denote the BFS layers of $G_(M_t)$ and suppose $d in NN$ is minimal such that $L_d$ intersects $R inter F$. Furthermore, suppose $P = u_0 u_1 ... u_j$ is a shortest $M_(t + 1)$-augmenting path. Note that $u_0, u_j$ must be free with respect to $M_t$ as once a vertex is matched, it remains matched after augementation too. Below $d(dot)$ denotes the distance in $G_(M_t)$ from $L inter F$. Edges $(u_i, u_(i + 1))$ were either 
+ advancing edges in $G_M_t$ whose orientation is reversed in $G_(M_(t + 1))$ because $(u_(i + 1), u_i)$ belonged to a blocking set $cal(P)$ \ $ d(u_(i)) = d(u_(i + 1)) + 1 $
+ advancing edges in both $G_M_t$ $ d(u_(i + 1)) = d(u_i) + 1 $
+ reversing edges in $G_M_t$ $ d(u_(i + 1)) < d(u_i) $
Thus, in all cases we have $d(u_(i + 1)) <= d(u_i) + 1$. Inductively, $d <= d(u_j) <= j$. Note that $d(u_j) = j$ if and only if $P$ is an advancing path in $G_M$. This implies that $P$ is edge disjoint from $M_t xor M_(t + 1)$. Since $P$ wasn't used as an augmenting path in iteration $t$, it must be the case that there exists $v in V(M_t xor M_(t + 1)) inter V(P)$. Note that $v$ cannot be the endpoints of $P$ as the endpoints of $P$ are $M_t$-free. So, $v$ is an interior vertex of $P$. As $v in M_t xor M_(t + 1)$, it must be adjacent to an edge $e in M_t xor M_(t + 1)$. However, as $P$ is $M_(t + 1)$-augmenting, for every interior vertex $v' in P$, the incident edge from $M_(t + 1)$ is contained in $P$. Thus, $e in M_t xor M_(t + 1) inter P$, contradicting the edge-disjointness of $P$ from $M_t inter M_(t + 1)$. ]

Note that as augmenting paths are of odd length, each iteration increases the length of the shortest $M$-augmenting path by at least two.
Using these measures of progress independently, we get the same bound of $n\/2$ on the number of iterations. Using these two measures in different phases of the algorithm yields a superior bound.

#prop[For any $t <= n/2$, the number of iterations of Hopcraft-Karp is bounded by $t + n\/2t$.]
#proof[After $t$ iterations, the length of the shortest $M$-augmenting path is at least $2 t$. Then let $k = |M^star| - |M^t|$. Note that $M$ must have at least one augmenting path with vertices at most $n/k$. Hence, $2 t <= n/k => k <= n/(2t)$. Thus, the runtime is bounded by $t + k <= t + n/(2t)$.]

Using the AM-GM inequality, we note that $sqrt(2 n) <= t + n/(2t)$ with equality obtained when $t = sqrt(n/2)$. 

#corollary[Hopcroft-Karp terminates in at most $cal(O)(sqrt(n))$ iterations.]

== Min-Cost Bipartite Perfect Matching, LP Relaxation

_#underline("Minimum-Cost Bipartite Perfect Matching"): Given an undirected bipartite graph $G = (L, R, E)$ together with costs $c: E -> RR_(>= 0)$ for each edge, find a perfect matching $M$ that minimizes $c(M) = sum_(e in M) c(e)$._

Without loss of generality, we shall assume that a perfect matching exists as we have already discussed algorithms capable of detecting this.

#definition[Let $M$ be a matching. Then $c: E -> RR_(>= 0)$ induces a cost function $c_M: E -> RR$ defined by 
$ c_M (e) = bb(1){e in.not M} dot c(e) - bb(1){e in M} dot c(e). $]

This induced cost is natural for $M$-augmenting paths due to the following lemma.
#lemma[If $P$ is an $M$-augmenting path then $ c(M xor P) = c(M) + c_M (P).$]

This motivates a greedy algorithm for our problem. Note that bipartiteness is not required yet.
#algo("Greedy Algorithm for Min-Cost Perfect Matching")[
  + $M = nothing$
  + *while* $M$ is not a perfect matching *do*
    + $P <-$ *find* an $M$-augmenting path minimizing $c_M (dot)$
    + $M <- M xor P$
  + *end while*
]

Correctness follows from a proof by induction showing that at iteration $t$, we have the minimum-cost matching of cardinality $t$.

#lemma[If $M_k$ is a minimum-cost matching of size $k$ in $G$ and $P$ is an $M_k$-augmenting path of minimum incremental cost, then $M_k xor P$ is a minimum-cost matching of size $k + 1$.]
#proof[Let $M_(k + 1)$ denote the minimum-cost matching of size $k + 1$. By definition, we must have $c(M_(k + 1)) <= c(M_k xor P)$. 

Now, we prove the reverse inequality. $M_k xor M_(k + 1)$ is a union of alternating components that must contain at least one $M_k$-alternating path $Q$ as $|M_(k + 1)| = |M_k| + 1$. Let $R$ denote the union of the remaining alternating components. Note that $R$ must have the same number of edges in $M_k$ and in $M_(k + 1)$ since the path $Q$ already accounts for $|M_(k + 1)| = |M_k| + 1$. So, $M_k xor R$ is a $k$-matching and $M_(k + 1) xor R$ is a $(k + 1)$-matching. From this, it is immediate that $c_M_k (R), c_M_(k + 1)(R) >= 0$ via
$ c(M_k) <= c(M_k xor R) = c(M_k) + c_(M_k)(R), \ c(M_(k + 1)) <= c(M_(k + 1) xor R) = c(M_(k + 1)) + c_(M_(k + 1))(R). $

Furthermore, we have $c_(M_k)(R) + c_(M_(k + 1))(R) = 0$ which implies $c_(M_k)(R) = c_(M_(k + 1))(R) = 0$.
$ c_(M_k)(R) + c_(M_(k + 1))(R) &= c(R \\ M_k) - c(R inter M_k) + c(R \\ M_(k + 1)) - c(R inter M_(k + 1)) \ &= c(R inter M_(k + 1)) - c(R inter M_k) + c(R inter M_k) - c(R inter M_(k + 1)) \ &= 0. $

Then, as $Q$ is an $M_k$-alternating path, we have $c_(M_k)(P) <= c_(M_k)(Q)$. Using this, we obtain our result
$ c(M_k xor P) &= c(M_k) + c_M_k (P) \ &<= c(M_k) + c_M_k (Q) \ &= c(M_k) + c_M_k (Q) + c_M_k (R) \ &= c(M_k) + c_M_k (M_k xor M_(k + 1)) \ &= c(M_k xor (M_k xor M_(k + 1))) \ &= c(M_(k + 1)). $

]

Implementing this algorithm requires us to find shortest $c_M$-weighted aternating paths. Assuming $G$ is bipartite, we can construct $G_M$ and reduce the problem to finding the minimum-cost path in $G_M$ from $L inter F$ to $R inter F$. A directed edge $(u, v)$ has cost $c(u, v)$ if $(u, v) in.not M$ and has cost $-c(v, u)$ if 


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
