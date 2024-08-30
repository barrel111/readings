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

Here, we outline a lot of basic definitions.

#definition[A set $cal(A) = {A_1, dots, A_k}$ of disjoint subsets of $A$ is a _partition_ of $A$ if the union $union.big cal(A)$ of all the sets $A_i in cal(A)$ is $A$. Another partition ${A_1', dots, A'_ell}$ of $A$ _refines_ the partition $cal(A)$ if each $A_i'$ is contained in some $A_j$.]

#definition[By $[A]^k$ we denote the set of all _$k$-element subsets_ of $A$. Furthermore, sets with $k$ elements are also known as _$k$-sets_; subsets with $k$ elements are _$k$-subsets_.]

#definition[A _graph_ a pair $G = (V, E)$ such that $E subset.eq [V]^2$. For clarity, we assume that $V sect E = emptyset$. The elements of $V$ are the _vertices_ of the graph $G$ and the elements of $E$ are its _edges_. ]

#definition[The _order_ of a graph, written $abs(G)$, is the number of vertices of $G$. The number of edges of $G$ is denotes by $norm(G)$. Graphs are _finite_, _infinite_, _countable_ and so on according to their order.]

#example[The _empty graph_ is $(emptyset, emptyset)$, also denotes as $emptyset$ simply.]

#example[A graph of order $0$ or $1$ is also known as a _trivial_ graph.]

#definition[A vertex $v$ is _incident_ with an edge $e$ if $v in e$; then $e$ is an edge _at_ $v$. The two vertices incident with an edge are its _endvertices_ or _ends_, and an edge _joins_ its ends.]

#definition[An edge ${x, y}$ is usually written as $x y$ (or $y x$). If $x in X$ and $y in Y$, then $x y$ is an $X"-"Y$ _edge_. The set of all $X"-"Y$ edges in a set $E$ is denoted by $E(X, Y)$. ]

#remark[Instead of $E({x}, Y)$ and $E(X, {y})$, we write $E(x, Y)$ and $E(X, y)$. The set of all the edges in $E$ at a vertex $v$ is denoted by $E(v)$.]

#definition[Two vertices $x, y$ of $G$ are _adjacent_ or _neighbors_ if $x y$ is an edge of $G$. Two edges $e != f$ are adjacent if they have an end in common.]

#example[If all the vertices of $G$ are pairwise adjacent, then $G$ is _complete_. A complete graph on $n$ vertices is denoted $K^n$. ]

#definition[A set of vertices or edges is _independent_ if no two of its elements are adjacent. Independent sets of vertices are also called _stable_.]

#definition[Let $G = (V, E)$ and $G' = (V', E')$. A map $phi: V arrow V'$ is a _homomorphism_ from $G$ to $G'$ if it preserves the adjacency of vertices, that is, if ${phi(x), phi(y)} in E'$ whenever ${x, y} in E$.]

#lemma[For every vertex $x'$ in the image of the homomorphism $phi: G arrow G'$, its inverse image $phi^(-1)(x')$ is an independent set of vertices in $G$.]

#definition[If $phi$ is bijective and its inverse $phi^(-1)$ is also a homomorphism (i.e. $x y in E arrow.r.l.double.long phi(x) phi(y) in E'$ for all $x, y in V$), we call $phi$ an _isomorphism_. We also say $G$ and $G'$ are isomorphic as denoted by $G tilde.eq G'$ (or even simpler, $G = G'$, when we only care about the _isomorphism type_ of a given graph)]

#definition[An isomorphism from $G$ to itself is an _automorphism_ of $G$.]

#definition[A class of graphs that is closed under isomorphism is called a _graph property_.]

#example[Containing a triangle is a graph property.]

#definition[A map taking graphs as arguments is called a _graph invariant_ if it assigns equal values to isomorphic graphs.]

#example[The number of vertices and the number of edges are graph invariants. The greatest number of pairwise adjacent vertices is also another one.]

#definition[We define $G union G' = (V union V', E union E')$ and $G sect G' = (V sect V', E sect E')$. If $G sect G' = emptyset$ then $G$ and $G'$ are _disjoint_.]

#definition[If $V' subset.eq V$ and $E' subset.eq E$, then $G'$ is _subgraph_ of $G$ (and $G$ a _supergraph_ of $G'$), written $G' subset.eq G$. If $G' subset.eq G$ but $G' != G$ then $G'$ is a _proper subgraph_ of $G$.]

#definition[If $G' subset.eq G$ and $G'$ contains all the edges $x y in E$ with $x, y in V'$, then $G'$ is an induced subgraph of $G$; we say that $V'$ _induces_ or _spans_ $G'$ in $G$. We also write $G' = G[V']$.]

