#import "@local/preamble:0.1.0": *
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#show: project.with(
  course: "Algebra",
  sem: "Summer",
  title: "Algebra Problems",
  subtitle: "Aluffi",
  authors: ("Shaleen Baral",),
)

#set enum(indent: 15pt, numbering: "a.")

= Preliminaries

== Naive Set Theory

~

*Problem 1.2*

First, note that for every $a in S$, $a in [a]_tilde$. Since every equivalence
class is a subset of $S$, it follows that $S = union.big_(C in cal(P)_tilde) C$.

Take two partitions $[a]_tilde$ and $[b]_tilde$. If they are disjoint, we are
done. Suppose they aren't. Then $c in [a]_tilde sec [b]_tilde$. By transitivity
and symmetry, for any $x in [b]_tilde$, $x tilde b tilde c tilde a$. Thus, $[b]_tilde subset.eq [a].tilde$.
By symmetry, $[b]_tilde = [a]_tilde$. Thus, distinct equivalence classes are
disjoint.

This concludes the proof that equivalence classes form a partition of $S$.

*Problem 1.3*

Let $cal(P)$ be a partition on $S$. Furthermore, for any $a in S$, define $cal(P)_a$ to
be the unique set in the partition containing $a$. Then we can the equivalence
relation $tilde_cal(P)$ by $a tilde_cal(P) b$ iff $b in cal(P)_a$.

This is reflexive because, trivially, $a in cal(P)_a$.

This is also symmetric. Note that as partitions are a collection of disjoint
sets, $cal(P)_a sect cal(P)_b != emptyset$ implies that $cal(P)_a = cal(P)_b$.
Thus, $a in cal(P)_a = cal(P)_b$.

Finally, this is also transitive due to the transitivity and symmetry of set
equality. Particularly, note that, as in the previous part, $cal(P)_a = cal(P)_b$ and $cal(P)_b = cal(P)_c$.
Thus, $c in cal(P)_c = cal(P)_a$.

*Problem 1.6*

We first show that $tilde$ is an equivalence relation. It is reflexive because
for any $a in RR$, $a - a = 0 in ZZ$. It is symmetric because $ZZ$ is closed
under multiplication i.e. $z in ZZ arrow.double.long -z in ZZ$. It is transitive
because $ZZ$ is closed under addition, particularly for $a, b, c in RR$, if $a tilde b, b tilde c$ then $c - a = (c - b) + (b - a) in ZZ$.

We claim that $RR \/ tilde #h(2pt) tilde.equiv [0, 1)$. Note that any $x, y in [0, 1)$ are
such that $x tilde.not y$ as $x - y <= x < 1$. Thus, each element of $[0, 1)$ corresponds
to a distinct equivalence class. Next, given any $z in RR$, we claim that there
exists $x in [0, 1)$ such that $z in [x]_tilde$. Particularly, take $x = z - floor(z)$.
Then $z - x in ZZ$ and $0 <= z - floor(z) < 1$.

Note that $approx$ is an equivalence relation for pretty much the same reasons
as $tilde$ above. Furthermore, $RR times RR \/ approx tilde.equiv [0, 1) times [0, 1)$ by
a similar reasoning to above.

== Functions Between Sets

*Problem 2.1*

There are $n!$ many bijections between a set $S$ and itself, with $abs(S) = n$.
We prove this by induction. Let $P(n)$ be the statement that there are $n!$ bijections
from $S$ to $S'$ with $|S| = |S'| = n$.

$P(1)$ is clearly true as the only bijection (in fact, the only function) from a
singleton $S = {s}$ to another singleton $S' = {s'}$ is the function $f: S to S'$ defined
by $f(s) = s'$.

Assuming $P(k)$ we wish to show that there $P(k + 1)$ holds too. Suppose $S = {s_1, dots, s_k, s_(k + 1)}$.
We can categorize bijections by where they map the first element $s_1$. There
are $n$ different categories as $|S'| = n$. We then claim that every category
has $(n - 1)!$ elements. Consider some category that is defined by the fact that
it maps $s_1 arrow.bar s_i'$ for some $s_i' in S'$. Hence, every function $f$ in
this category, restricts to a bijection $f|_(S-s_1): S- s_1 to S' - s_i'$. By
the induction hypothesis, there are precisely $(n - 1)!$ choices for these
restrictions. So every category, has $(n - 1)!$ functions and in total, there
are $n(n - 1)! = n!$ many bijections from $S$ to $S'$. So, $P(k + 1)$ holds.

