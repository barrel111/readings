#import "@local/preamble:0.1.0": *
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#show: project.with(
  course: "Analysis",
  sem: "Summer",
  title: "Measure, Integration and Real Analysis",
  subtitle: "Axler",
  authors: ("Shaleen Baral",),
)

#set enum(indent: 15pt, numbering: "a.")

= Riemann Integration

== Review: Riemann Integral 

#definition("partition")[ Suppose $a, b in RR$ with $a < b$. A _partition_ of $[a, b]$ is a finite list of the form $x_0, x_1, dots, x_n$, where $ a = x_0 < x_1 < dots.c < x_n = b. $]

We use a partition $x_1, x_1, dots, x_n$ of $[a, b]$ to think of $[a, b]$ as a union of closed subintervals, 
$ [a, b] = [x_0, x_1] union [x_1, x_2] union dots.c union [x_(n - 1), x_n]. $

#definition("notation for infimum and supremum of a function")[If $f$ is a real-valued function and $A$ is a subset of the domain of $f$, then $ inf_A f = inf {f(x) : x in A} #h(5pt) "and" #h(5pt) sup_A f = sup {f(x) : x in A}. $]

#definition("lower and upper Riemann sums")[Suppose $f: [a, b] -> RR$ is a bounded function and $P$ is a partition $x_0, dots, x_n$ of $[a, b]$. The _lower Riemann sum_ $L(f, P, [a, b])$ and the _upper Riemann sum_ $U(f, P, [a, b])$ are defined by $ L(f, P, [a, b]) = sum_(j = 1)^n (x_j - x_(j - 1)) inf_([x_(j - 1), x_j]) f $ and $ U(f, P, [a, b]) = sum_(j = 1)^n (x_j - x_(j - 1)) sup_([x_(j - 1), x_j]) f. $]

#lemma("inequalities with Riemann sums")[ Suppose $f: [a, b] -> RR$ is a bounded function and $P, P'$ are partitions of $[a, b]$ such that the list are defining $P$ is a sublist of the list defining $P'$. Then $ L(f, P, [a, b]) <= L(f, P', [a, b]) <= U(f, P', [a, b]) <= U(f, P, [a, b]). $]

#lemma($"lower Riemann sums" <= "upper Riemann sums"$)[Suppose $f: [a, b] -> RR$ is a bounded function and $P, P'$ are partitions of $[a, b]$. Then $ L(f, P, [a, b]) <= U(f, P', [a, b]). $]

#definition("lower and upper Riemann integrals")[Supose $f: [a, b] -> RR$ is a bounded function. The _lower Riemann integral_ $L(f, [a, b])$ and hte _upper Riemann integral_ $U(f, [a, b])$ of $f$ are defined by $ L(f, [a, b]) = sup_P L(f, P, [a, b]) $ and $ U(f, [a, b]) = inf_P U(f, P, [a, b]) $ where the supremum and infimum above are taken over all partitions $P$ of $[a, b]$.]

#lemma($"lower Riemann integral" <= "upper Riemann integral"$)[ Suppose $f: [a, b] -> RR$ is a bounded function. Then $ L(f, [a, b]) <= U(f, [a, b]). $]

#definition("Riemann integrable; Riemann integral")[+ A bounded function on a closed bounded interval is called _Riemann integrable_ if its lower Riemann integral equals its upper Riemann integral.
+ If $f: [a, b] -> RR$ is Riemann integrable, then the _Riemann integral_ $integral_a^b f$ is defined by $ integral_a^b f = L(f, [a, b]) = U(f, [a, b]). $]

#prop("continuous functions are Riemann integrable")[Every continuous real-valued function on each closed bounded interval is Riemann integrable.]

#lemma("bounds on Riemann integral")[Suppose $f: [a, b] -> RR$ is Riemann integrable. Then $ (b - a) inf_([a, b]) f <= integral_a^b f <= (b - a) sup_([a, b]) f.  $]

== Riemann Integral Is Not Good Enough

There are three issues we discuss

+ Riemann integration does not handle functions with many discontinuities;

+ Riemann integration does not handle unbounded functions;

+ Riemann integration does not work well with limits. 

