#import "@local/preamble:0.1.0": *

#show: project.with(
  course: "CS",
  sem: "Spring",
  title: "Analysis of Boolean Functions",
  subtitle: "from CS6817 and O'Donnell.",
  authors: (
    "Shaleen Baral",
  ),
)

#let bool = ${-1, 1}$
#let Di = $"D"_i$
#let Li = $cal(L)_i$
#let Ll = $cal(L)$
// #let Li = $"L"_i$
#let Inf = $bold("Inf")$
#let Var = $bold("Var")$
#let Maj = $"Maj"$
#let Stab = $bold("Stab")$
#let NS = $bold("NS")$
#let xx = $bold(x)$
#let yy = $bold(y)$
#let sens = $"sens"$
#let Exp = $op(EE, limits: #true)$
#let Pr = $op(PP, limits: #true)$

= Boolean function and the Fourier expansion

#definition[A _boolean function_ is a map ${0, 1}^n -> {0, 1}$. We may view the domain ${0, 1}^n$ sometimes as $FF_2^n$ and sometimes as subsets of $RR^n$. Alternatively, we may use the space ${-1 , 1}^n$, known as the _Hamming cube_, as our domain. ]

#definition[The _Hamming distance_ between $x, y in {-1, 1}^n$ is defiend as $ Delta (xx, yy) = hash {i : x_i != y_i}. $]

== Basic Fourier Analysis

The _Fourier expansion_ of a Boolean function is essentially a representation of the function as a real, multilinear polynomial. Intuitively, the existence of such a representation can be justified by noting that any factor of $x_i^2$ can be replaced simply by $1$.

We can compute these just via taking a linear combination of indicator variables (that is, use an idea similar to the construction Lagrange polynomials!). For $f: {-1, 1}^n -> RR$, define the indicator basis ${bb(1)_(bold(a))}_(bold(a) in {-1, 1}^n)$ and take the appropriate linear combination.
$ bb(1)_(bold(a)) (bold(x)) = product_( a_i in bold(a) ) ((1 + a_i x_i)/2), \
f = sum_(bold(a) in {-1, 1}^n) f(bold(a)) dot bb(1)_bold(a). $

#definition[A subset $S subset.eq [n]$ corresponds to a monomial $ x^S = product_(i in S) x_i. $ Furthermore, $ hat(f)(S) = "coefficient on monomial" x^S "in the multilinear representation of of " f. $]

#prop[Every function $f: {-1, 1}^n -> RR$ can be uniquely expressed as a multilinear polynomial $ f(bold(x)) = sum_(S subset.eq [n]) hat(f)(S) x^S. $ This expression is called the _Fourier expansion of $f$_, and the real number $hat(f)(S)$ is called the _Fourier coefficient of $f$ on $S$_. Collectively, the coefficients are called the _Fourier spectrum of $f$_. ]

#definition[We define the encoding $chi: FF_2 -> RR$ as follows: for any $b in FF_2$,  $ chi(b) = (-1)^b. $ More explicitly, $ chi( 0_(FF_2) ) = +1, #h(20pt) chi(1_(FF_2)) = -1. $]

#definition[For $S subset.eq [n]$, we define $chi_S: FF_2^n -> RR$ by $ chi_S (bold(x)) = product_(i in S) chi(x_i) = (-1)^(sum_(i in S)x_i). $]

#lemma[We have $chi_S (bold(x) + bold(y)) = chi_S (bold(x)) dot chi_S (bold(y))$.]

The $chi_S$ compute the logical parity of the bits $(x_i)_(i in S)$. For consistency in notation, we may also define $chi_S: {-1, 1}^n -> {-1, 1}$ by $ chi_S (bold(x)) = product_(i in S) x_i. $

By $bold(x) ~ {-1, 1}^n$, we denote that $bold(x)$ is a uniformly chosen random string from ${-1, 1}^n$.

#definition[We define an inner product $inner(dot,dot)$ on pairs of functions $f, g: {-1, 1}^n -> RR$ by $ inner(f, g) = 2^(-n) sum_(bold(x) in {-1, 1}^n) f(bold(x)) g(bold(x)) = Exp_(bold(x) in {-1, 1}^n) [f(bold(x)) g(bold(x))]. $ We also have $norm(f)_2 = sqrt(inner(f, f))$ and more generally, $ norm(f)_p = Exp[|f(bold(x))|^p]^(1/p). $]