By induction, $P(n)$ is true for all $n in NN$.

*Problem 2.2*

We deal with the forward direction first. Suppose $f:A to B$ has a right inverse $g:B to A$.
Then for every $b in B$, $g(b) in A$ is such that $f(g(b)) = b$. Thus, every
element of $B$ is the image, under $f$, of at least one element of $A$ i.e. $f$ is
surjective.

Now, consider the backward direction. If $f$ is surjective then for every $b in B$,
the fiber $f^(-1)(b)$ is non-empty. So, define the function $g: B to A$ as
follows: for every $b$, pick an element of the fiber $f^(-1)(b)$ and assign it
to $g(b)$. Then, note that for every $b in B$, $g(b) in f^(-1)(b)$ implies that $(f compose g)(b) = b$.
Thus, $f compose g = id_B$ and $g$ is the right inverse of $f$.

*Problem 2.4*

This follows from showing:

+ $tilde.equiv$ is reflexive.\ For any set $A$, $A tilde.equiv A$ as $id_A: A to A$ is
  a bijection.
+ $tilde.equiv$ is symmetric.\ Take any sets $A, B$ such that $A tilde.equiv B$.
  Then there exists a bijection $f: A to B$. Consequently, $f^(-1): B to A$ is a
  bijection from $B$ to $A$ and $B tilde.equiv A$.
+ $tilde.equiv$ is transitive.\ Take any sets $A, B, C$ such that $A tilde.equiv B$ and $B tilde.equiv C$.
  Then, there exists bijections $f: A to B$ and $g: B to C$. Consequently, $h = g compose f: A to C$ is
  also a bijection since it has inverse $f^(-1) compose g^(-1)$ $ (f^(-1) compose g^(-1)) compose (g compose f) = f^(-1) compose f = id_A, #h(15pt) (g compose f) compose (f^(-1) compose g^(-1)) = g compose g^(-1) = id_C. $ Thus, $A tilde.equiv C$.

*Problem 2.5*

#definition[A function $f: A to B$ is an _epimorphism_ for all sets $Z$ and all function $alpha', alpha'': B to Z$ $ alpha' compose f = alpha'' compose f implies alpha' = alpha''. $]