#example("a function that is not Riemann integrable")[
  Define $f: [0, 1] -> RR$ by $ f(x) = cases(1 #h(15pt) &"if" x "is rational," \ 0 &"if" x "is irrational.") $

  If $[a, b] subset.eq [0, 1]$ with $a < b$, then $ inf_([a, b]) f = 0 #h(10pt) "and" #h(10pt) sup_([a, b]) f= 1 $ because $[a, b]$ contains an irrational number and contains a rational number. Thus, $L(f, P, [0, 1]) = 0$ and $U(f, P, [0, 1]) = 1$ for any partition $P$ of $[0, 1]$. Since $L(f, [0, 1]) != U(f, [0, 1])$, we conclude that $f$ is not Riemann integrable. 
]

#example("Riemann integration does not work with unbounded functions")[ Define $f: [0, 1] -> RR$ by $ f(x) = cases(1/sqrt(x) #h(15pt) & "if" 0 < x <= 1"," \ 0 & "if" x = 0.) $

If $x_0, x_1, dots, x_n$ is a partition of $[0, 1]$, then $sup_[x_0, x_1] f = oo$. Then, $U(f, P, [0, 1]) = infinity$ for every partition $P$ of $[0, 1]$. 

However, we should consider the area under the graph of $f$ to be $2$ and not $oo$ as
$ lim_(a arrow.b 0) integral_a^1 f = lim_(a arrow.b 0) (2 - 2 sqrt(a)) = 2. $

Calculus courses fix with this issue by just defining $integral_0^1 1/sqrt(x) "dx"$ to be $lim_(a arrow.b 0) integral_a^1 1/sqrt(x) "dx"$. 
]

#example("area seems to make sense, but Riemann integral is not defined")[Let $r_1, r_2, dots$ be a sequence that includes each rational number in $(0, 1)$ exactly once and includes no other numbers. For $k in ZZ^+$, define $f_k: [0, 1] -> RR$ by $ f_k (x) = cases(1/(sqrt(x - r_k)) #h(15pt) &"if" x > r_k "," \ 0 &"if" x <= r_k".") $ Then define $f: [0, 1] -> [0, oo]$ by $ f(x) = sum_(k = 1)^infinity (f_k(x))/2^k. $ Since every nonempty open subinterval of $[0, 1]$ contains a rational number, $f$ is unbounded on every such subinterval. Thus, the Riemann integral of $f$ is undefined on every subinterval of $[0, 1]$ with more than one element. However, the area under the graph of each $f_k$ is less than $2$. Then by the definition of $f$, the area under the graph of $f$ should be less than $2$.]