Unless otherwise specified, probabilities and expectation will always be over a uniformly random $bold(x) ~ {-1, 1}^n$.

#lemma[For any $bold(x) in {-1, 1}^n$, we have $chi_S (bold(x)) chi_T (bold(x)) = chi_(S Delta T) (bold(x))$]

#lemma[For any $bold(x) in {-1, 1}^n$, we have $ Exp[chi_S (bold(x))] = Exp[product_(i in S) x_i] = cases(1 &"if" S = emptyset\,, 0 &"if" S != emptyset.) $]

#prop[The $2^n$ parity functions $chi_S: {-1, 1}^n -> {-1, 1}$ form an orthonormal basis for the vector space $V$ of functions ${-1, 1}^n -> RR$ $ inner(chi_S, chi_T) = cases(1 &"if" S = T\,, 0 &"if" S != T.) $]

#prop[For $f: {-1, 1}^n -> RR$ and $S subset.eq [n]$, the Fourier coefficient of $f$ on $S$ is given by $ hat(f)(S) = inner(f, chi_S) = Exp [f(bold(x)), g(bold(x))]. $]

#prop("Parseval's Theorem")[For any $f: {-1, 1}^n -> RR$, $ inner(f, f) = Exp [f(bold(x))^2] = sum_(S subset.eq [n]) hat(f)(S)^2. $]

#prop("Plancharel's Theorem")[For any $f, g: {-1 , 1}^n -> RR$, $ inner(f, g) = Exp[f(bold(x))g(bold(x))] = sum_(S subset.eq [n]) hat(f)(S) hat(g)(S). $]

For Boolean-valued functions, $inner(f, g)$ can be interpreted as a similarity measure between $f$ and $g$.

#definition[Given $f, g: {-1, 1}^n -> {-1, 1}$, we define their _relative Hamming distance_ to be $ "dist"(f, g) = Pr[f(bold(x)) != g(bold(x))], $ the fraction of inputs on which they disagree.]

#prop[If $f, g: {-1, 1}^n -> {-1, 1}$, $ inner(f, g) = 1 - 2 "dist"(f, g). $]
#proof[$ inner(f, g) = Pr[f(bold(x)) = g(bold(x))] - Pr[f(bold(x)) != g(bold(x))] = 1 - 2 Pr[f(bold(x)) != g(bold(x))] = 1 - 2 "dist"(f, g).  $]

#definition[The _mean_ of $f: {-1, 1}^n -> RR$ is $Exp[f]$. If $Exp[f] = 0$ then we say that is is _unbiased_ or _balanced_. Particularly, $ Exp[f] = Pr[f(bold(x)) = 1] - Pr[f(bold(x)) != 1]. $]

#lemma[If $f:{-1, 1}^n -> RR$ then $f$ is balanced iff $hat(f)(nothing) = 0$.]
#proof[ $ Exp[f] = 0 <=> inner(f, 1) = 0 <=> hat(f)(nothing) = 0. $ ]

Now, we move on to discussing the variance for Boolean functions.

#prop[The variance of $f: {-1, 1}^n -> RR$ is $ bold("Var")[f] = sum_(S != nothing) hat(f)(S)^2. $]
#proof[$ bold("Var")[f] = inner(f - Exp[f], f - Exp[f]) = Exp[f^2] - Exp[f]^2 = sum_(S != nothing) hat(f)(S)^2. $]

#prop[The covariance of $f, g: {-1, 1}^n -> RR$ is $ bold("Cov")[f, g] = sum_(S != nothing) hat(f)(S) hat(g)(S). $]

For Boolean-valued functions, the variance has a stronger interpretation. It is roughly proportional to a function's distance from being constant. 