#prop[A function is surjective iff it is an epimorphism]
#proof[We start with the forward direction. Suppose $f: A to B$ is surjective. Then we
  know that $f$ has a right inverse $g$. So, $ alpha' compose f = alpha'' compose f \ implies alpha' compose f compose g = alpha'' compose f compose g \ implies alpha' = alpha''. $
  Now, we consider, the backward direction. Suppose $f: A to B$ is an epimorphism.
  Pick $b in B$ and define $alpha'_b: B to {0, 1}, alpha''_b: B to {0, 1}$ to be $alpha'_b = bb(1)_B, alpha''_b = bb(1)_(B - b)$.
  Then, $alpha'(b) != alpha''(b)$ so $alpha' compose f = alpha'' compose f$. For
  every $x in f^(-1)(B - b)$, $(alpha' compose f)(x) = (alpha'' compose f)(x) = 1$.
  So, if $x in A$, $(alpha' compose f)(x) != (alpha'' compose f)(x)$ necessarily
  implies that $x in f^(-1)(b)$. Since $b$ was chosen arbitrarily, this proves
  that $f$ is surjective.]

*Problem 2.9*

Suppose $A tilde.equiv A'$ and $B tilde.equiv B'$ with $A sect B = nothing, A' sect B' = emptyset$.
Let $g_1: A to A'$ and $g_2: B to B'$ be isomorphisms. Consider the map $f: A union B to A' union B'$ defined
by
$ f(x) = cases(g_1(x) "if " x in A, g_2(x) "otherwise") $

Then, $f$ is a bijection and hence, $A union B tilde.equiv A' union B'$.

*Problem 2.10*

We give a combinatorial argument. Note that a function from $A$ to $B$ must map
an element of $A$ to one of $|B|$ many elements of $B$. Since this choice has to
be made for each of the $|A|$ many elements of $A$, there are a total of $|B|^(|A|)$ functions
in $B^A$.

*Problem 2.11*

Let $cal(P)$ denote the power set of $A$. Consider the map $cal(F): 2^A to cal(P)$ defined
by

$ cal(F)(f) = {x in A bar f(x) = 1} $

First, we show $cal(F)$ is injective. Suppose $f, g in 2^A$ with $cal(F)(f) = cal(F)(g)$.
Then for every $x not in cal(F)(f)$, $f(x) = g(x) = 0$ and for every $x in cal(F)(f)$, $f(x) = g(x) = 1$.
Thus, $f = g$.

Next, we show that $cal(F)$ is surjective. Consider any $S subset.eq 2^A$. Then $cal(1)_S in 2^A$ and
is such that $cal(F)(cal(1)_S) = S$.

== Categories

*Problem 3.1*

For clarity denote by $compose_(sans("C"))$ and $compose_(sans("C")^"op")$ the
composition laws for $sans("C")$ and $sans("C")^(op)$ respectively. Consider $f in Hom("C"^(op), A, B)$ and $g in Hom("C"^(op), B, C)$.
Then note that $f in Hom("C", B, A)$ and $g in Hom("C", C, B)$. So, there exists $f compose_(sans("C")) g in Hom("C", C, A)$.
Then, note that $f compose_(sans("C")) g in Hom("C"^(op), A, C)$ and hence, we
can define $compose_(sans("C")^("op"))$ by
$ g compose_(sans("C")^"op") f = f compose_(sans("C")) g in Hom(sans("C")^"op", A, C). $

If $1_A in Hom("C", A, A)$, then note that $1_A in Hom("C"^(op), A, A)$ too. So, we take the identity morphism of every object $A$ of $sans("C")^(op)$ to be $1_A in Hom("C"^(op), A, A)$ too.

We now prove that composition defined this way satisfies the required
properties.

#let compose_op = $compose_(sans("C")^(op))$
#let compose_c = $compose_(sans("C"))$

+ _associativity_ \ Consider $f in Hom("C"^(op), A, B)$, $g in Hom("C"^(op), B, C)$ and $h in Hom("C"^(op), C, D)$.
  Then,
$ (h #compose_op g) #compose_op f &= f #compose_c (g #compose_c h) \
&= (f #compose_c g) #compose_c h \ &= h #compose_op (g #compose_op f). $

+ _identity_ \ Consider for $f in Hom("C"^(op), A, B)$ and $g in Hom("C"^(op), B, A)$ the following facts,

$ f #compose_op 1_A = 1_A #compose_c f = f, \ 1_A #compose_op g = g #compose_c 1_A = g. $

+ _disjointness_ \ Note that $Hom("C"^(op), A, B) = Hom("C", B, A)$ and $Hom("C"^(op), C, D) = Hom("C", D, C)$. Since $Hom("C", B, A)$ and $Hom("C", D, C)$ are disjoint unless $B = D$ and $A = C$, we have that $Hom("C"^(op), A, B)$ and $Hom("C"^(op), C, D)$ are disjoint unless $A = C$ and $B = D$.

*Problem 3.3*

#let sanC = $sans("C")$

In Example $3.3$, we construct a category $sanC$ from a set $S$ and a reflexive, transitive relation $tilde$ on $S$. Saying that $1_a$ is an identity means that for every $f in Hom("C", a, b)$ and $g in Hom("C", b, a)$ the following holds $ f compose 1_A = f #h(5pt) "and" #h(5pt) 1_A compose g = g. $

If either $Hom("C", a, b) = emptyset$ or $Hom("C", b, a) = emptyset$ then the corresponding equation holds vacuously. So let us deal with the case where $Hom("C", a, b) != emptyset$ or $Hom("C", b, a) != emptyset$:

If $exists f in Hom("C", a, b)$ then it must be $f = (a, b)$. Since $tilde$ is reflexive, we have $1_a = (a, a) in Hom("C", a, a)$. Thus, by the composition law, $ f compose 1_A = (a, b) = f. $

Similarly, if $exists g in Hom("C", b, a)$ then it must be $g = (b, a)$. Again, we have $1_a = (a, a) in Hom("C", a, a)$ and by the composition law,
$ 1_A compose g = (b, a) = g. $

*Problem 3.5*

We can view Example $3.4$ as a concrete instance of Example $3.3$. In this case, the underlying set is $cal(P)(S)$ with the subset relation $subset.eq$ being used as $tilde$. Note how $subset.eq$ is both reflexive and transitive and hence, meets the same criteria as $tilde$ did for Example $3.3$. Then the description of Example 3.4 precisely corresponds to the construction described in Example 3.3 with the relation being given by $subset.eq$.

*Problem 3.6*

The category $sans("V")$ is defined by
- _objects_: $Obj(sans("V")) = NN$
- _morphisms_: for $n, m in NN$ we define $Hom("V", n, m) = "the set of" m times n "matrices with real entries".$ Furthermore, the identity morphism of $Hom("V", n, n)$ is the $(n times n)$ identity matrix $I_(n times n) in Hom("V", n, n)$.
- _composition_: The composition of morphisms is given by matrix multiplication, $ Hom("V", n, m) times Hom("V", m, p) to Hom("V", n, p) \ (A, B) |-> B times A. $
- _identity_: For any object $n in NN$ of $sans(V)$, we take the $(n times n)$ identity matrix $I_(n times n) in Hom("V", n, n)$  to be the identity morphism.
Associativity for composition follows from the associativity of matrix multiplication. The identity morphism is the identity with respect to composition by the fact that $A times I_(n times n) = A$ and $I_(n times n) times B = B$ for any $(m times n)$ matrix, $A$, and $(n times m)$ matrix, $B$. Finally, $Hom("V", n, m)$ and $Hom("V", p, q)$ are equal only if $n = p$ and $m = q$ as otherwise, they would contain matrices of different dimension.

*Problem 3.7*

Let $sanC$ be a cateogry and let $A$ be an object in $sanC$. We define the co-slice category $sanC^A$ as follows.
- _objects_: $Obj(sanC^A) = $ all morphisms from $A$ to any object in $sanC$
- _morphisms_: for objects $f_1, f_2$ of $sanC^A$, the morphisms $f_1 to f_2$ are defined to be _commutative diagrams_ #box(width:100%)[#align(center)[
  #commutative-diagram(
    node-padding: (30pt, 50pt),
    node((0, 0), $Z_1$),
    node((0, 2), $Z_2$),
    node((1,1), $A$),
    arr($A$, $Z_1$, $f_1$),
    arr($A$, $Z_2$, $f_2$, label-pos: right),
    arr($Z_1$, $Z_2$, $sigma$, label-pos: left)
  )
]] in the ambient category $sanC$. Alternatively, morphisms $f_1 to f_2$ correspond to those morphisms $sigma: Z_1 -> Z_2$ in $sanC$ such that $sigma f_1 = f_2.$
- _composition_: The composition of two morphisms $f_1 -> f_2$ and $f_2 -> f_3$ corresponding to the diagrams \ #box(width:100%)[
  #align(center)[
  #commutative-diagram(
    node-padding: (30pt, 50pt),
    node((0, 0), $Z_1$),
    node((0, 2), $Z_2$),
    node((1, 1), $A$),
    arr($A$, $Z_1$, $f_1$),
    arr($A$, $Z_2$, $f_2$, label-pos: right),
    arr($Z_1$, $Z_2$, $sigma_1$)
   )
  #commutative-diagram(
    node-padding: (30pt, 50pt),
    node((0, 0), $Z_2$),
    node((0, 2), $Z_3$),
    node((1, 1), $A$),
    arr($A$, $Z_2$, $f_2$),
    arr($A$, $Z_3$, $f_3$, label-pos: right),
    arr($Z_2$, $Z_3$, $sigma_2$)
   )]] is given by the diagram \ #box(width:100%)[
    #align(center)[
      #commutative-diagram(
        node-padding: (30pt, 50pt),
        node((0, 0), $Z_1$),
        node((0, 2), $Z_3$),
        node((1, 1), $A$),
        arr($A$, $Z_1$, $f_1$),
        arr($A$, $Z_3$, $f_3$, label-pos: right),
        arr($Z_1$, $Z_3$, $sigma_2 sigma_1$)
      )
    ]
   ]