#remark[If $U subset.eq V$ is any set of vertices, then $G[U]$ denotes the graph on $U$ whose edges are precisely the edges of $G$ with both ends in $U$. If $H$ is a subgraph of $G$, not necessarily induced, we abbreviate $G[V(H)]$ to $G[H]$.]

#definition[$G' subset.eq G$ is a _spanning subgraph_ of $G$ if $V'$ spans all of $G$, that is if $V' = V$.]

#definition[If $U$ is any set of vertices, we write $G - U$ for $G[V \\ U]$. That is, $G - U$ is obted from $G$ by _deleting_ all the vertices in $U sect V$ and their incident edges.]

#remark[If $U = {v}$ we write $G - v$ instead of $G - {v}$. Furthermore, instead of $G - V(G')$, we simply write $G - G'$.]

#definition[For any subset $F$ of $[V]^2$, we write $G - F = (V, E \\ F)$ and $G + F = (V, E union F)$.]

#remark[We abbreviate $G - {e}$ and $G + {e}$ to $G - e$ and $G + e$.]

#definition[We call $G$ _edge-maximal_ with a given graph property if $G$ itself has the property but no graph $(V, F)$ with $F supset.neq E$ does.]

#remark[When we call a graph _minimal_ or _maximal_ with some property but haven't spevified an ordering, we are referring to the subgraph relation. When we speak of minimal or maximal sets of vertices or edges, the reference is to set inclusion.]

#definition[If $G$ and $G'$ are disjoint, we denote by $G star G'$ the graph obtained from $G union G'$ by joining all the vertices of $G$ to all the vertices of $G'$.]

#definition[The _complement_ $overline(G)$ of $G$ is the graph on $V$ with edge set $[V]^2 \\ E$.]

#definition[The _line graph_ $L(G)$ of $G$ is the graph on $E$ in which $x, y in E$ are adjacent as vertices if and only if they are adjacent as edges.]


== Degrees of a Vertex

Throughout this section let $G = (V, E)$ be a non-empty graph. 

#definition[The _set of neighbours_ of a vertex $v$ in $G$ is denoted by $N_G (v)$. More generally, for $U subset.eq V$, the neighbours in $V \/ U$ of vertices in $U$ are called _neighbours of U_, denoted $N(U)$.]

#definition[The _degree_ (or _valency_) $d_G(v) = d(v)$ of a vertex $v$ is the number $|E(v)|$ of edges at $v$. This is equal to the number of neighbors of $v$ (not necessarily true for multigraphs). ]

#definition[A vertex of degree $0$ is _isolated_.]

#definition[We define 
+ the _minimum degree of $G$_, $delta(G) = min {d(v) bar v in V}$,
+ the _maximum degree of $G$_, $Delta(G) = max{d(v) bar v in V}$,
+ the _average degree of $G$_, $d(G) = 1/abs(V) sum_(v in V) d(v)$.]

#definition[If all the vertice of $G$ have the same degree $k$, then $G$ is _$k$-regular_ (or even just _regular_).]

#example[A $3$-regular graph is also called _cubic_.]

#lemma[ $ delta(G) <= d(G) <= Delta(G). $]

The average degree captures information about the number of edges of $G$ per vertex. We may be interested in this quantity directly.  

#definition[The number of edges of $G$ per vertex is denoted $epsilon(G) = abs(E)/abs(V)$.]

#prop("Handshake Lemma")[ $ sum_(v in V) d(v) = 2 abs(E). $]
#proof[Every edge contributes to the degree of exactly two vertices by $1$. Thus, we count every edge exactly twice in the sum on the left. \ ]

The following are simple consequences of this fact.


#corollary[$ epsilon(G) = 1/2 d(G) $]

#corollary[The number of vertices of odd degree in a graph is always even.]


A graph with large minimum degree (everywhere, locally) also has many edges per vertex globally. 

#lemma[$ epsilon(G) >= 1/2 delta(G) $]

On the other hand, average degree may be large even when minimum degree is small. That said, the vertices of large degree cannot be scattered "completely" among vertices of small degree. 

#prop[Every graph $G$ with at least one edge has a subgraph $H$ with $ delta(H) > epsilon(H) >= epsilon(G). $]
#proof[The idea is simple: we delete vertices of small degree one by one, until only vertices of large degree remain. We can delete vertices up to $d(v) = epsilon$ as then the number of vertices decreases by $1$ and the number of edges decreases by at most $epsilon$-- so, the overall ratio doesn't decrease. 

More formally, construct a sequence $G = G_0 supset.eq G_1 supset.eq .dots $ of induced supgraphs of $G$ as follows: if $G_i$ has a vertex $v_i$ of degree $d(v_i) <= epsilon(G_i)$, we let $G_(i + 1) = G - v_i$; if not we terminate our sequence and set $H = G_i$. By our choices of $v_i$, we have $epsilon(G_(i + 1)) >= epsilon(G_i)$ for all $i$, and hence $epsilon(H) >= epsilon(G)$. 