#lemma[For $f: {-1, 1}^n -> {-1, 1}$, we have $ bold("Var")[f] = 4 Pr[f(bold(x)) = 1] Pr[f(bold(x)) = -1] in [0, 1] $]
#proof[$ bold("Var")[f] = Exp[f^2] - Exp[f]^2 = 1 - Exp[f]^2 = 4 Pr[f(bold(x)) = 1] Pr[f(bold(x)) = -1] in [0, 1]. $]

#lemma[Let $f: {-1, 1}^n -> {-1, 1}$. Then $2 epsilon <= bold("Var")[f] <= 4 epsilon$ where $ epsilon = min {"dist"(f, 1), "dist"(f, -1)}. $]
#proof[
  We have, $ 2 epsilon <= bold("Var")[f] = 4 "dist"(f, 1) "dist"(f, -1) <= 4 epsilon. $
]

Finally, we discuss the Fourier-weight distribution.

#definition[The _(Fourier) weight_ of $f: {-1, 1}^n -> RR$ on a set $S$ is $hat(f)(S)^2$.]
#definition[Given $f: {-1, 1}^n -> {-1, 1}$ the _spectral sample_ of $f$, denoted $cal(S)_f$, is the probability distribution on subsets of $[n]$ in which the set $S$ has probability $hat(f)(S)^2$. We write $S ~ cal(S)_f$ for a draw from this distribution.]

#definition[For $f: {-1, 1}^n -> RR$ and $0 <= k <= n$, the _(Fourier) weight of $f$ at degree $k$_ is $ bold(W)^k [f] = sum_(S subset.eq [n] \ |S| = k) hat(f)(S)^2. $ If $f: {-1, 1}^n -> {-1, 1}$ is Boolean-valued, an equivalent definition is $ bold(W)^k [f] = Pr_(S ~ cal(S)_f) [ |S| = k ]. $ We further define, $ f^(<=k) = sum_(|S|<=k) hat(f)(S) chi_S, #h(10pt) f^(=k) = sum_(|S| = k) hat(f)(S) chi_S, #h(10pt) f^(>k) = sum_(|S| > k) hat(f)(S) chi_S. $ Then, $bold(W)^(=k) = norm(f^(=k))^2_2$, $bold(W)^(<=k) = norm(f^(<=k))_2^2$ and $bold(W)^(>k) = norm(f^(>k))_2^2$.]

== Probability Densities

We have, when possible, been presenting results in the setting of real-valued Boolean functions. An important class of such functions are probability densities.  

#definition[A _(probability) density_ function on the Hamming cube $FF_2^n$ is a nonnegative function $phi: FF_2^n -> RR^(>=0)$ such that $ Exp [phi(bold(x))] = 1. $ We write $bold(y) ~ phi$ to denote that $bold(y)$ is a random string drawn from the distribution defined by $ Pr_(bold(y) ~ phi) [bold(y) = bold(z)] = phi(bold(z)) 1/2^n. $]

#example[If $A subset.eq FF_2^n$ we write $bb(1)_A: FF_2^n -> {0, 1}$ for the $0$-$1$ _indicator function_ of $A$, $ bb(1)_A (bold(x)) = cases(1 &"if" x in A\,, 0 &"if" x in.not A.) $ The associated relative density function is obtained by normalizing this, $ phi_A = 1/(Exp[bb(1)_A]) dot bb(1)_A. $]

A classical reason for using the Fourier basis is that it interacts particularly nicely with _convolution_.

#definition[Let $f, g: FF_2^n -> RR$. Their _convolution_ is the function $f star g: F_2^n -> RR$ defined by $ (f star g)(bold(x)) = Exp_(bold(y) ~ FF_2^n) [f(bold(y))g(bold(x) - bold(y))] = Exp[f(bold(x) - bold(y)) g(bold(y))] $ Over $FF_2$, subtraction and addition are equivalent. So, $ (f star g)(bold(x)) = Exp_(bold(y) ~ FF_2^n) [f(bold(y))g(bold(x) + bold(y))] = Exp[f(bold(x) + bold(y)) g(bold(y))]. $ ]

#lemma[If $phi$ is a density function on $FF_2^n$ and $g: FF_2^n -> RR$ then $ (phi star g)(bold(x)) = Exp_(bold(y) ~ phi)[g(bold(x) - bold(y))] = Exp_(bold(y) ~ phi)[g(bold(x) + bold(y))]. $ In particular, $Exp_(bold(y) ~ phi)[g(bold(y))] = phi star g(0).$]