- _identity_: For any object $f: A -> Z$ of $sans(C)^A$, we define the identity morphism $1_f$  to correspond to the morphism $1_(Z)$ in $sans(C)$--- that is, the identity $1_f$ corresponds to the diagram \ \ #box(width:100%)[
#import "@preview/fletcher:0.5.0" as fletcher: diagram, node, edge
  #align(center)[
  #diagram(
    spacing: (10mm, 15mm),
    node((0, 0), $Z$, name:<Z>),
    node((0, 1), $A$, name:<A>),
    edge((0, 0), (0, 0), "->", bend:130deg, $1_Z$),
    edge(<A>, <Z>, "->", $f$, label-side: left),
  )
  ]]

*Problem 3.8*

#let setinf = $sans("Set")^oo$
We define the category of _infinite sets_, $setinf$, as follows
- _objects_: $Obj(setinf)=$ the collection of all infinite sets,
- _morphisms_: For $A, B in Obj(setinf)$, $Hom(sans("Set")^oo, A, B) = B^A$, 
- _composition_: Composition of morphisms is defined to be the same as the composition of functions, 
- _identity_: For any object $A$ of $sans("Set")^oo$, the identity is defined to be the identity function on $A$.

We may view $sans("Set")^oo$ as a subcategory of $sans("Set")$ since $"Obj"(setinf) subset.eq Obj(sans("Set"))$ and $Hom(setinf, A, B) subset.eq Hom(sans("Set"), A, B)$, for any $A, B in sans("Set")^oo$. In fact, $Hom(setinf, A, B) = Hom(sans("Set"), A, B) = B^A$. This justifies calling $setinf$ a full subcategory of $sans("Set")$.

