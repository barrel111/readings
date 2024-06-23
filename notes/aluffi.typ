#import "@local/preamble:0.1.0": *
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#show: project.with(
  course: "Algebra",
  sem: "Summer",
  title: "Algebra",
  subtitle: "Aluffi",
  authors: (
    "Shaleen Baral",
  ),
)

#set enum(indent: 15pt, numbering: "a.")

= Preliminaries

== Naive Set Theory

#definition[The _ordered pair_ $(s, t)$ can be defined as the set ${s, {s, t}}$. This retains both the elements of the tuple but also conveys an ordering.]

#definition[The _disjoint union_ of two sets $S, T$ is the set $S union.sq T$ obtained by first producing 'copies' $S'$ and $T'$ and then taking the union.]

#definition[The _product_ of two sets $S,T$ is the set $S times T$ defined as $ S times T = {(s, t) "such that" s in S,, t in T}. $]

#definition[A _relation_ on a set $S$ is a subset $R$ of the product $S times S$. If $(a, b) in R$, we write $a R b$.]

#definition[An _equivalence relation_ on a set $S$ is any relation $tilde$ satisfying the following properties
+ _reflexivity_: $forall a in S. #h(5pt) a tilde a$
+ _symmetry_: $forall a in S. forall b in S. #h(5pt) a tilde b arrow.double.l.r.long b tilde a$
+ _transitivity_: $forall a in S. forall b in S. forall c in S. #h(5pt) a tilde b, b tilde c arrow.long.double a tilde c$.]

#definition[A _partition_ of $S$ is a family of _disjoint_ nonempty subsets of $S$ whose union is $S$.]

#definition[Let $tilde$ be an equivalence relation on $S$. Then for every $a in S$, the _equivalence class_ of $a$ is the subset $S$ defined by $ [a]_tilde = {b in S bar b tilde a}. $ Further, the equivalence classes form a partition $cal(P)_tilde$ of $S$.]

#lemma[Every partition of $S$ corresponds to an equivalence relation.]

#definition[The _quotient_ of the set $S$ with respect to the equivalence relation $tilde$ is the set $ S tilde = cal(P)_tilde $ of equivalence classes of elements of $S$ with respect to $tilde$.]

== Functions

#definition[The graph of $f$ is the set $ Gamma_f = {(a, b) in A times B bar b = f(a)} subset.eq A times B. $ Officially, a function _is_ its graph together with information of the source $A$ and the target $B$ of $f$.]

#definition[A function is a relation $Gamma subset.eq A times B$ such that $forall a in A, exists! b in B$ with $(a, b) in Gamma$. To denote $f$ is a function from $A$ to $B$ we write $f: A arrow.long B$. ]

#definition[The collection of all functions from a set $A$ to a set $B$ is denoted $B^A$.]

#example[Every set $A$ comes equipped with the _identity function_, $"id"_A: A to A$, whose graph is the diagonal in $A times A$. It is defined by $forall a in A. #h(5pt) "id"_A (a) = a.$]

#definition[If $S subset.eq A$, for $f: A to B$, we define $f(S) subset.eq B$ as $ f(S) = {b in B bar exists a in S. b = f(a)} $]

#definition[The _restriction_ of $f: A to B$ to $S subset.eq A$, denoted $f bar_S$ is the function $S to B$ defined by $ forall s in S. #h(8pt) f bar_S (s) = f(s). $]
#remark[The restriction can be equivalently described as $f compose i$ where $i: S to A$ is the inclusion. Further, $f(S) = "im"(f bar_S)$.]

#example("Multisets")[A _multiset_ is like a set but allows for multiple instances of each element. A multiset may be defined by giving a function $m: A to NN^star$, where $N^star$ is the set of positive integers. The corresponding multiset consists of the elements $a in A$, each taken $m(a)$ times.]

#example("Indexed Sets")[One may think of an _indexed set_ ${a_i}_(i in I)$ as set whose elements are denoted by $a_i$ for $i$ ranging over some 'set of indices' $I$. Instead, it is more proper to think of an indexed set as a function $a: I to A$, with the understanding that $a_i$ is a shorthand for $a(i)$. One benefit is that this allows us to consider $a_0, a_1$ as distinct elements of ${a_i}_(i in NN)$ even if $a_0 = a_1$ as elements of $A$.]

#definition[If $f: A to B$ and $g: B to C$ are functions then so is the operation $g compose f$ defined by $ forall a in A. #h(8pt) (g compose f)(a) = g(f(a)). $ Pictorially, the following diagram _commutes_
#align(center)[
  #commutative-diagram(
    node((0, 0), $A$),
    node((0, 1), $B$),
    node((1, 1), $C$),
    arr($A$, $B$, $f$),
    arr($B$, $C$, $g$),
    arr($A$, $C$, $g compose f$, label-pos: right)
  )
]]