Since $epsilon(G) > 0 = epsilon(K^1)$, none of the graphs in our sequence are trival. Hence, $H != emptyset$. Since $H$ has no vertex suitable for deletion, we must have $delta(H) > epsilon(H)$. \ ]


== Paths and Cycles

#definition[A _path_ is non-empty graph $P = (V, E)$ of the form $ V = {x_0, x_1, dots, x_k} #h(10pt) E = {x_0x_1, x_1x_2, dots, x_(k - 1)x_k} $ where all the $x_i$ are distinct. The vertices $x_0$ and $x_k$ are _linked_ by $P$ and are called its _endvertices_ or _Ends_. The vertices $x_1, dots, x_(k - 1)$ are the _inner_ vertices of $P$. The number of edges of a path is its _length_.]

#example[The path of length $k$ is dentoed by $P^k$. Particularly, we have $P^0 = K^1$.]

#remark[We usually refer to a path by the natural sequence of its vertices. That is, we say $P = x_0x_1 dots x_k$ and call $P$ a path from $x_0$ to $x_k$.]

#definition[We define special _subpaths_ of $P$ for $0 <= i <= j <= k$, $ P x_i = x_0 dots x_i #h(25pt) circle(P) = x_1 dots x_(k - 1) \ x_i P = x_i dots x_k #h(25pt) P circle(x_i) = x_0 dots x_(i - 1) \ x_i P x_j = x_i dots x_j #h(25pt) circle(x_i) P circle(x_j) = x_(i + 1) dots x_(j - 1). $]

#definition[If the union $P x union x Q y union y R$ of three paths is again a path, we simply denote it by $P x Q y R$. This is also known as _concatenation of paths_.]

#definition[Suppose $A, B subset.eq V$. Then $P = x_0 dots x_k$ is an $A$-$B$ _path_ if $V(P) sect A = {x_0}$ and $V(P) sect B = {x_k}$.]

#remark[We write $a"-"B$ instead of ${a}"-"B$.]

#definition[Two or more paths are _independent_ if none of them contains an inner vertex of another.]

#definition[A non-trivial path $P$ is an $A$-_path_ for a set $A$ of vertices if $P$ has its ends but no inner vertex in $A$. It is an $H$-path for a graph $H$ if it is a $V(H)$-path and, if it has length $1$, its edge does not lie in $H$.]

#definition[If $P = x_0 dots x_(k - 1)$ is a path and $k >= 3$ the nthe graph $C = P + x_(k - 1) x_0$ is called a _cycle_. This cycle may also be written as $x_0 dots x_(k - 1) x_0$. The length of a cycle is its number of edges (or vertices).]

#example[The cycle of length $k$ is called a $k$-cycle and denoted by $C^k$.]

#definition[The minimum length of a cycle in a graph $G$ is the _girth_, $g(G)$, of $G$. The maximum length of a cycle in $G$ is its _circumference_. If $G$ contains no cycle the former is $infinity$ and the latter is $0$.]

#definition[An edge which joins two vertices of a cycle but is not itself an edge of the cycle is a _chord_ of that cycle. So, an _induced cycle_ in $G$, a cycle in $G$ forming an induced subgraph, is one that has no chords.]

If a graph has large minimum degree, it has long paths and cycles.

#prop[Every graph $G$ contains a path of length $delta(G)$ and a cycle of length at least $delta(G) + 1$ (provided that $delta(G) >= 2$).]
#proof[Let $x_0 dots x_k$ be a longest path in $G$. Then all the neighbors of $x_k$ lie on this path. Hence, $k >= d(x_k) >= delta(G)$. If $i < k$ is minimal with $x_i x_k in E(G)$, then $x_i dots x_k x_i$ is a cycle of length at least $delta(G) + 1$. \ ]

However, minimum degree and girth are not related unless we fix the number of vertices.  

#definition[The _distance_ $d_G (x, y)$ in $G$ of two vertices $x, y$ is the length of a shortest $x"-"y$ path in $G$; if no such path exists, we set $d(x, y) = oo$. The greatest distance between two vertices in $G$ is the _diameter_ of $G$, denoted $"diam"(g)$.  ]

Diameter and girth are related. 

#prop[Every graph $G$ containing a cycle satisfies $g(G) <= 2 "diam"(G) + 1$.]
#proof[Let $C$ be a shortest cycle in $G$. If $g(G) >= 2 "diam"(G) + 1$ then $C$ has two vertices whose distance in $C$ is at least $"diam"(G) + 1$. In $G$, these vertices have a lesser distance; any shortest path $P$ between them is not a subgraph of $C$. Thus, $P$ contains a $C$-path $x P y$. Together with the shorter of the two $x"-"y$ paths in $C$, this path $x P y$ forms a shorter cycle than $C$, a contradiction. \ ]