*Problem 3.9*

#let Mset = $sans("MSet")$
We define the category of _multisets_, $Mset$ , as follows 

- _objects_: $Obj(Mset) = $ the collection of all tupples $(A, approx)$ where $A$ is a set and $approx$ is an equivalence relation on $A$,
- _morphisms_: For $(A, approx_A), (B, approx_B) in Obj(Mset)$, we define $Hom(Mset, A, B)$ to be the set of all functions $f: A -> B$ such that $a approx_A b ==> f(a) approx_B f(b)$ ,
- _composition_: Composition of morphisms is defined to be the same as the composition of functions,
- _identity_: For any object $(A, approx_A)$ of $Mset$, the identity is defined to be the same as the composition of functions. 

#let Set = $sans("Set")$
Note that we may view $Set$ as a full subcategory of $Mset$ (or at least, a copy of $Set$). We define a copy of $Set$, $Set'$, as follows

- _objects_: $Obj(Set')$ the collection of all tuples $(A, approx)$ where $approx$ is the identity relation on $A$,
- _morphisms_: For $(A, approx_A), (B, approx_B) in Obj(Set')$, we define $Hom(Set', A, B) = B^A$. Note that $Hom(Mset, A, B) = B^A$ to as for all functions $f: A -> B$, we have $a approx_A b => a = b => f(a) approx_B f(b).$ 
- _composition_: Composition of morphisms is defined to be the same as the composition of functions,
- _identity_: For any object $(A, approx_A)$ of $Set'$, the identity is defined to be the same as the composition of functions. 

Clearly, $Set'$ is a full subcategory of $Mset$.

*Problem 3.11*

+ $sans(C)^(A, B)$\ Start from a category $sans(C)$ and two objects $A, B$ of $sans(C)$. We then
  define a new category $sans(C)_(A, B)$ as follows
  - _objects_: $Obj(sans(C)^(A, B)) =$ diagrams\ #box(width: 100%)[#align(center)[
        #commutative-diagram(
          node-padding: (50pt, 20pt),
          node((0, 0), $Z$),
          node((-1, 1), $A$),
          node((1, 1), $B$),
          arr($A$, $Z$, $f$, label-pos: right),
          arr($B$, $Z$, $g$, label-pos: left),
        )
      ]] in $sans(C)$;

  - _morphisms_:\ #box(width: 100%)[#align(center)[
        #commutative-diagram(
          node-padding: (40pt, 25pt),
          node((0, 0), $Z_1$),
          node((-1, 1), $A$),
          node((1, 1), $B$),
          node((0, 2), $Z_2$, "Z2"),
          node((-1, 3), $A$, "A1"),
          node((1, 3), $B$, "B1"),
          node((0, 1), $$, "S"),
          arr($A$, $Z_1$, $f_1$, label-pos: right),
          arr("A1", "Z2", $f_2$, label-pos: right),
          arr($B$, $Z_1$, $g_1$),
          arr("B1", "Z2", $g_1$),
          arr("S", "Z2", $$),
        )
      ]] are _commutative diagrams_ #align(center)[
      #commutative-diagram(
        node-padding: (40pt, 30pt),
        node((0, 0), $Z_1$),
        node((0, 1), $Z_2$),
        node((-1, 2), $A$),
        node((1, 2), $B$),
        arr($Z_2$, $Z_1$, $sigma$, label-pos: right),
        arr($A$, $Z_2$, $f_2$),
        arr($B$, $Z_2$, $g_2$, label-pos: right),
        arr($A$, $Z_1$, $f_1$, curve: -25deg, label-pos: right),
        arr($B$, $Z_1$, $g_1$, curve: 25deg),
      )
    ] Alternatively, morphisms in $sans(C)_(A, B)$ corresponds to those morphisms $sigma: Z_2 -> Z_1$ in $sans(C)$ such
    that $f_1 = sigma f_2$ and $g_1 = sigma g_2$.
  - _composition_: Consider the two morphisms #align(center)[#commutative-diagram(
        node-padding: (40pt, 30pt),
        node((0, 0), $Z_1$),
        node((0, 1), $Z_2$),
        node((-1, 2), $A$),
        node((1, 2), $B$),
        arr($Z_2$, $Z_1$, $sigma$, label-pos: right),
        arr($A$, $Z_2$, $f_2$),
        arr($B$, $Z_2$, $g_2$, label-pos: right),
        arr($A$, $Z_1$, $f_1$, curve: -25deg, label-pos: right),
        arr($B$, $Z_1$, $g_1$, curve: 25deg),
      )