#example("Riemann integration does not work well with pointwise limits")[
  Let $r_1, r_2, dots$ be a sequence that includes each rational number in $[0, 1]$ exactly once and that includes no other numbers. For $k in ZZ^+$, define $f_k: [0, 1] -> RR$ by $ f_k (x) = cases(1 #h(15pt) &"if" x in {r_1, dots, r_k}"," \ 0 &"otherwise.") $

  Each $f_k$ is Riemann integrable and $integral_0^1 f_k = 0$. 

  Define $f: [0, 1] -> RR$ by 
  $ f(x) = cases(1 #h(15pt) &"if" x "is rational," \ 0 #h(15pt) &"if" x "is rational.") $

  Then $ lim_(k -> infinity) f_k (x) = f(x) "for each" x in [0, 1]. $ However, $f$ is not Riemann integrable even though $f$ is the pointwise limit of a sequence of integrable functions bounded by $1$. 
]

There is a condition under which Riemann integrals behave well with limits-- though, this positive result has the undesirable hypothesis of the limit function $f$ being Riemann integrable.

#prop("interchanging Riemann integral and limit")[Suppose $a, b, M in RR$ with $a < b$. Suppose $f_1, f_2, dots$ is a sequence of Riemann integrable functions on $[a, b]$ such that $ |f_k (x)| <= M $ for all $k in ZZ^+$ and all $x in [a, b]$. Suppose $lim_(k -> infinity) f_k (x)$ exists for each $x in [a, b]$. Define $f: [a, b] -> RR$ by $ f(x) = lim_(k -> infinity) f_k (x). $ If $f$ is Riemann integrable on $[a, b]$, then $ integral_a^b f = lim_(k -> oo) integral_a^b f_k. $ ]

= Measures

== Outer Measure on $RR$

#definition("length of open interval")[The _length_ $ell(I)$ of an open interval $I$ is define by  $ ell (I) = cases(b - a #h(15pt) &"if" I = (a, b) "for some" a\, b in RR "with" a < b, 0 &"if" I = nothing, oo &"if" I = (-oo, a) "or" I = (a, oo) "for some" a in RR, oo &"if" I = (-oo, oo)) $]

#definition("outer measure")[The _outer measure_ $abs(A)$ of a set $A subset.eq RR$ is defined by $ abs(A) = inf { sum_(k = 1)^oo ell (I_k) bar I_1, I_2, dots "are open intervals such that" A subset.eq union.big_(k = 1)^infinity I_k }. $]

#example("finite sets have outer meaure 0")[Let $A = {a_1, dots, a_n}$ be a finite subset of $RR$. Suppose $epsilon > 0$. Define the sequence of $I_1, I_2, dots$ of open intervals by $ I_k = cases((a_k - epsilon \, a_k + epsilon) #h(15pt) &"if" k <= n, nothing &"if" k > n.) $ Then $I_1, I_2, dots$ is a sequence of open interval whose union contains $A$. Then, $sum_(k = 1)^infinity ell(I_k) = 2 epsilon n$. Hence $abs(A) <= 2 epsilon n$. Since $epsilon$ is an arbitrary positive number, this implies that $abs(A) = 0$.]

=== Good Properties of Outer Measure

#prop[Every countable subset of $RR$ has outer measure $0$.]
#prop[Suppose $A$ and $B$ are subsets of $RR$ with $A subset.eq B$. Then $abs(A) <= abs(B)$. ]

#definition("translation")[If $t in RR$ and $A subset.eq RR$, then the _translation_ $t + A$ is defined by $ t + A = {t + a bar a in A}. $]

#prop("translation invariant")[Suppose $t in RR$ and $A subset.eq RR$. Then $abs(t + A) = abs(A)$.]

#prop("countable subadditivity")[Suppose $A_1, A_2, dots$ is a sequence of subsets of $RR$. Then $ abs(union.big_(k = 1)^oo A_k) <= sum_(k = 1)^oo abs(A_k). $]

=== Outer Measure of Closed Bounded Interval

#definition("open cover; finite subcover")[Suppose $A subset.eq RR$
+ A collection $cal(C)$ of open subsets of $RR$ is called an _open cover_ of $A$ if $A$ is contained in the union of all the sets in $cal(C)$.
+ An open cover $cal(C)$ of $A$ is said to have a _finite subcover_ if $A$ is contained in the union of some finite list of sets in $cal(C)$.]

#prop("Heine-Borel Theorem")[Every open cover of a closed bounded subset of $RR$ has a finite subcover.]

#prop("outer measure of a closed interval)")[Suppose $a, b in RR$, with $a< b$. Then $abs([a, b]) = b - a$.]

#prop("nontrivial intervals are uncountable")[Every interval in $RR$ that contains at least two distint elements is uncountable.]

=== Outer Measure is Not Additive

#prop("non-additivity of outer measure")[There exist disjoint subsets $A$ and $B$ of $RR$ such that $abs(A union B) != abs(A) + abs(B)$.]

== Measurable Spaces and Functions

#prop( $"nonexistence of extension of length to all subsets of " RR$ )[There does not exist a function $mu$ with all the following properties. 
+ $mu$ is a function from the set of subsets of $RR$ to $[0, oo]$.
+ $mu(I) = ell(I)$ for every open interval $I$ of $RR$.
+ $mu(union.big_(k = 1)^oo A_k) = sum_(k = 1)^oo mu(A_k)$ for every disjoint sequence $A_1, A_2, dots$ of subsets of $RR$.
+ $mu(t + A) = mu(A)$ for every $A subset.eq RR$ and every $t in RR$.]

=== $sigma$-Algebras

#definition($sigma"-algebra"$)[Suppose $X$ is a set and $cal(S)$ is a set of subsets of $X$. THen $cal(S)$ is called a _$sigma$-algebra_ on $X$ if the following three conditions are satisfied: 
- $emptyset in cal(S)$;
- if $E in cal(S)$, then $X \\ E in cal(S)$;
- if $E_1, E_2, dots$ is a seuqence of elements of $cal(S)$, then $union.big_(k = 1)^oo E_k in cal(S)$.]

#example[The following are some $sigma$-algebras on a set $X$.
- ${emptyset, X}$
- $cal(P)(X)$
- The set of all subsets $E$ of $X$ such that $E$ is countable or $X \\ E$ is countable.]