#definition[A vertex is _central_ in $G$ if its greatest distance from any other vertex is as small as possible. The distance is the _radius_ of $G$, denoted by $"rad"(G)$. More formally, $ "rad"(G) = min_(x in V(G)) max_(y in V(G)) d_G (x, y). $ ]

#lemma[ $ "rad"(G) <= "diam"(G) <= 2 "rad"(G). $]

Diameter and radius are not related to minimum, average or maximum degree if we say nothing about the order of the graph. Graphs of large diameter and minimum degree must be large and graphs of small diameter and maximum degree must be small.

#prop[A graph $G$ of radius at most $k$ and maximum degree at most $d >= 3$ has fewer than $d/(d - 2) (d - 1)^k$ vertices.]
#proof[Let $Z$ be a central vertex in $G$, and let $D_i$ denote the set of vertices of $G$ at distance $i$ from $z$. Then, $V(G) = union.big_(i = 0)^k D_i$. We have $abs(D_0) = 1$ and $abs(D_1) = 1$. For $i >= 1$, $abs(D_(i + 1)) <= (d - 1) abs(D_i)$ since every vertex in $D_(i + 1)$ is a neighbour of a vertex in $D_i$ and each vertex in $D_i$ has at most $(d - 1)$ neighbours in $D_(i + 1)$. Thus, by induction, for all $i < k$, $abs(D_(i + 1)) <= d(d- 1)^i$. This then gives us, $ abs(G) <= 1 + d sum_(i = 0)^(k - 1) (d - 1)^i = 1 + d/(d - 2) ((d - 1)^k - 1) < d/(d - 2) (d - 1)^k. $]

We can also bound the order of $G$ from below by assuming that both its minimum degree and girth are large. For $d in RR$ and $g in NN$ suppose 

