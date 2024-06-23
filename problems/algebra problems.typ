#import "@local/preamble:0.1.0": *
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
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

== Functions between sets

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

*Problem 2.2*: _$f$ has a right inverse if and only if it is surjective._

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

#theorem[A function is surjective iff it is an epimorphism]
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