#commutative-diagram(
        node-padding: (40pt, 30pt),
        node((0, 0), $Z_2$),
        node((0, 1), $Z_3$),
        node((-1, 2), $A$),
        node((1, 2), $B$),
        arr($Z_3$, $Z_2$, $sigma'$, label-pos: right),
        arr($A$, $Z_3$, $f_3$),
        arr($B$, $Z_3$, $g_3$, label-pos: right),
        arr($A$, $Z_2$, $f_2$, curve: -25deg, label-pos: right),
        arr($B$, $Z_2$, $g_2$, curve: 25deg),
      )
    ] Then, their composition corresponds to the commutative diagram   #align(center)[#commutative-diagram(
        node-padding: (40pt, 30pt),
        node((0, 0), $Z_1$),
        node((0, 1), $Z_2$),
        arr($Z_2$, $Z_1$, $sigma$, label-pos: right),
        arr($A$, $Z_2$, $f_2$, curve: -15deg, label-pos: right),
        arr($B$, $Z_2$, $g_2$, curve: 15deg),
        arr($A$, $Z_1$, $f_1$, label-pos: right, curve: -25deg),
        arr($B$, $Z_1$, $g_1$, curve: 25deg),
        node((0, 3), $Z_3$),
        node((-1, 5), $A$),
        node((1, 5), $B$),
        arr($A$, $Z_3$, $f_3$),
        arr($B$, $Z_3$, $g_3$, label-pos: right), 
        arr($Z_3$, $Z_2$, $sigma '$, label-pos: right))] That is, the composition of the two morphism corresponds to the following morphism #align(center)[#commutative-diagram(
          node-padding: (40pt, 30pt), 
          node((0, 0), $Z_1$),
          node((0, 1), $Z_4$),
          arr($Z_4$, $Z_1$, $sigma sigma'$, label-pos: right),
          node((-1, 2), $A$),
          node((1, 2), $B$),
          arr($A$, $Z_1$, $f_1$, curve: -20deg, label-pos: right),
          arr($B$, $Z_1$, $g_1$, curve: 20deg),
          arr($A$, $Z_4$, $f_3$),
          arr($B$, $Z_4$, $g_3$, label-pos: right)
        )]

  - _identity_: The identity morphism corresponds to the following commutative diagram #align(center)[
      #commutative-diagram(
        node-padding: (40pt, 30pt),
        node((0, 0), $Z$, "Z_1"),
        node((0, 1), $Z$, "Z_2"),
        node((-1, 2), $A$),
        node((1, 2), $B$),
        arr("Z_2", "Z_1", $"id"_Z$, label-pos: right),
        arr($A$, "Z_2", $f$),
        arr($B$, "Z_2", $g$, label-pos: right),
        arr($A$, "Z_1", $f$, curve: -25deg, label-pos: right),
        arr($B$, "Z_1", $g$, curve: 25deg),
      )
    ]