$ n_0(d, g) = cases(1 + d sum_(i = 0)^(r - 1) (d - 1)^i #h(15pt) & "if " g = 2r + 1 "is odd;", 2 sum_(i = 0)^(r - 1) (d - 1)^i & "if" g = 2r "is even.") $

#lemma[A graph of minimum degree $delta$ and girth $g$ has at least $n_0(delta, g)$ vertices.]

In fact, we can obtain the same bound for its average degree.

#prop("Alon, Hoory & Linial 2002")[Let $G$ be a graph. If $d(G) >= d >= 2$ and $g(G) >= g in NN$ then $abs(G) >= n_0(d, g)$.]

An interesting consequence of this is that it guarantees the existence of a short cycle compared with $abs(G)$. 

#corollary[If $delta(G) >= 3$ then $g(G) < 2 log abs(G)$.]
#proof[If $g = g(G)$ is even then $ n_0(3, g) = 2 (2^(g/2) - 1)/(2 - 1) = 2^(g/2) + (2^(g/2) - 2) > 2^(g/2) $ while if $g$ is odd then $ n_0(3, g) = 1 + 3 (2^((g- 1)/2) - 1)/(2 - 1) = 3/sqrt(2) 2^(g/2) - 2 > 2^(g/2). $ AS $abs(G) >= n_0(3, g)$ the result follows. \ ]

#definition[A _walk_ (of _length_ $k$) is an alternating sequence of $v_0 e_0 v_1 e_1 dots e_(k - 1) v_k$ of vertices and edges in $G$ such that $e_i = {v_i, v_(i + 1)}$ for all $i < k$. If $v_0 = v_k$, the walk is _closed_. If the vertices in a walk are all distinct, it defines an obvious path in $G$.]

#lemma[Every walk between two vertices contains a path between these vertices.]


== Connectivity

#definition[A graph $G$ is called _connected_ if it is non-empty and any two of its vertices are linked by a path in $G$. If $U subset.eq V$ is such that $G[U]$ is connected, we also call $U$ _connected in G_. Rather than not connected we say _disconnected_.]

#prop[The vertices of a connected graph $G$ can always be enumerated, say $v_1, dots, v_n$, so that $G_i = G[v_1, dots, v_i]$ is connected for every $i$.]<enum-complete>
#proof[ Pick any vertex as $v_1$, and assume inductively that $v_1, dots, v_i$ have been chosen for some $i < abs(G)$. Now pick a vertex $v in G - G_i$. As $G$ is connected, it contains a $v"-"v_1$ path $P$. Choose as $v_(i + 1)$ the first vertex of $P$ in $G-G_i$; then $v_(i + 1)$ has a neighbour in $G_i$. The connectedness of every $G_i$ follows by induction on $i$. \ ]

#definition[A maximal connected subgraph of $G$ is a _component_ of $G$.]

#prop[The components of a graph are induced subgraphs and their vertex sets partition $V$.]

#definition[If $A, B subset.eq V$ and $X subset.eq V union E$ are such that every $A"-"B$ path in $G$ contains a vertex or an edge from $X$, we say that $X$ _separates_ the sets $A$ and $B$ in $G$. We say that $X$ separates two vertices $a, b$ if it separates the sets ${a}, {b}$ but $a, b in.not X$.]

#definition[The set $X$ _separates_ $G$, and is a _separator in_ or _of_ $G$, if $X$ separates some two vertices in $G$.]

#definition[A vertex which separates two other vertices in the same component is a _cutvertex_, and an edge separating its ends is a _bridge_.]

#lemma[The _bridges_ in a graph are precisely those edges that do not lie on any cycles.]

#definition[The unordered pair ${A, B}$ is a _separation_ of $G$ if $A union B = V$ and $G$ has no edge between $A \\ B$ and $B \\ A$. This is equivalent to saying $A sect B$ separates $A$ from $B$. If both $A \\ B$ and $B \\ A$ are non-empty, the separation is _proper_. The number $abs(A sect B)$ is the order of the separation of ${A, B}$; the sets $A, B$ are its _sides_.]

#definition[$G$ is called _$k$-connected_ if $abs(G) > k$ and $G - X$ is connected for every set $X subset.eq V$ with $abs(X) < k$. In other words, no two vertices are separated by fewer than $k$ other vertices.]

#example[Every non-trivial graph is $0$-connected. The $1$-connected graphs are the non-trivial connected graphs.]

#definition[The greatest integer $k$ such that $G$ is $k$-connected is the connectivity $kappa(G)$ of $G$.]

#example[$kappa(G) = 0$ if and only if $G$ is diconnected or $K^1$. Furthermore, $kappa(K^n) = n - 1$ for all $n >= 1$.]

#definition[If $abs(G) > 1$ and $G - F$ is connected for every set $F subset.eq E$ of fewer than $ell$ edges, then $G$ is called _$ell$-edge-connected_.]

#definition[The greatest integer $ell$ such that $G$ is $ell$-edge-connected is the _edge-connectivity_ $lambda(G)$ of $G$.]

#example[We have $lambda(G) = 0$ if $G$ is disconnected.]

#prop[If $G$ is non-trivial then $kappa(G) <= lambda(G) <= delta(G)$.]
#proof[The second inequality follows from the fact that all hte edges incident with a fixed vertex separate $G$. For the first inequality, let $F$ be a set of $lambda(G)$ edges such that $G - F$ is disconnected. This set exists by the definition of $lambda$. Furthermore, $F$ is a minimal separating set of edges in $G$. We now show that $kappa(G) <= abs(F)$.

We consider two cases

+ $G$ has a vertex $v$ that is not incident with an edge in $F$. \ Let $C$ be the component of $G - F$ containing $v$. Then the vertices of $C$ that are incident with an edge in $F$ separate $v$ from $G - C$. Since no edge in $F$ has both ends in $C$ (by the minimality of $F$), there are at most $abs(F)$ such vertices, giving $kappa(G) <= abs(F)$ as desired.

+ every vertex is incident with an edge in $F$. \ Let $v$ be any vertex and let $C$ be the component of $G - F$ containing $v$. Then the neighbours $w$ of $v$ with $v w in.not F$ lie in $C$ and are incident with distinct edges in $F$ (by the minimality of $F$) giving $d_G (v) <= abs(F)$. As $N_G (v)$ separates $v$ from any other vertices in $G$, this yields $kappa(G) <= abs(F)$ -- unless there are no other vertices i.e. unless ${v} union N(v) = V$. But $v$ was an abitrary vertex and so, we may assume that $G$ is complete, giving $kappa(G) = lambda(G) = abs(G) - 1$.
]

So, high-connectivity requires large minimum degree. However, large minimum degree does not necessarily ensure high connectivity, not even high edge-connectivity. It does ensure the existence of a highly connected subgraph. 

#prop("Mader 1972")[Let $0 != k in NN$. Every graph $G$ with $d(G) >= 4k$ has a $k$-connected subgraph. In fact, every such $G$ has a $(k + 1)$-connected subgraph $H$ such that $d(H) > d(G) - 2k >= 2k$.]
#proof[Let $gamma >= epsilon(G) >= 2k$. Consider the subgraphs $G' subset.eq G$ such that $ abs(G') >= 2k #h(15pt) "and" #h(15pt) norm(G') > gamma(abs(G') - k). #h(30pt) (*) $

Such graphs $G'$ exist since $G$ is one; let $H$ be one of smallest order. 

