#import "@local/preamble:0.1.0": *
#import "@preview/commute:0.3.0": node, arr, commutative-diagram

#show: project.with(
  course: "Algebra",
  sem: "the Pit",
  title: "Modules and Vector Spaces",
  subtitle: "",
  // authors: ("Shaleen Baral",),
)

= Modules, vector spaces and algebras 

We start off by recalling some basic language to describe sets endowed with structures.

#definition[For a non-empty set $E$, an _internal law of composition_ is a map $dot : E times E -> E$. Then the tuple $(E, dot)$ is referred to as a _magma_.]

The properties of the law of composition give rise to various algebraic structures.

#definition[ + a magma $(E, dot)$ is a _semigroup_ if $dot: E times E -> E$ is associative;
+ a semigroup $(E, dot)$ is a _monoid_ if it has an identity element;
+ a monoid $(E, dot)$ is a _group_ if every element has an inverse.
+ a group $(E, dot)$ is _abelian_ if $dot: E times E -> E$ is commutative.]

A set may be endowed with multiple such composition laws, the interplay between which gives rise to further algebraic structures.

#definition[If $E$ is a non-empty set, $+: E times E -> E$ and $dot: E times E -> E$ then the triplet $(E, +, dot)$ is a _ring_ if 
+ $(E, +)$ is an abelian group;
+ $(E, dot)$ is a monoid;
+ $forall x, y in E$, we have $x(y + z) = x y + x z$ and $(y + z)x = x y + z x$.

If a ring has no nonzero zero divisors then it is an _integral domain_. // If $dot : E times E -> E$ is commutative then it is a _commutative ring_. 
If the non-zero elements of $E$ form a group under $dot: E times E -> E$ then it is a _field_.]

Now, we encounter the central character of our narrative.

#definition[Let $R$ be a ring. By a _(left) $R$-module_, we shall mean an abelian group $M$ together with a left action $R times M -> M$ described by $(lambda, x) |-> lambda x$ satisfying 
+ $forall lambda in R$ and $forall x, y in M$ we have $lambda (x + y) = lambda x + lambda y$;
+ $forall lambda, mu in R$ and $forall x in M$ we have $(lambda + mu) x = lambda x + mu x$;
+ $forall lambda, mu in R$ and $forall x in M$ we have $lambda (mu x) = (lambda mu) x$;
+ $forall x in M$ we have $1_R x = x$.]

The following properties are immediate. 

#prop[Let $M$ be an $R$-module. Then 
+ $forall lambda in R$ we have $lambda 0_M = 0_M$;
+ $forall lambda x in M$ we have $0_R x = 0_M$;
+ $forall lambda in R$ and $forall x in M$ we have $lambda (-x) = -(lambda x) = (-lambda) x$.
Moreover, if $R$ is a division ring, then 
 4. $lambda x = 0_M$ implies that $lambda = 0_R$ or $x = 0_M$.]
#proof[
  + $lambda 0_M = lambda (0_M + 0_M) = lambda 0_M + lambda 0_M$;
  + $0_R x = (0_R + 0_R) x = 0_R x + 0_R x$;
  + $lambda (-x) + lambda x = lambda (-x + x) = lambda 0_M = 0_M$ and $(-lambda) x + lambda x = (-lambda + lambda) x = 0_R x = 0_M$;
  + Suppose $x != 0_R$. Then $lambda^(-1) lambda x = (lambda)^(-1) 0_M = 0_M$.  
]

#example[
  + Every ring $R$ is an $R$-module. Every field $F$ is an $F$-vector sapce.
  + Every additive abelian group $M$ is a $ZZ$-module. The action $ZZ times M -> M$ is given by $m |-> m x$ where $ m x = cases(overbrace(x + x + ... + x, m) #h(15pt) &"if" m > 0\;, 0 &"if" m = 0\;, -|m|x &"if" m < 0.) $
  + If $R$ is a ring and $S subset.eq R$ is a subring containing $1_R$ then $R$ is an $S$-module under the action $(s, r) |-> s r$.
  + If $R$ is a ring and $n in NN_(> 0)$ then the abelian group $R^n$ of all $n$-tuples of elements of $R$ under component-wise addition then $R^n$ is a $R$-module under the left action $R times R^n -> R^n$ defined by $ r (x_1, ..., x_n) = (r x_1, ..., r x_n). $ If $F$ is a field then $F^n$ is an $F$-vector space.
  + Let $R$ be a ring and $R^NN$ denote the set of all mappings $NN -> R$. We endow $R^NN$ with the addition $ (f + g)(n) = f(n) + g(n). $ $(R^NN, +)$ is an abelian group. We also define an action $R times R^NN -> R^NN$ by $(r, f) |-> r f$ where $r f$ is defined by $ (r f) (n) = r f(n). $ Then $(R^NN, +, times)$ is an $R$-module.
]

