#import "@local/preamble:0.1.0": *
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#show: project.with(
  course: "Mathematics",
  sem: "Summer",
  title: "Graph Theory",
  subtitle: "from Diestel.",
  authors: (
    "Shaleen Baral",
  ),
)

= Basics
== Graphs

#definition[A _graph_ a pair $G = (V, E)$ such that $E subset.eq [V]^2$. For clarity, we assume that $V sect E = emptyset$. The elements of $V$ are the _vertices_ of the graph $G$ and the elements of $E$ are its _edges_. ]

#definition[The _order_ of a graph, written $abs(G)$, is the number of vertices of $G$. The number of edges of $G$ is denotes by $abs(abs(G))$. Graphs are _finite_, _infinite_, _countable_ and so on according to their order.]

#example[The _empty graph_ is $(emptyset, emptyset)$, also denotes as $emptyset$ simply.]

#example[A graph of order $0$ or $1$ is also known as a _trivial_ graph.]

#definition[A vertex $v$ is _incident_ with an edge $e$ if $v in e$; then $e$ is an edge _at_ $v$. The two vertices incident with an edge are its _endvertices_ or _ends_, and an edge _joins_ its ends.]

#definition[An edge ${x, y}$ is usually written as $x y$ (or $y x$). If $x in X$ and $y in Y$, then $x y$ is an $X"-"Y$ _edge_. The set of all $X"-"Y$ edges in a set $E$ is denoted by $E(X, Y)$. ]

#remark[Instead of $E({x}, Y)$ and $E(X, {y})$, we write $E(x, Y)$ and $E(X, y)$. The set of all the edges in $E$ at a vertex $v$ is denoted by $E(v)$.]

#definition[Two vertices $x, y$ of $G$ are _adjacent_ or _neighbors_ if $x y$ is an edge of $G$. Two edges $e != f$ are adjacent if they have an end in common.]

#example[If all the vertices of $G$ are pairwise adjacent, then $G$ is _complete_. A complete graph on $n$ vertices is denoted $K^n$. ]

#definition[A set of vertices or edges is _independent_ if no two of its elements are adjacent. Independent sets of vertices are also called _stable_.]

#definition[Let $G = (V, E)$ and $G' = (V', E')$. A map $phi: V arrow V'$ is a _homomorphism_ from $G$ to $G'$ if it preserves the adjacency of vertices, that is, if ${phi(x), phi(y)} in E'$ whenever ${x, y} in E$.]

#lemma[For every vertex $x'$ in the image of $phi: G arrow G'$, its inverse image $phi^(-1)(x')$ is an independent set of vertices in $G$.]

#definition[If $phi$ is bijective and its inverse $phi^(-1)$ is also a homomorphism (i.e. $x y in E arrow.r.l.double.long phi(x) phi(y) in E'$ for all $x, y in V$), we call $phi$ an _isomorphism_. We also say $G$ and $G'$ are isomorphic as denoted by $G tilde.eq G'$ (or even simpler, $G = G'$, when we only care about the _isomorphism type_ of a given graph)]

#definition[An isomorphism from $G$ to itself is an _automorphism_ of $G$.]

#definition[A class of graphs that is closed under isomorphism is called a _graph property_.]

#example[Containing a triangle is a graph property.]

#definition[A map taking graphs as arguments is called a _graph invariant_ if it assigns equal values to isomorphic graphs.]

#example[The number of vertices and the number of edges are graph invariants. The greatest number of pairwise adjacent vertices is also another one.]

#definition[We define $G union G' = (V union V', E union E')$ and $G sect G' = (V sect V', E sect E')$. If $G sect G' = emptyset$ then $G$ and $G'$ are _disjoint_.]

#definition[If $V' subset.eq V$ and $E' subset.eq E$, then $G'$ is _subgraph_ of $G$ (and $G$ a _supergraph_ of $G'$), written $G' subset.eq G$. If $G' subset.eq G$ but $G' != G$ then $G'$ is a _proper subgraph_ of $G$.]

#remark[]

#definition[If $G' subset.eq G$ and $G'$ contains all the edges $x y in E$ with $x, y in V'$, then $G'$ is an induced subgraph of $G$; we say that $V'$ _induces_ or _spans_ $G'$ in $G$.]

#remark[If $U subset.eq V$ is any set of vertices, then $G[U]$ denotes the graph on $U$ whose edges are precisely the edges of $G$ with both ends in $U$.]

= Matchings, Covering, Packing
= Connectivity
= Flows
= Hamilton Cycles