#prop($sigma"-algebras are closed under countable intersection"$)[Suppose $cal(S)$ is a $sigma$-algebra on a set $X$. Then
+ $X in cal(S)$;
+ if $D, E in cal(S)$, then $D union E in cal(S)$ and $D sect E in cal(S)$ and $D \\ E in cal(S)$;
+ if $E_1, E_2, dots$ is a sequence of elements of $cal(S)$, then $sect.big_(k = 1)^oo E_k in cal(S)$.]

#definition("measurable space; measurable set")[- A _measurable space_ is an ordered pair $(X, cal(S))$, where $X$ is a set and $cal(S)$ is a $sigma$-algebra on $X$.
- An element of $cal(S)$ is called an _$cal(S)$-measurable set_, or just a _measurable set_ if $cal(S)$ is clear from the context.]

=== Borel Subsets of $RR$

#prop($"smallest" sigma"-algebra containing a collection of subsets"$)[Suppose $X$ is a set and $cal(A)$ is a set of subsets of $X$. Then the intersection of all $sigma$-algebras on $X$ that contain $cal(A)$ is a $sigma$-algebra on $X$.]

#example[ For a set $X$ with $cal(A) = {{x} bar x in X}$, the smallest $sigma$-algebra containing $cal(A)$ is the finite-cofinite $sigma$-algebra. ]

#definition("Borel set")[The smallest $sigma$-algebra on $RR$ containing all open subsets of $RR$ is called the collection of _Borel subsets_ of $RR$. An element of this $sigma$-algebra is called a _Borel set_.]

#example[- Every closed subset of $RR$ is a Borel set because every closed subset of $RR$ is the complement of an open subset of $RR$.
- Every countable subset of $RR$ is a Borel subset because if $B = {x_1, x_2, dots}$, then $B = union.big_(k = 1)^oo {x_k}$, which is a Borel set because each ${x_k}$ is a closed set.
- Every half-open interval $[a, b)$ (where $a, b in RR$) is a Borel set because $[a, b) = sect.big_(k = 1)^oo (a - 1/k, b)$.
- If $f: RR -> RR$ is a function, then the set of points at which $f$ is continuous is the intersection of a sequence of open sets and thus is a Borel set.]

#remark[ There is no finite procedure involving countable unions, countable intersection and complements for constructing the collection of Borel subsets.]

=== Inverse Images

#definition($"inverse image;" f^(-1)(A)$)[If $f: X -> Y$ is a function nd $A subset.eq Y$, then the set $f^(-1)(A)$ is defined by $ f^(-1)(A) = {x in X bar f(x) in A}. $]

#prop("algebra of inverse images")[Suppose $f: X -> Y$ is a function. Then
+ $f^(-1)(Y \\ A) = X  \\ f^(-1)(A)$ for every $A subset.eq Y$;
+ $f^(-1)(union.big_(A in cal(A)) A) = union.big_(A in cal(A)) f^(-1)(A)$ for every set $cal(A)$ of subsets of $Y$;
+ $f^(-1)(sect.big_(A in cal(A))A) = sect.big_(A in cal(A)) f^(-1)(A)$ for every set $cal(A)$ of subsets of $Y$.]

#prop("inverse image of a composition")[Suppose $f: X -> Y$ and $g: Y -> W$ are functions. Then 
$ (g compose f)^(-1)(A) = f^(-1)(g^(-1)(A)). $]
.
=== Measurable Functions

#definition("measurable function")[Suppose $(X, cal(S))$ is a measurable sapce. A function $f: X -> RR$ is called $cal(S)$-measurable if $ f^(-1)(B) in cal(S) $ for every Borel set $B subset.eq RR$]

#definition($"characteristic function;"chi_E$)[Suppose $E$ is a subset of a set $X$. The _characteristic function of E_ is the function $chi_E: X -> RR$ defined by $ chi_E(x) = cases(1 #h(10pt)&"if" x in E\,, 0 &"if" x in.not E.) $]

Note that, 