#remark[A diagram _commutes_ when the result of following a path of arrows from any point of the diagram to any other point only depends on the starting and ending points and not on the particular path chosen.]

#lemma[Composition of functions is associative. That is to say, if $f: A to B$, $g: B to C$ and $h: C to D$ then $ h compose (g compose f) = (h compose g) compose f. $ Graphically, the following diagram commutes
#v(10pt)
#align(center)[
  #commutative-diagram(
    node((0, 0), $A$),
    node((0, 1), $B$),
    node((0, 2), $C$),
    node((0, 3), $D$),
    arr($A$, $B$, $f$),
    arr($B$, $C$, $g$),
    arr($C$, $D$, $h$),
    arr($A$, $C$, $g compose f$, curve: -20deg, label-pos:right),
    arr($B$, $D$, $h compose g$, curve: 20deg, label-pos:left)
  )
]
#v(10pt)
]

#example[If $f: A to B$ then $id_B compose f = f$ and $f compose id_A = f$. Graphically, the following diagrams commute
#v(15pt)
#align(center)[
  #commutative-diagram(
    node((0,0), $A$),
    node((0,1), $B$, "B1"),
    node((0,2), $B$, "B2"),
    arr($A$, "B1", $f$),
    arr("B1", "B2", $id_B$),
    arr($A$, "B2", $id_B compose f$, curve: 25deg)
  )
  #commutative-diagram(
      node((0,0), $A$, "A1"),
      node((0,1), $A$, "A2"),
      node((0,2), $B$),
      arr("A1", "A2", $id_A$),
      arr("A2", $B$, $f$),
      arr("A1", $B$, $id_B compose f$, curve: 25deg)
    )
]]

#definition[A function $f: A to B$ is _injective_ if $forall a', a'' in A$, $a' != a'' implies f(a') != f(a'')$.]

#definition[A function $f: A to B$ is _surjective_ if $forall b in B$, $exists a in A$ such that $b = f(a)$. That is to say $f$ _covers_ $B$ and equivalently, $im(f) = B$.]

#definition[If $f: A to B$ is both injective and surjective then it is a _bijection_. Then we often write $f: A to^tilde B$. We also say that $A$ and $B$ are _isomorphic_ and denote this by $A tilde.equiv B$.]

#definition[A function $g: B to A$ is a _left inverse_ of $f: A to B$ if $g compose f = id_A$. Graphically, the following diagram commutes
#align(center)[
  #commutative-diagram(
    node((0, 0), $A$, "A1"),
    node((0, 1), $B$),
    node((0, 2), $A$, "A2"),
    arr("A1", $B$, $f$),
    arr($B$, "A2", $g$),
    arr("A1", "A2", $id_A$, curve: 25deg)
  )
]]

#definition[A function $f: A to B$ is a _right inverse_ of $g: B to A$ if $f compose g = id_A$. Graphically, the following diagram commutes
#v(15pt)
#align(center)[
  #commutative-diagram(
    node((0, 0), $B$, "B1"),
    node((0, 1), $A$),
    node((0, 2), $B$, "B2"),
    arr("B1", $A$, $g$),
    arr($A$, "B2", $f$),
    arr("B1", "B2", $id_B$, curve: 25deg)
  )
]]

#definition[We call $g: B to A$ an inverse of $f: A to B$ if $g$ is both a left and right inverse of $f$. Then $g$ may also be denoted $f^(-1)$.]

#theorem[Assume $A != emptyset$ and let $f: A to B$ be a function. Then
+ $f$ has a left inverse iff it is injective.
+ $f$ has a right inverse iff it is surjective. ]

#corollary[A function $f: A to B$ is a bijection if and only if it has a (two-sided) inverse.]

#remark[An injective but not surjective function has no right inverse. If the source has more than two elements, there will be more than one left inverse.]

#remark[A surjective function but not injective function will have multiple inverses. These are called _sections_.]

#definition[Let $f: A to B$ be any function and $S subset.eq B$ be a subset. Then $f^(-1)(S)$ is defined by $ f^(-1)(S) = {a in A bar f(a) in S}. $ If $S = {q}$ is a singleton then $f^(-1)(T) = f^(-1)(q)$ is denoted the _fiber_ of $f$ over $q$.]

#remark[In this language: $f$ is a bijection iff it has nonempty fiber over all elements of $B$ and every fiber is a singleton.]