Endowing a $R$-module with an appropriate multiplication operation gives rise to an $R$-algebra.

#definition[Let $R$ be a commutative ring. An $R$-algebra is an $R$-module $A$ togethew with an internal law of composition $A times A -> A$, called _multiplication_, which is distributive over addition and such that $ forall lambda in R, forall x, y in A. #h(15pt) lambda (x y) = (lambda x) y = x (lambda y). $ If every non-zero element has an inverse, then it is a _division algebra_.]

#example[
  + If $R$ is a ring then $"Mat"_(n times n) (R)$, the set of $n times n$ matrices over $R$, is an associative $R$-algebra.
  + $CC$ is a division algebra over $RR$.
  + Let $R$ be a commutative ring and consider the $R$-module $R^NN$ defined prior. Given $f, g: NN -> R$, we define the product map $f g: NN -> R$ by $ (f g)(n) = sum_(i = 1)^n f(i) g(n - i). $ Then this multiplication makes $R^NN$ a $R$-algebra. This $R$-algebra is called the _algebra of formal power series with coefficients in $R$_. We justify this terminology now. First, define $t in R^NN$ by $ t(n) = cases(1 #h(15pt) &"if" n = 1\;, 0 &"otherwise.") $ and for every $m in NN_(> 0)$, the $m$-fold composite map $ t^m = underbrace(t compose t compose dots compose t, m). $ This admits a simple description $ t^m = cases(1 #h(15pt) &"if" n = m\;, 0 &"otherwise.") $ We then consider the formal power series associated with $f in R^NN$, given by $ nu = sum_(i >= 0) f(i) t^i, $ where $t^0 = id_R$, the identity map on $R$. It is readily seen that $forall n in NN$, we have $f(n) = nu(n)$.
]


= Submodules, intersection and sums

We now discuss creating new modules out of old ones.

#definition[If $S$ is a non-empty subset of an additive group $G$ then $S$ is said to be a _stable subset_ of $G$, or _closed under the operation of $G$_, if $ forall x, y in S. #h(15pt) x + y in S. $]

It is clear that a stable subset is always a _semigroup_.

#definition[A _subgroup_ of a group $G$ is a non-empty subset that is stable and also a group under the induced law of composition.]

We have a very clean characterization for subgroups.
#lemma[A non-empty subset $H subset.eq G$ of a group $G$ is a subgroup if and only if $forall x, y in H$ we have $x - y in H$.]
#proof[ The forward direction is clear. For the backward direction, we need to show the existene of the identity and inverses. For the first, note that for any $x in H$, we get $0 = x - x in H$. Next, for any $x in H$ as $0 in H$, we also have $-x = 0 - x in H$.]

These ideas also extend to modules and algebras. 

#definition[By a _submodule_ of an $R$-module $M$ we mean a subgroup $N$ of $M$ that is stable under the action of $R$ on $M$, in the sense that if $x in N$ and $lambda in R$ then $lambda x in N$.]
#lemma[A non-empty subset $N subset.eq M$ of an $R$-module $M$ is a submodule of $M$ if and only if $forall x, y in N$ and $forall lambda, mu in R$ we have $lambda x + mu y in N$.]

#definition[By a _subalgebra_ of an $R$-algebra $A$ we mean a submodule $B$ of $A$ that is closed under the multiplication law for $A$.]
#lemma[A non-empty subset $B subset.eq A$ of an $R$-algebra $A$ is a subalgebra if and only if $ forall x, y in B. #h(5pt) forall lambda in R. #h(15pt) x - y in B, x y in B, lambda x in B. $]

#example[
  + Viewing a ring $R$ as a $R$-module, its submoduels are precisely the left ideals of $R$.
  + Let $C([a, b])$ be the set of continuous function $[a, b] -> RR$. Then $C([a, b])$ is an $RR$-vector space. The set $D([a, b])$ is the set of differentiable function $[a, b] -> RR$, which is a subspace of $C([a, b])$. Under point-wise multiplication, $C([a, b])$ is an $RR$-algebra and $D([a, b])$ is a sub-algebra.
  + If $G$ is an abelian group then the submodules of the $ZZ$-module $G$ are simply the subgroups of $G$.
]

The set of submodules, ordered by set inclusion, actually has a lattice structure. 

#prop[The intersection of any family of submodules of an $R$-module $M$ is a submodule of $M$.]