$ chi_E^(-1)(B) = cases(E &#h(20pt) "if" 0 in.not B "and" 1 in B\,, X \\ E &#h(20pt) "if" 0 in B "and" 1 in.not B\,, X &#h(20pt)"if" 0 in B "and" 1 in B\,, nothing &#h(20pt)"if" 0 in.not B "and" 1 in.not B.) $

Then,

#lemma[$chi_E$ is an $cal(S)$-measurable function if and only if $E$ in $cal(S)$.]

#prop("condition for measurable function")[Suppose $(X, cal(S))$ is a measurable space and $f: X -> RR$ is a function such that $ f^(-1)((a, infinity)) in cal(S) $ for all $a in RR$. Then $f$ is an $cal(S)$-measurable function.]<suff-cond-measurable>

In general, we can say the following things. 

#lemma($"image of a" sigma"-algebra"$)[Suppose $(X, cal(S))$ is a measurable space and $f: X -> Y$ a function. Then, the following defines a $sigma$-algebra on $Y$ $ cal(F) = {A subset.eq Y bar f^(-1)(A) in cal(S) } $]

So, the family from @suff-cond-measurable can be replaced by any family of sets such that the smallest $sigma$-algebra containing it also contains the Borel subsets of $RR$.

#definition("Borel measurable function")[Suppose $X subset.eq RR$. A function $f: X -> RR$ is called _Borel measurable_ if $f^(-1)(B)$ is a Borel set for every Borel set $B subset.eq RR$.]

#prop("every continuous function is Borel measurable")[Every continuous real-valued function defined on a Borel subset of $RR$ is a Borel measurable function.]

#definition("increasing functions; strictly increasing")[Suppose $X subset.eq RR$ and $f: X -> RR$ is afunction
- $f$ is called _increasing_ if $f(x) <= f(y)$ for all $x, y in X$ with $x < y$.
- $f$ is called _strictly increasing_ if $f(x) < f(y)$ for all $x, y in X$ with $x < y$.]

#prop("every increasing function is Borel measurable")[Every increasing function defined on a Borel subset of $RR$ is a Borel measurable function.]

#prop("composition of measurable functions")[Suppose $(X, cal(S))$ is a measurable space and $f: X -> RR$ is an $cal(S)$-measurable function. Suppose $g$ is a real-valued measurable function defined on a subset of $RR$ that includes the range of $f$. Then $g compose f: X -> RR$ is an $cal(S)$-measurable function.]

#prop("algebraic operations with measurable functions")[Suppose $(X, cal(C))$ is a measurable space and $f, g: X -> RR$ are $cal(S)$-measurable. Then 
+ $f + g, f - g$ and $f g$ are $cal(S)$-measurable functions;
+ if $g(x) != 0$ for all $x in X$, then $f/g$ is an $cal(S)$-measurable function.]

#prop($"limit of " cal(S)"-measurable functions"$)[Suppose $(X, cal(S))$ is a measurable space and $f_1, f_@, dots$ is a sequence of $cal(S)$-measurable functions from $X$ to $RR$. Suppose $lim_(k -> oo) f_k(x)$ exists for each $x in X$. Define $f: X -> RR$ by $ f(x) = lim_(k -> oo) f_k(x). $ Then $f$ is an $cal(S)$-measurable function.]

#definition($"Borel subsets of " [-oo, oo]$)[A subset of $[-oo, oo]$ is called a _Borel set_ if its intersection with $RR$ is a Borel set.]

#definition("measurable function")[Suppose $(X, cal(S))$ is a measurable space. A function $f: X -> [-oo, oo]$ is called _$cal(S)$-measurable_ if $ f^(-1)(B) in cal(S) $ for every Borel set $B subset.eq [-oo, oo]$.]

#prop("condition for measurable function")[Suppose $(X, cal(S))$ is a measurable sapce and $f: X -> [-oo, oo]$ is a function such that $ f^(-1)((a, oo]) in cal(S)) $ for all $a in RR$. Then $f$ is an $cal(S)$-measurable function.]

#prop($"infimum and supremum of a sequence of " cal(S)"-measurable functions"$)[Suppose $(X, cal(S))$ is a measurable space and $f_1, f_2, dots$ is a seuqence of $cal(S)$-measurable functions from $X$ to $[-oo, oo]$. Define $g, h: X -> [-oo, oo]$ by $ g(x) = inf{f_k(x) bar k in ZZ^+} #h(10pt) "and" #h(10pt) h(x) = sup{f_k(x) bar k in ZZ^+}. $ Then $g$ and $h$ are $cal(S)$-measurable functions.]

== Measures and Their Properties