#definition[A function $f: A to B$ is a _monomorphism_ (or _monic_) if for all sets $Z$ and all functions $alpha', alpha'': Z to A$ $ f compose alpha' = f compose alpha'' implies alpha' = alpha''. $]

#theorem[A function is injective iff it is a monomorphism.]

#example("Projection")[Let $A, B$ be sets. Then there are _natural projections_ $pi_A, pi_B$
#align(center)[
  #commutative-diagram(
    node((0, 0), $A times B$),
    node((1, -1), $A$),
    node((1, 1), $B$),
    arr($A times B$, $A$, $pi_A$, label-pos: right, "surj"),
    arr($A times B$, $B$, $pi_B$, "surj"),
  )
]

defined by $ forall (a, b) in A times B. #h(10pt) pi_A ((a, b)) = a, #h(15pt) pi_B ((a, b)) = b. $ These maps are clearly surjective.]

#example("Direct Sum Injection")[
  There are natural injections from $A, B$ to their disjoint union $A union.sq B$
  #align(center)[
    #commutative-diagram(
      node((0, 0), $A$),
      node((0, 2), $B$),
      node((1, 1), $A union.sq B$),
      arr($A$, $A union.sq B$, "", "inj"),
      arr($B$, $A union.sq B$, "", "inj"),
    )
  ]
  obtained by sending $a in A$ (resp. $b in B$) to the corresponding element in the isomorphic copy $A'$ of $A$ (resp. $B'$ of $B$) in $A union.sq B$.
]

#example("Equivalence Relation Projection")[
  Let $tilde$ be an equivalence relation on $A$. Then there is a surjective _canonical projection_
  #align(center)[
    #commutative-diagram(
      node((0, 0), $A$),
      node((0, 1), $A \/ tilde$),
      arr($A$, $A \/ tilde$, "", "surj")
    )
  ]

  obtained by sending every $a in A$ to its equivalence class $[a]_tilde in A \/ tilde$.
]

#lemma[Every function $f: A to B$ defines an equivalence relation $tilde$ on $A$ as follows: for every $a', a'' in A$, $ a' tilde a'' iff f(a') = f(a''). $]

#theorem("Canonical Decomposition")[Let $f: A to B$ be any function and define $tilde$ as above. Then $f$ decomposes as follows:
#v(15pt)
#align(center)[
  #commutative-diagram(
    node((0, 0), $A$),
    node((0, 1), $(A \/ tilde)$),
    node((0, 2), $im(f)$),
    node((0, 3), $B$),
    arr($A$, $(A \/ tilde)$,"","surj"),
    arr($(A \/ tilde)$, $im(f)$, $tilde(f)$, label-pos: right),
    arr($(A \/ tilde)$, $im(f)$, $tilde$),
    arr($im(f)$, $B$, "", "inj"),
    arr($A$, $B$, $f$, curve: 15deg),
  )
]

The first function is the canonical projection $A to A\/tilde$. The third function is the inclusion $im f subset.eq B$. The bijection $tilde(f)$ in the middle is defined by $ tilde(f)([a]_tilde) = f(a) $ for all $a in A$.]

== Categories

#set list(indent: 15pt)
#definition[A _category_ $sans(C)$ consists of
- a class $"Obj"(sans(C))$ of _objects_ the category.
- for every two objects $A, B$ of $sans(C)$, a set $"Hom"_(sans(C)) (A, B)$ of _morphisms_ with the following properties
  - for every object $A$ of $sans(C)$, there exists (at least) one morphism $1_A in "Hom"_sans(C) (A, A)$, the 'identity' on $A$.
  - two morphisms $f in "Hom"_sans(C) (A, B)$ and $g in "Hom"_(sans(C)) (B, C)$ determine a morphism $f g in "Hom"_(sans(C)) (A, C)$. That is for every triple of objects $A, B, C$ of $sans(C)$ there is a function (of sets) $ "Hom"_sans(C) (A, B) times "Hom"_sans(C) (B, C) to "Hom"_sans(C) (A, C) $ and the image of the pair $(f, g)$ is denoted $f g$.
  - this composition law is associative: if $f in "Hom"_(sans(C)) (A, B)$, $g in "Hom"_(sans(C)) (B, C)$ and $h in "Hom"(sans(C)) (C, D)$ then $(h g) f = h (g f).$
  - the identity morphisms are identities with respect to composition: that is for all $f in "Hom"_(sans(C)) (A, B)$ we have $ f dot.c 1_A = f, #h(10pt) 1_B dot.c f = f. $]