#prop[If $phi, psi$ are probability distributions then so is $phi star psi$. It represents the distribution on $bold(x) in FF_2^n$ given by choosing $bold(y) ~ phi$ and $bold(z) ~ psi$ independently and setting $bold(x) = bold(y) + bold(z)$.]

#prop[Let $f, g: FF_2^n -> RR$. Then for all $S subset.eq [n]$, $ hat(f star g)(S) = hat(f)(S) hat(g)(S). $]

= Basic concepts and social choice

In this section, we explore connections between social choice and Fourier analysis. We will see that not only is the latter useful for the former but the former is a treasure trove of intuition for the latter.

#definition[For $n$ odd, the _majority_ function $"Maj"_n: {-1, 1}^n -> {-1, 1}$ is defined by $ "Maj"_n (bold(x)) = "sgn"(x_1 + ... + x_n). $]

The Boolean AND and OR correspond to voting rules in which a certain candidate is always elected unless all voters are unanimously opposed.

#definition[The function $"AND"_n: {-1, 1}^n -> {-1, 1}$ is defined by $ "AND"_n (bold(x)) = cases(-1 &"if" bold(x) = (-1, -1, ..., -1) \,, +1 &"otherwise".) $ The function $"OR"_n {-1, 1}^n -> {-1, 1}$ is defined by $ "OR"_n (bold(x)) = cases(+1 &"if" bold(x) = (+1, +1, dots)\,, -1&"otherwise".) $]

Dictators play an important role in both social choice and Fourier analysis.

#definition[The _$i$-th dictator_ function $chi_i:{-1, 1}^n -> {-1, 1}$ is defined by $chi_i (bold(x)) = x_i$]

We further generalize the dictator to function that only depend on a constant number of coordinates.

#definition[A function $f: {-1, 1}^n -> {-1, 1}$ is called a _$k$-junta_ for $k in NN$ if it depends on at most $k$ of its input coordinates. That is, $ f(bold(x)) = g(x_(i_1), x_(i_2), dots, x_(i_k)) $ for some $g:{-1, 1}^k -> {-1, 1}$ and $i_1, ..., i_k in [n]$.]

The EU's Council of Ministers adopts decisions based on a weighted majority voting rule.

#definition[A function $f: {-1, 1}^n -> {-1, 1}$ is called a _weighted majority_ or _(linear) threshold function_ if it is expressible as $ f(x) = "sgn"(a_0 + a_1 x_1 + ... + a_n x_n) $ for some $a_0, a_1, ..., a_n in RR$.]

The President of the US is elected via a sort of "two-level majority." This motivates the following definition, 

#definition[The _depth-$d$ recursive majority of $n$_ function, denoted $"Maj"_n^(times.circle)$ is the boolean function on $n^d$ bits defined inductively as follows: $ "Maj"_n^(times.circle 1) = "Maj"_n \ "Maj"_n^(times.circle d + 1)(bold(x^(1)), ..., bold(x^(n))) = "Maj"_n ("Maj"_n^(times.circle d)(bold(x^(1))), ..., "Maj"_n^(times.circle d)(bold(x^(n)))), #h(10pt)"for" bold(x^(i)) in {-1, 1}^(n^d). $]

$"Tribes"_n$ is a voting rule that is quite important in the Fourier context but perhaps less so in real life. Here, the voters are divided into "tribes" of equal size and the outcome is true if and only if at least one tribe is unanimously in favor of true (a sort of CNF-SAT problem). 

#definition[The _tribes_ function of width $w$ and size $s$, $"Tribes"_(s, w): {-1, 1}^(s w) -> {-1, 1}$ is defined by $ "Tribes"_(s, w) (x^(1), ..., x^(s)) = "OR"_s ("AND"_(w) (bold(x^(1))), ..., "AND"_(w) (bold(x^(s)))), $ for $bold(x^(i)) in {-1, 1}^w$.]

In practice, it is desirable for voting rules to have particular properties that we believe a desirable voting system should intuitively exhibit. 