#definition[Let $S subset.eq M$ be a subset of the module $M$. The _submodules generated by $S$_, denoted $angle.l S angle.r$, is the smallest submodule of $M$ containing $S$.]

It is possible to give an explicit description of $angle.l S angle.r$. 

#definition[Let $M$ be an $R$-module and let $S$ be a non-empty subset of $M$. Then $x in M$ is a _linear combination of elements of $S$_ if there exist elements $x_1, ..., x_n$ in $S$ and scalars $lambda_1, ..., lambda_n$ in $R$ such that $ x = sum_(i = 1)^n lambda_i x_i. $ We denote the set of all linear combinations of lements of $S$ by $"span"(S)$.]
#prop[Let $S$ be a subset of the $R$-module $M$. Then $ angle.l S angle.r = cases({0} #h(40pt) &"if" S = emptyset\;, "span"(S) &"otherwise".) $]

#definition[We say that an $R$-module $M$ is _generated_ by the subset $S$, or that $S$ is a _set of generators_ of $M$, when $angle.l S angle.r$. By a _finitely-generated_ $R$-module we mean an $R$-module which has a finite set of generators.]

Thus, set intersection is the infimum operation for our lattice. Now, we introduce the supremum operation.

#prop[Let $(M_i)_(i in I)$ be a family of submodules of an $R$-module $M$. If $PP^star (I)$ denotes the set of all non-empty finite subsets of $I$ then the submodule generated by $union_(i in I) M_i$ consists of all finite sums of the form $sum_(j in J)m_j$ where $J in PP^star (I)$ and $m_j in M_j$.]

#definition[Let $(M_i)_(i in I)$ be a family of submodules of an $R$-module $M$. We call the submodule generated by the family $(M_i)_(i in I)$ the _sum of the family $(M_i)_(i in I)$_ and denote it $sum_(i in I) M_i$.]

#lemma[
  The following properties of the sum of submodules is immediate. 
  + (commutativity of $sigma$) If $sigma: I -> I$ is a bijection then $sum_(i in I) M_i = sum_(i in I) M_(sigma(i))$. 
  + (associativity of $sigma$) If $(I_k)_(k in A)$ is a family of non-empty subsets of $I$ with $I = union_(k in A) I_k$ then $ sum_(i in I) M_i = sum_(k in A) (sum_(i in I_k) M_i ). $ 
  + $forall i in I$, we have $ sum_(i in I) M_i = M_i + sum_(j != i) M_j. $
]

The lattice of submodules is actually modular. 

#prop[If $M$ is an $R$-module and if $A, B, C$ are submodules of $M$ with $C subset.eq A$ then $ A sect (B + C) = (A sect B) + C. $]
#proof[
  As $C subset.eq A$, we know that $A + C = A$. Note that $(A sect B) + C subset.eq A + C = A$ and $(A sect B) + C subset.eq B + C$. That is, 
  $ (A sect B) + C subset.eq A  sect (B + C). $
  For the reverse inclusion, let $a in A sect (B + C)$ and $b in B, c in C$ such that $a = b + c$. Then, $b = a - c in A + C = A$. Thus, $a = b + c subset.eq (A sect B) + C$.
]

= Morphisms and exact sequences

We are interested in structure-preserving maps. For example, from the theory of groups,

#definition[Let $G, H$ be groups. A map $f: G -> H$ is called a _morphism_ (or _homomorphism_) if $ forall x, y in G. #h(10pt) f(x + y) = f(x) + f(y). $]

#lemma[A morphism $f: G -> H$ maps $G$ onto a subgroup of $H$, $ "Im" f = { f(x) | x in G}. $ Furthermore, we have 
+ $f(0_G) = 0_H;$
+ $forall x in G. #h(5pt) f(-x) = -f(x).$]

We can extend the notion of a morphism to modules, in a manner that still preserves the two properties given by the lemma. 

#definition[If $M$ and $N$ are $R$-modules then a mapping $f: M -> N$ is called an _$R$-morphism_ if 
+ $forall x,y in M. #h(5pt) f(x + y) = f(x) + f(y);$
+ $forall x in M. forall lambda in R. #h(5pt) f(lambda x) = lambda f(x).$ When $R$ is a field, an $R$-morphism is called a _linear transformation_. An $R$-morphism is called an _$R$-monomorphism_ if it is injective; an _$R$-epimorphism_ if it is surjective; and an _$R$-isomorphism_ if it is bijective. An $R$-morphism $f: M -> M$ is an _$R$-endomorphism_ on $M$.]