#definition("measure")[Suppose $X$ is a set and $cal(S)$ is a $sigma$-algebra on $X$. A _measure_ on $(X, cal(S))$ is a function $mu: cal(S) -> [0, oo]$ such that $mu(emptyset) = 0$ and $ mu(union.big_(k = 1)^(oo)E_k) = sum_(k = 1)^oo mu(E_k) $ for every disjoint sequence $E_1, E_2, dots$ of sets in $cal(S)$.]

#example[
  - If $X$ is a set, then _counting measure_ is the measure $mu$ defined on the $sigma$-algebra of all subsets of $X$ by setting $mu(E) = n$ if $E$ is a finite set containing exactly $n$ elements and $mu(E) = oo$ if $E$ is not a finite set.
  - Suppose $X$ is a set, $cal(S)$ is a $sigma$-algebra on $X$, and $c in X$. Define the _Dirac_ measure $delta_c$ on $(X, cal(S))$ by $ delta_c (E) = cases(1 &#h(15pt) "if" c in E\,, 0 &#h(15pt) "if" c in.not E.) $
  - Suppose $X$ is a set, $cal(S)$ is a $sigma$-algebra on $X$, and $omega: X -> [0,oo]$ is a function. Define a measure $mu$ on $(X, cal(S))$ by $ mu(E) = sum_(x in E) w(x) $ for $E in cal(S)$. THe sum is defined as the supremum of all finite subsums $sum_(x in D) w(x)$ as $D$ ranges over all finite subsets of $E$.
  - Suppose $X$ is a set and $cal(S)$ is the $sigma$-algebra on $X$ consisting of all subsets of $X$ that are either countable or have a countable complement in $X$. Define a measure on $mu$ on $(X, cal(S))$ by $ mu(E) = cases(0 &#h(15pt) "if" E "is countable,", 3 &#h(15pt) "if" E "is uncountable.") $
  - Suppose $cal(S)$ is the $sigma$-algebra on $RR$ consisting of all subsets of $RR$. Then the function that takes a set $E subset.eq RR$ to $abs(E)$ (the outer measure of $E$) is not a measure because it is not finitely additive. 
  - Suppose $cal(B)$ is the $sigma$-algebra on $RR$ consisting of all Borel subsets of $RR$. The outer measure is a measure on $(RR, cal(B))$ (proven below).
]

#definition("measure space")[A _measure space_ is an ordered triple $(X, cal(S), mu)$, where $X$ is a set, $cal(S)$ is a $sigma$-algebra on $X$, and $mu$ is a measure on $(X, cal(S))$.]

=== Properties of Measures

#prop("measure preserves order; measure of a set difference")[Suppose $(X, cal(S), mu)$ is a measure space and $D, E in cal(S)$ are such that $D subset.eq E$. Then 
+ $mu(D) <= mu(E);$
+ $mu(E \\ D) = mu(E) - mu(D)$ provided that $mu(D) < oo$.]

#remark[The hypothesis $mu(D) < oo$ is required for part $(b)$ to avoid undefined expressions of the form $oo - oo$.]

#prop("countable subadditivity")[Suppose $(X, cal(S), mu)$ is a measure space and $E_1, E_2, dots in cal(S)$. Then $ mu(union.big_(k = 1)^oo E_k) <= sum_(k = 1)^oo mu(E_k). $]

#prop("measure of an increasing union")[Suppose $(X, cal(S), mu)$ is a measure space and $E_1 subset.eq E_2 subset.eq dots.c$ is an increasing sequence of sets in $cal(S)$. Then $ mu(union.big_(k = 1)^oo E_k) = lim_(k -> oo) mu(E_k) $]

#prop("measure of a decreasing intersection")[Suppose $(X, cal(S), mu)$ is a measure space and $E_1 supset.eq E_2 supset.eq dots.c$ is a decreasing sequence of sets in $cal(S)$, with $mu(E_1) < oo$. Then $ mu(sect.big_(k = 1)^oo E_k) = lim_(k -> oo) mu(E_k). $]

#remark[The hypothesis $mu(E_1) < oo$ is necessary.]

#prop("measure of a union")[Suppose $(X, cal(S), mu)$ is a measure space $D, E in cal(S)$, with $mu(D sect E) < oo$. Then $ mu(D union E) = mu(D) + mu(E) - mu(D sect E). $]

== Lebesgue Measure

=== Additivity of Outer Measure on Borel Sets

=== Lebesgue Measurable Sets

=== Cantor Set and Cantor Function

== Convergence of Measurable Functions