#definition[We say that a function $f:{-1, 1}^n -> {-1, 1}$ is 
+ _monotone_ if $f(x) <= f(y)$ whenever $x <= y$ coordiante-wise;
+ _odd_ if $f(-x) = -f(x)$;
+ _unanimous_ if $f(1, ..., 1) = 1$ and $f(-1, ..., -1) = -1$;
+ _symmetric_ if $f(x^pi) = f(x)$ for all permutations $pi in S_n$.]

$"Maj"_n$ satisfies all these properties. The dictators and recursive majority satisfy the first three properties. The $"AND"$ and $"OR"$ are monotone, unanimous and symmetric, but not odd. The tribes functions are monotone and unanimous; they satisfy a weaker transitive property. 

#definition[A function $f:{-1, 1}^n -> {-1, 1}$ is _transitive-symmetric_ if for all $i, i' in [n]$ there exists a permutation $pi in S_n$ taking $i$ to $i'$ such that $f(bold(x)^pi) = f(bold(x))$ for all $bold(x) in {-1, 1}^n$.]

== Influence and Derivatives

Given a voting rule $f: {-1, 1}^n -> {-1, 1}$ we are interested in investigating the _influence_ of hte $i$th voter. 

#definition[For $bold(x) in {-1, 1}^n$, we defined $bold(x)^(xor i) = (x_1, ..., x_(i - 1), -x_i, x_(i + 1), ..., x_n)$.]
#definition[We say that coordinate $i in [n]$ is _pivotal_ for $f:{-1,1}^n -> {-1, 1}$ on an input $bold(x)$ if $f(bold(x)) != f(bold(x)^(xor i))$.]
#definition[The _influence_ of coordinate $i$ on$f: {-1, 1}^n -> {-1, 1}$, is defined to be the probability that $i$ is pivotal for a random input $ Inf_i [f] = Pr[f(xx) != f(xx^(xor i))]. $]
#definition[We say that coordinant $i in [n]$ is _relevant_ for $f:bool^n -> RR$ if and only if $Inf_i [f] > 0$.]

We can also interpret this in terms of the geometry of the Hamming cube. We say that $(xx, yy)$ is a dimension-$i$ edge if $yy = xx^(xor i)$; it is a boundary edge if $f(xx) != f(yy)$. The influence $Inf_i [f]$ equals the fraction of dimension-$i$ edges which are boundary edges. 

A more analytic approach to influence is obtained by defining the discrete derivative. 

#definition[For $xx in bool^n$ and $b in bool$, we define $xx^(i->b) = (x_1, ..., x_(i - 1), b, x_(i + 1), ..., x_n)$.]
#definition[The _$i$th (discrete) derivative_ $Di$ maps the funciton $f:bool^n -> RR$ to the function $Di f:bool^n -> RR$ defined by $ Di f(xx) = (f(xx^(i -> 1)) - f(xx^(i -> -1)))/2 $]

#prop[If $f:bool^n -> bool$, $Di f(xx)^2$ is the $0$-$1$ indicator for whether $i$ is pivotal for $xx$. That is, $ Inf_i [f] = Exp[Di f(xx)^2] = norm(Di f)_2^2. $]
#proof[
  This follows from noting that 
  $ Di f(xx) = cases(0 &"if coordinate" i "is not pivotal for" xx\,, plus.minus 1 &"if coordinate" i "is pivotal for" xx.) $
]

The discrete derivative is analogous to partial derivatives. 

#prop[Let $f: bool^n -> RR$ have the multilinear expansion $f(xx) = sum_(S subset.eq [n]) hat(f)(S) x^S$. Then, $ Di f(xx) = sum_(S subset.eq [n]\ S in.rev i) hat(f)(S) x^(S \\ {i}). $]

This gives us a Fourier formula for influence. 

#prop[For $f:bool^n -> RR$ and $i in [n]$, $ Inf_i [f] = sum_(S in.rev i) hat(f)(S)^2. $]

For monotone functions, we have a simpler result. 