No graph $G'$ as in $(*)$ can have order exactly $2k$, since this would imply that $norm(G') > gamma k >= 2k^2 > binom(abs(G'), 2)$. The minimality of $H$ therefore implies that $delta(H) > gamma$: otherwise we could delete a vertex of degree at most $gamma$ and obtain a graph $G' subset.neq H$ still satisfying $(*)$. Then we have $abs(H) > gamma$. Dividing the inequality of $norm(H) > gamma abs(H) - gamma k$ from $(*)$ by $abs(H)$ therefore yeilds $epsilon(H) > gamma - k$.

Now we must show that $H$ is $(k + 1)$-connected. If not, then $H$ has a proper separation ${U_1, U_2}$ of order at most $k$; let $H[U_i] = H_i$. Since any vertex $v in U_1 \\ U_2$ has all its $d(v) >= delta(H) > gamma$ neighbours from $H$ in $H_1$, we have $abs(H_1) >= gamma >= 2k$. Similarly, $abs(H_2) >= 2k$. By the minimality of $H$, neither $H_1$ nor $H_2$ satisfies $(*)$, we thus have $ norm(H_i) <= gamma(abs(H_i) - k) $ for $i = 1, 2$. But then $ norm(H) &<= norm(H_1) + norm(H_2) \ &<= gamma(abs(H_1) + abs(H_2) - 2k) \ &<= gamma (abs(H) - k) #h(20pt) ("as" norm(H_1 sect H_2) <= k), $

which contradicts $(*)$ for $H$.

\ ]

== Trees and Forests

#definition[An _acyclic_ graph, one not containing any cycles, is called a _forest_.]

#definition[A connected forest is called a _tree_.]

#remark[So, a forest is a graph whose components are trees.]

#definition[The vertices of degree $1$ in a tree are its _leaves_, the others are its _inner vertices_.]

#lemma[Every non-trivial tree has a leaf.]

#lemma[If we remove a leaf from a tree, what remains is still a tree.]

#prop[The following assertions are equivalent for a graph $T$:
+ $T$ is a tree;
+ Any two vertices of $T$ are linked by a unique path in $T$;
+ $T$ is minimally connected, i.e. $T$ is connected but $T - e$ is disconnected for every edge $e in T$;
+ $T$ is maximally acyclic, i.e. $T$ contains no cycle but $T + x y$ does, for any two non-adjacent vertices $x, y in T$.]

#remark[We write $x T y$ for the unique path in a tree $T$ between two vertices $x, y$.]

#lemma[Every connected graph contains a spanning tree.]

#definition[When $T$ is a spanning tree of $G$, the edges in $E(G) \\ E(T)$ are the _chords_ of $T$ in $G$.]

#corollary[A connected graph with $n$ vertices is a tree if and only if it has $n - 1$ edges. ]

#proof[For the forward implication, enumerate the vertices of a tree $T$ as in @enum-complete. As $T$ is acyclic, every vertex is adjacent to only one earlier vertex. Now $|T| = n - 1$ follows by induction on $n$. 

Conversely, let $G$ be any connected graph with $n$ vertices and $n - 1$ edges. Let $T$ be a spanning tree in $G$. Since $T$ has $n - 1$ edges by the first implication, it follows that $T = G$. \ ]

#corollary[If $T$ is a tree and $G$ is any graph with $delta(G) >= abs(T) - 1$, then $T$ is (isomorphic to) a subgraph of $G$.]

#proof[ Map the vertices of $T$ to $G$ following their enumeration from @enum-complete applied to $T$. \ ]

#definition[Sometimes it is convenient to consider one vertex of a tree as special; such a vertex is called the _root_ of this tree.]

#definition[A tree $T$ with a fixed root $r$ is a _rooted tree_.]

#definition[We define a partial ordering on $V(T)$, the _tree-order_ associated with $T$ and $r$, by writing $x <= y$ for $x in r T y$. Think of this order as expressing 'height': if $x < y$ we say that $x$ lies _below_ $y$ in $T$. Furthermore, we call $ ceil(y) = {x bar x <= y} #h(10pt) "and" #h(10pt) floor(y) = {y bar y >= x}. $ the _down-closure_ of $y$ and the _up-closure_ of $x$.]

#definition[A set $X subset.eq V(T)$ that equals its up-closure i.e. which satisfies $X = floor(X) = union.big_(x in X) floor(x)$, is _closed upwards_, or an _up-set_ in $T$. Similarly, we define _down-closed_ sets or _down-sets_.]

#remark[The root of $T$ is the least element in its tree-order, the leaves are its maximal elements, the ends of an edge of $T$ are comparable and the down-closure of very vertex is a _chain_, a set of pairwwise comparable elements.]

#definition[The vertices at distance $k$ from the root have _height_ $k$ and form the $k$th _level_ of $T$.]

#definition[A rooted tree $T$ contained in a graph $G$ is called _normal_ in $G$ if the ends of every $T$-path in $G$ are comparable in the tree-order of $T$.]

#remark[If $T$ spans $G$, this amounts to requiring that two vertices of $T$ must be comparable whenever they are adjacent in $G$.]

Normal trees can be a powerfool tool since $G$ reflects the separation properties of $T$.