#example[
  + For abelian groups $M, N$ viewed as $ZZ$-modules, a $ZZ$-morphism is just a group morphism. 
  + If $M$ is an $R$-module and $n in ZZ^+$, the mapping $"pr"_i: M^n -> M$ described by $ "pr"_i (x_1, ..., x_n) = x_i $ is an $R$ epimorphism, called the _$i$-th projection of $M^n$ onto $M$_.
]

An important property of morphisms $f: M -> N$ is that it induces mappings between the corresponding lattices of submodules. 

#prop[Let $M$ and $N$ be $R$-modules and $f: M -> N$ an $R$-morphism. Then for every submodule $X$ of $M$ the set $f(X)$ is a submodule of $N$ and for every submodule $Y$ of $N$ the set $f^(-1)(Y)$ is a submodule of $M$.]

Particularly, this lets us define mappings $f: L(M) -> L(N)$ and $f^(-1): L(N) -> L(M)$ wherein $L(dot)$ denotes the lattice of submodules. Note also that these induced mappings are inclusion-preserving. For an $R$-morphism $f: M -> N$, $f(M)$ is also called the _image_ of $f$ and $f^(-1)({0_N})$ is called the _kernel_ of $f$. Immediately, we have,
#lemma[Let $f: M -> N$ be an $R$-morphism. Then 
+ $f$ is a monomorphism if and only if $"Ker"(f) = {0_M}$; 
+ $f$ is an epimorphism if and only if $"Im"(f) = N$.]

We now expand on some properties of the map induced on the lattice of submodules.

#lemma[Let $f: M -> N$ be an $R$-morphism. If $A$ is a submodule of $M$ and $B$ is a submodule of $N$ then 
+ $f(A sect f^(-1)(B)) = f(A) sect B;$
+ $f^(-1)(B + f(A)) = f^(-1)(B) + A.$]

The following is a useful application of this, 
#prop[If $A$ is a submodule of $M$ and $B$ is a subdmodule of $N$ then 
+ $f(f^(-1)(B)) = B sect "Im" f;$
+ $f^(-1)(f(A)) = A + "Ker" f.$]

It is useful to remember certain facts about composition.
#lemma[
  + if $f: M -> N$ and $g: N -> P$ are $R$-morphisms then so is $g compose f$;
  + if $f: M -> N$ and $g: N -> P$ are $R$-monomorphisms then so is $g compose f$;
  + if $f: M -> N$ and $g: N -> P$ are $R$-epimorphisms then so is $g compose f$;
  + if $g compose f$ is an epimorphism then so is $g$;
  + if $g compose f$ is a monomorphism then so is $f$.
]

With respect to composition, we are interested in "diagram completing" problems. That is, suppose we have a diagram of the form

#align(center)[#commutative-diagram(
  node((0, 0), $A$),
  node((0, 1), $C$),
  node((1, 0), $B$),
  arr($A$, $B$, $f$, label-pos: right),
  arr($A$, $C$, $g$, label-pos: left),
  // arr("quot", (0, 1), $tilde(f)$, label-pos: right, "dashed", "inj"),
  // arr($X$, "quot", $pi$),
)]

and we want to know the conditions under which there exists an $R$-morphism $h: B -> C$ such that $h compose f = g$. We also have the "dual" problem, where we have a diagram of the form

#align(center)[#commutative-diagram(
  node((1, 1), $A$),
  node((0, 1), $C$),
  node((1, 0), $B$),
  arr($B$, $A$, $f$, label-pos: right),
  arr($C$, $A$, $g$, label-pos: left),
  // arr("quot", (0, 1), $tilde(f)$, label-pos: right, "dashed", "inj"),
  // arr($X$, "quot", $pi$),
)]

and we want to know the conditions under which there exists an $R$-morphism $h: C -> B$ such that $f compose h = g$. 

As a warmup, we consider these problems when $A, B, C$ are sets and $f, g$ are simply mappings.

#prop[
  + If $A, B, C$ are non-empty sets and $f: A -> B$ and $g: A -> C$ are mappings then the following statements are equivalent 
    - there exists a mapping $h: B -> C$ such that $h compose f = g$;
    - $forall x, y in A. #h(5pt) f(x) = f(y) => g(x) = g(y)$.
  + If $A, B, C$ are non-empty sets and $f: B -> A$ and $g: C -> A$ are mappings then the following statements are equivalent
    - there exists a mapping $h: C -> B$ such that $f compose h = g$;
    - $"Im" g subset.eq "Im" f$.
]

= Quotient modules and isomorphism theorems

= Chain conditions and Jordan-Hölder towers