#prop[If $f: bool^n -> bool$ is monotone, then $Inf_i [f] = hat(f)(i)$.]
#proof[ By monotonicity, $Di f$ is $+1$ whenever $i$ is pivotal. Thus, $Di f$ itself is a $0$-$1$ indicator for $i$ being pivotal. Thus, $ Inf_i [f] = Exp [Di f(xx)] = hat(D_i f)(nothing) = hat(f)(i). $ ]

Here is an interesting consequence for $2$-candidate voting rules that are monotone and transitive-symmetric. 

#prop[Let $f: bool^n -> bool$ be transitive-symmetric and monotone. Then $Inf_i [f] <= 1/sqrt(n)$ for all $i in [n]$.]
#proof[Transitive-symmetry of $f$ implies that $hat(f)(i) = hat(f)(i')$ for all $i, i' in [n]$. By monotonicity, $Inf_i [f] = hat(f)(i) = hat(f)(1)$ for all $i in [n]$. By Parseval, $ 1 = sum_S hat(f)(S)^2 >= sum_(i = 1)^n hat(f)(i)^2 = n hat(f)(1)^2 \ ==> hat(f)(1) <= 1/sqrt(n). $]

The derivative operator doesn't generalize well to domains other than $bool^n$. Here are some ideas that do generalize better. 

#definition[The _$i$-th expectation operator_ $Exp_i$ is the linear operator on functions $f:bool^n -> RR$ defined by $ Exp_i [f(xx)] = Exp_(y)[f( x_1, ..., x_(i - 1), y, x_(i + 1), ..., x_n )]. $]

Whereas $Di f$ isolates the part of $f$ depending on the $i$-th coordinate, $Exp_i f$ isolates the part of $f$ not depending on the $i$-th coordinate.

#prop[For $f: bool^n -> RR$, 

+ $Exp_i f (xx) = (f(xx^(i -> 1)) + f(xx^(i -> -1)))/2,$

+ $Exp_i f(xx) = sum_(S in.rev.not i) hat(f)(S) x^S,$

+ $f(xx) = x_i Di f(xx) + Exp_i f(xx).$]

We also define a Laplacian operator. 

#definition[The _$i$-th coordinate Laplacian operator_ $Li$ is defined by $ Li f = f - Exp_i f. $]

The following properties are useful.

#prop[For $f: bool^n -> RR$, 

+ $Li f(xx) = (f(xx) - f(xx^(xor)))/2,$

+ $Li f(xx) = x_i Di f(xx) = sum_(S in.rev i) hat(f)(S) x^S,$

+ $inner(f, Li f) = inner(Li f, Li f) = Inf_i [f].$]

== Total Influence

#definition[The _total influence_ of $f: {-1, 1}^n -> RR$ is defined to be $ Inf [f] = sum_(i = 1)^n Inf_i [f]. $]

// For Boolean-valued functions, this has additional interpretations. 
The following proves a useful interpretation for total influence.

#definition[For $f: bool^n -> bool$, the _sensitivity_ of $f$ at $xx$, $sens_f (xx)$, is defined to be the number of pivotal coordinates for $f$ on input $xx$.]

#prop[For $f:bool^n -> bool$, $ Inf [f] = Exp_(xx) [sens_f (xx)]. $]

The total influence for Boolean-valued functions is related to the size of a function's edge boundary. 

#lemma[ The fraction of edges in the Hamming cube $bool^n$ which are boundary edges for $f: bool^n -> bool$ is equal to $1/n Inf [f]$.]

The sum of the degree-$1$ coefficients has a natural intepretation in social choice.
#prop[Let $f:bool^n -> bool$ be a voting rule for a $2$-candidate election. Given votes $xx = (xx_1, ..., xx_n)$, let $bold(w)$ be the number of votes that agree with the outcome of the election $f(xx)$. Then, $ Exp[bold(w)] = n/2 + 1/2 sum_(i = 1)^n hat(f)(i). $]

For montone functions, we have already seen the degree-$1$ coefficients under a different name.
#prop[If $f: bool^n -> bool$ is monotone, then $ Inf[f] = sum_(i = 1)^n hat(f)(i). $]