#lemma[Let $T$ be a normal tree in $G$. 
+ Any two vertices $x, y$ of $T$ that are incomparable in its tree order are separated in $G$ by the set $ceil(x) sect ceil(y)$.
+ If $V(T) = V(G) = V$ and $S subset.eq V$ is down-closed, then the components of $G - S$ are spanned by the sets $floor(x)$ with $x$ minimal in $V \\ S$.]
#proof[
  + As $x$ and $y$ are incomparable, neither of them lies in $ceil(x) sect ceil(y)$. Thus, it suffices to show that every $x$-$y$ path $P$ in $G$ meets $ceil(x) sect ceil(y)$. Let $t_1, dots, t_n$ be a minimal sequence of vertices in $P sect T$ such that $t_1 = x$ and $t_n = y$ and $t_i$ and $t_(i + 1)$ are comparable in the tree order of $T$ for all $i$. Such a sequence must exist: the set of all vertices in $P sect T$, in their natural order as they occur in $P$ has this property because $T$ is normal and every segment $t_i P t_(i + 1)$ is either an edge of $T$ or a $T$-path. In our minimal sequence, we cannot have $t_(i - 1) < t_i > t_(i + 1)$ for any $i$ since $t_(i - 1)$ and and $t_(i + 1)$ would then be comparable and deleting $t_i$ would yield a smaller such sequence. Our sequence then must have the form $ x = t_1 > dots > t_k < dots < t_n = y $ for some $k in [n]$ (even with $k<=3$, by the minimality of $n$). As $t_k in ceil(x) sect ceil(y) sect V(P)$, we are done.
+ Every set $floor(x)$ as in $(b)$ is connected in $T$, and hence in $G$. It lies in $V \\ S$, because $x in.not S$ and $S$ is down-closed. As every vertex in $V \\ S$ lies above some minimal such vertex $x$, these sets $floor(x)$ have union $V \\ S$. \ For distinct $x$ and $x'$, the connected sets $floor(x)$ and $floor(x')$ are disjoint, and not joined by an edge of $G$, because $ceil(x) sect ceil(x') subset.eq S$ separates $x$ from $x'$ in $G$. So the sets $floor(x)$ span maximal connected subgraphs, components, in $G - S$, and these are all its components. 
]

Normal spanning trees are aso known as _depth-first search trees_ since they arise in the depth-first traversal of graphs. The following constructive proof, however, illuminates better how normal trees capture the structure of their host graphs.

#prop[Every connected graph has a normal spanning tree.]
#proof[Let $G$ be a connected graph. Let $T$ be any maximal normal tree in $G$; we show that $V(T) = V(G)$.

Suppose note, and let $C$ be a component of $G - T$. As $T$ is normal, $N(C)$ is a chain in $T$. Let $x$ be its greatest element, and let $y in C$ be adjacent to $x$. Let $T'$ be the tree obtained from $T$ by joining to $y$ to $x$. The tree order of $T'$ then extends that of $T$. We now work towards a contradiction by showint that $T'$ is also normal in $G$.

Let $P$ be a $T'$-path in $G$. If the ends of $P$ both lie in $T$, then they are comparable in the tree order of $T$ and hence, in that of $T'$ too (by normality of $T$ in $G$). If not, then $y$ is one end of $P$, so $P$ lies in $C$ except for its other end $z$, which lies in $N(C)$. Then $z <= x$ by the choice of $x$. Note that as $y$ is a leaf of $T'$ with neighbour $x$, we have $x < y$ and thus, $z < y$. We have our contradiction!

\ ]

== Bipartite Graphs

#definition[For $r >= 2, r in ZZ$, a graph $G$ is called _$r$-partite_ if $V$ admits a partition into $r$ classes such that every edge has its ends in different classes. That is, vertices in the same partition class must not be adjacent.]

#example[Instead of $2$-partite we say _bipartite_.]

#example[An $r$-partite graph in which every two vertices from different partition classes are adjacent is called _complete_. The complete $r$-partite graphs for all $r$ together are the _complete multipartite_ graphs. The complete $r$-partite graph $overline(K^(n_1)) * dots * overline(K^(n_r))$ is denoted by $K_(n_1, dots, n_r)$. If $n_1 = dots = n_r = s$ we abbreviate this to $K^r_s$. Thus, $K^r_s$ is the complete $r$-partite graph in which every partition class contains exactly $s$ vertices.]

#example[Graphs of the form $K_(1, n)$ are known as _stars_. The vertex in the singleton partition class in $K_(1, n)$ is the star's _centre_.]