+ $italic("Fibered") sans(C)^(A, B)$ \ Start with a given category $sans("C")$ and choose two fixed morphisms $alpha: C -> A, beta: C -> B$ in $sans("C")$ with
  the same target $C$. We can then consider a category $C^(alpha, beta)$ as
  follows
  - _objects_: $Obj(sans(C)^(alpha, beta))$ = commutative diagrams\ #box(width: 100%)[#align(center)[
        #commutative-diagram(
          node-padding: (40pt, 30pt),
          node((0, 0), $Z$),
          node((-1, 1), $A$),
          node((1, 1), $B$),
          node((0, 2), $C$),
          arr($A$, $Z$, $f$, label-pos: right),
          arr($B$, $Z$, $g$),
          arr($C$, $A$, $alpha$, label-pos: right),
          arr($C$, $B$, $beta$, label-pos: left),
        )
      ]] in $sans(C)$;
  - _morphisms_: morphisms correspond to commutative diagrams\ #box(width: 100%)[#align(center)[
        #commutative-diagram(
          node-padding: (40pt, 30pt),
          node((0, 0), $Z_1$),
          node((0, 1), $Z_2$),
          node((-1, 2), $A$),
          node((1, 2), $B$),
          node((0, 3), $C$),
          arr($A$, $Z_1$, $f_1$, curve: -25deg, label-pos: right),
          arr($B$, $Z_1$, $g_1$, curve: 25deg),
          arr($A$, $Z_2$, $f_2$, label-pos: right),
          arr($B$, $Z_2$, $g_2$),
          arr($C$, $A$, $alpha$, label-pos: right),
          arr($C$, $B$, $beta$, label-pos: left),
          arr($Z_2$, $Z_1$, $sigma$, label-pos: right),
        )
      ]]
  - _composition_: Consider the two morphisms #align(center)[
        #commutative-diagram(
          node-padding: (40pt, 30pt),
          node((0, 0), $Z_1$),
          node((0, 1), $Z_2$),
          node((-1, 2), $A$),
          node((1, 2), $B$),
          node((0, 3), $C$),
          arr($A$, $Z_1$, $f_1$, curve: -25deg, label-pos: right),
          arr($B$, $Z_1$, $g_1$, curve: 25deg),
          arr($A$, $Z_2$, $f_2$, label-pos: right),
          arr($B$, $Z_2$, $g_2$),
          arr($C$, $A$, $alpha$, label-pos: right),
          arr($C$, $B$, $beta$),
          arr($Z_2$, $Z_1$, $sigma$, label-pos: right),
        )
      #commutative-diagram(
          node-padding: (40pt, 30pt),
          node((0, 0), $Z_2$),
          node((0, 1), $Z_3$),
          node((-1, 2), $A$),
          node((1, 2), $B$),
          node((0, 3), $C$),
          arr($A$, $Z_2$, $f_2$, curve: -25deg, label-pos: right),
          arr($B$, $Z_2$, $g_2$, curve: 25deg),
          arr($A$, $Z_3$, $f_3$, label-pos: right),
          arr($B$, $Z_3$, $g_3$),
          arr($C$, $A$, $alpha$, label-pos: right),
          arr($C$, $B$, $beta$),
          arr($Z_3$, $Z_2$, $sigma'$, label-pos: right),
        )
] Then their composition corresponds to the commutative diagram #align(center)[
        #commutative-diagram(
          node-padding: (40pt, 30pt),
          node((0, 0), $Z_1$),
          node((0, 1), $Z_2$),
          arr($A$, $Z_1$, $f_1$, curve: -25deg, label-pos: right),
          arr($B$, $Z_1$, $g_1$, curve: 25deg),
          arr($A$, $Z_2$, $f_2$, label-pos: right),
          arr($B$, $Z_2$, $g_2$),
          arr($C$, $A$, $alpha$, label-pos: right),
          arr($C$, $B$, $beta$),
          arr($Z_2$, $Z_1$, $sigma$, label-pos: right),
          node((0, 3), $Z_3$),
          node((-1, 4), $A$),
          node((1, 4), $B$),
          node((0, 5), $C$),
          arr($A$, $Z_3$, $f_3$, label-pos: 0.65em),
          arr($B$, $Z_3$, $g_3$, label-pos: right),
          arr($Z_3$, $Z_2$, $#h(10pt) sigma'$, label-pos: right)
        )
] That is, the composition of the two morphism corresponds to the following morphism #align(center)[
        #commutative-diagram(
          node-padding: (40pt, 30pt),
          node((0, 0), $Z_1$),
          node((0, 1), $Z_2$),
          node((-1, 2), $A$),
          node((1, 2), $B$),
          node((0, 3), $C$),
          arr($A$, $Z_1$, $f_1$, curve: -25deg, label-pos: right),
          arr($B$, $Z_1$, $g_1$, curve: 25deg),
          arr($A$, $Z_2$, $f_3$),
          arr($B$, $Z_2$, $g_3$, label-pos: right),
          arr($C$, $A$, $alpha$, label-pos: right),
          arr($C$, $B$, $beta$),
          arr($Z_2$, $Z_1$, $sigma sigma'$, label-pos: right),
        )
]
  - _identity_: The identity morphism corresponds to the following commutative diagram #align(center)[
        #commutative-diagram(
          node-padding: (40pt, 30pt),
          node((0, 0), $Z$, "Z_1"),
          node((0, 1), $Z$, "Z_2"),
          node((-1, 2), $A$),
          node((1, 2), $B$),
          node((0, 3), $C$),
          arr($A$, "Z_1", $f$, curve: -25deg, label-pos: right),
          arr($B$, "Z_1", $g$, curve: 25deg),
          arr($A$, "Z_2", $f$),
          arr($B$, "Z_2", $g$, label-pos: right),
          arr($C$, $A$, $alpha$, label-pos: right),
          arr($C$, $B$, $beta$),
          arr("Z_2", "Z_1", $"id"_Z$, label-pos: right),
        )
]]


== Morphisms

*Problem 4.1*

We use induction to show that $f_n f_(n - 1) dots.c f_1$ equals $(dots.c ((f_n f_(n - 1)) f_(n - 2)) dots.c f_1)$. The base case $n = 2$ is trivially true as $f_2 f_1 = (f_2 f_1)$. 

Now, assuming this holds for some $n >= 2$, we wish to show that it holds for $n + 1$ too. Particularly, note that $ f_(n + 1) f_n dots.c f_1 = (f_(n + 1) f_n dots.c f_2) f_1 overbrace(=, "IH")  ( dots.c ((f_(n + 1) f_n) f_(n - 1)) dots f_2) f_1 $

Thus, this holds for $n + 1$ too. By induction, it must be true for all $n in NN_(>= 2)$. 

*Problem 4.2*

== Universal Properties

*Problem 5.2*

*Problem 5.3*

*Problem 5.5*

*Problem 5.6*

*Problem 5.12*