In fact, from the perspective of maximizing the number of votes that agree with the outcome, the majority rule is optimal (at least for odd $n$).
#prop[The unique maximizers of $sum_(i = 1)^n hat(f)(i)$ among all $f: bool^n -> bool$ are the majority functions. In particular, $ Inf[f] <= Inf[Maj_n] = sqrt((2n)/pi) + O(n^(-1/2)). $]

We now define the discrete gradient operator to give another expression for the total influence. 
#definition[The _(discrete) gradient operator_ $nabla$ maps the function $f: bool^n -> RR$ to the function $nabla f: bool^n -> RR^n$ defined by $ nabla f = (D_1 f(xx), ..., D_n f(xx)). $]

#prop[For $f: bool^n -> RR$, $ Inf[f] = Exp_xx [norm(nabla f(xx))_2^2]. $]

Finally, the Laplacian also provides a perspective on the total influence.

#definition[The _Laplacian operator_ $Ll$ is the linear operator on functions $f:bool^n -> RR$ defined by $ Ll = sum_(i = 1)^n Li. $]

#prop[For $f: bool^n -> RR$, 
+ $Ll f(xx) = n/2 (f(xx) - "avg"_(i in [n]){f(x^(plus.circle i))}),$
+ $Ll f(xx) = f(xx) "sens"_f(xx) "if" f:bool^n -> bool,$
+ $Ll f = sum_(S subset.eq [n]) |S| hat(f)(S) chi_S,$
+ $inner(f, L f) = Inf[f].$]

Finally, we can express the total influence directly in terms of the Fourier spectrum and the spectral sample (that is, in some sense, the total influence also measures the average degree of the Fourier weights).

#prop[For $f: bool^n -> RR$, $ Inf[f] = sum_(S subset.eq [n]) |S| dot hat(f)(S)^2 = sum_(k = 0)^n k dot bold(W)^k [f]. $ For $f: bool^n -> bool$, we can express this using the spectral sample, $ Inf[f] = Exp_(S ~ cal(S)_f) [ |S| ]. $]

== Noise Stability

Consider a situation where there is some chance that a vote is misrecorded. We formalize this in terms of noise stability. 

#definition[Let $rho in [-1, 1]$. We write $yy ~ N_rho (xx)$ to denote the random string $yy$ is drawn as follows $ y_i = cases(x_i &"with probability" 1/2 + 1/2 rho\,, -x_i &"with probability" 1/2 - 1/2 rho.) $ We say that $yy$ is $rho$-correlated to $xx$.]

#definition[If $xx ~ bool^n$ is drawn uniformly at random and then $yy ~ N_rho (xx)$, we say that $(xx, yy)$ is a _$rho$-correlated pair_ of random strings. That is, for each $i in [n]$, the pair of random bits $(x_i, y_i)$ satisfies $ Exp[x_i] = Exp[y_i] = 0 \ Exp[x_i y_i] = rho. $]

#definition[For $f: bool^n -> RR$ and $rho in [-1, 1]$, the _noise stability of $f$ at $rho$_ is $ Stab_rho [f] = Exp_((xx, yy) \ rho"-correlated") [f(xx) f(yy)]. $ If $f: bool^n -> bool$ we have $ Stab_rho [f] &= Pr_((xx, yy) \ rho"-correlated") [f(xx) = f(yy)] - Pr_((xx, yy) \ rho"-correlated")[f(xx) != f(yy)] \ &= 2 Pr_((xx, yy) \ rho"-correlated") [f(xx) = f(yy)] - 1. $]

When $rho$ is closed to $1$, it's sometimes more natural to ask about the probability that reversing a small fraction of the votes reverses the outcome of the election.

#definition[For $f: bool^n -> bool$ and $delta in [0, 1]$ we write $NS_delta [f]$ for _noise sensitivity of $f$ at $delta$_, defined to be the probability that $f(xx) != f(yy)$ when $xx ~ bool^n$ is uniformly random and $yy$ is formed from $xx$ by reversing each bit with probability $delta$. In other words, $ NS_delta [f] = 1/2 - 1/2 Stab_(1 - 2 delta) [f]. $]

= Spectral structure and learning

= DNF formulas and small-depth circuits

= Generalized domains

= Basics of hypercontractivity

= Pseudorandomness and $FF_2$-polynomials