#prop[A graph is bipartite if and only if it contains no odd cycle.]
#proof[
  For the forward direction, it suffices to show that an odd cycle isn't bipartite as subgraphs of a bipartite graph must also be bipartite. Suppose $x_1 x_2 dots x_n x_1$ is an odd cycle. That is, $n$ is odd. For contradiction, assume $A, B$ is a valid bipartition of the odd cycle. WLOG, we must have $x_i in A$ if $i$ is odd and $x_i in B$ if $i$ is even. So, $x_n, x_1 in A$ but are also adjacent-- a contradiction!

  For the backward implication, let $G$ be a graph without odd cycles; we show that $G$ is bipartite. Clearly, a graph is bipartite if all its components are bipartite or trivial. So, we may assume that $G$ is connected. Let $T$ be a spanning tree in $G$, pick a root $r in T$, and denote the associated tree-order on $V$ by $<=_T$. For each $v in V$, the unique path $r T v$ has odd or even length. This defines a bipartition of $V$; we show that $G$ is bipartite with this partition.

  Let $e = x y$ be an edge of $G$. If $e in T$, with $x <_T y$, then $r T y = r T x y$ and so, $x$ and $y$ lie in different partition classes. If $e in.not T$ then $C_e = x T y + e$ is a cycle and by the case treated already the vertices along $x T y$ alternate between two classes. Since $C_e$ is even by assumption, $x$ and $y$ lie in different classes.
\ ]

== Contraction and Minors

Throughout this section, let $X$ be a fixed graph.

#definition[A _subdivision_ of $X$ is any graph obtained from $X$ by replacing some edges of $X$ with new paths between their ends, so that none of these paths has an inner vertex in $V(X)$ or on another new path. When $G$ is a subdivision of $X$, we also say that $G$ _is a_ $T X$; its new vertices are called _subdividing vertices_.]

#remark[Formally, $T X$ denotes a whole calss of graphs, the class of all subdivisions of $X$.]

#remark[Subdividing vertices have degree $2$ while branch vertices retain their degree from $X$.]

#definition[If a graph $Y$ contains a $T X$ as a subgraph, then $X$ is a _topological minor_ of $Y$.]

#definition[A graph $G$ _is an $I X$_ if its vertex set admits a partition ${V_x bar x in V(X)}$ into connected subsets $V_x$ such that distinct vertices $x, y in X$ are adjacent in $X$ if and only if $G$ contains a $V_x"-"V_y$ edge. The sets $V_x$ are the _branch sets of the $I X$_. Furthermore, we say $X$ arises from $G$ by _contracting_ the subgraphs $G_x$ and call it a _contraction minor_ of $G$.]

#remark[Informally, we get an $I X$ by replacing the vertices $x$ of $X$ with disjoint connected graphs $G_x$ and the edges $x y$ of $X$ with non-empty sets of $G_x "-" G_y$ edges.]

#definition[If a graph $Y$ contains an $I X$ as a subgraph, then $X$ is a _minor_ of $Y$, the $I X$ is a _model_ of $X$ in $Y$ and we write $X lt.curly.eq Y$.]

#lemma[$X$ is a minor of $Y$ if and only if there is a map $phi$ from a subset of $V(Y)$ onto $V(X)$ such that for every vertex $x in X$ its inverse image $phi^(-1)(x)$ is connected in $Y$ and for ever edge $x x' in X$ there is an edge in $Y$ between the branch sets $phi^(-1)(x)$ and $phi^(-1)(x')$. ]

#definition[If the domain of $phi$ is all of $V(Y)$, and $x x' in X$ whenever $x != x'$ and $Y$ has an edge between $phi^(-1)(x)$ and $phi^(-1)(x')$, we call $phi$ a _contraction_ of $Y$ onto $X$.]

== Euler Tours

#definition[A closed walk in a graph is an _Euler tour_ if it traverses every edge of the graph exactly once. A graph is _Eulerian_ if it admits an Euler tour.]

#prop[A connected graph is Eulerian if and only if every vertex has even degree.]
#proof[First, the forward implication. If a vertex appears in an Euler tour $k$ times (or $(k + 1)$ times if it is the starting and finishing vertex and so, counted twice) must have degree $2 k$.

Conversely, we use induction on $norm(G)$ to show that every connected graph $G$ with all degrees even must have an Euler tour. The induction starts trivially with $norm(G) = 0$. For $norm(G) >= 1$, since all degrees are even, we may find in $G$ a non-trivial closed walk that contains no edge more than once.]

== Some Algebraic Graph Theory

== Other Notions of Graphs

= Matchings, Covering, Packing

== Matching in Bipartite Graphs

== Matching in General Graphs

== The Erdös-Pósa Theorem

== Tree Packing and Arboricity

== Path Covers

= Flows

== Circulations

== Flow in Networks

== Group-valued Flows

== $k$-Flows for small $k$

== Flow-colouring Duality

== Tutte's Flow Conjecture

= Hamilton Cycles

== Sufficient Conditions

== Hamilton Cycles and Degree Sequences

== Hamilton Cycles in the Square of a Graph
