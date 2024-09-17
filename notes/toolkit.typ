#import "@local/preamble:0.1.0": *

#show: project.with(
  course: "",
  sem: "",
  title: "toolkit",
  subtitle: "we will see how it goes.",
  authors: ("shaleen baral",),
  authors_label: "authors:",
)

#set heading(numbering: "i.")

= asymptotics

== introduction

For simplicity, all our functions are of the type $NN to RR$.

#definition[We say that $f(n)$ is _asymptotically equivalent_ to $g(n)$ and write $f(n) tilde g(n)$ if $f(n) slash g(n) arrow 1$ as $n arrow infinity$.]

#definition[We write $f(n) in O(g(n))$ when there is a $C > 0$ such that for all
  sufficiently large $n$, $ abs(f(n)) <= C abs(g(n)). $]

#remark[Technically, $O(dot)$ represents a set of functions. Still, we may write expressions involving $O(dot)$ (for eg. $f = O(g)$) in which case $O(dot)$ represents some function from this asymptotic class. This remark holds for all the other asymptotic classes we will define. ]

#definition[We write $f(n) in Omega(g(n))$ when there is a $c > 0$ such that for all
  sufficiently large $n$, $ abs(f(n)) >= c abs(g(n)). $]

#lemma[ Equivalently, $f(n) = O(g(n))$ if and only if $limsup_(n to infinity) abs(f(n)) slash abs(g(n)) < infinity.$ ]

#proof[ For convenience, let $Q(n) = abs(f(n)) slash abs(g(n))$. First, the foward
  direction. We note that we have $0 <= Q(n) <= C$. As $Q(n)$ is bounded, $limsup Q(n)$ clearly
  exists and is finite (the sequence ${sup_(n >= k) Q(n)}_(k in N)$ is decreasing
  and as it is bounded by below, must converge).

  Conversely, assume $limsup Q(n) < infinity$. Let $C = lim sup Q(n) + 1$.
  As $C > limsup Q(n)$, it is an eventual upper bound for $Q(n)$. That is to say,
  there exists $N in NN$ such that for all $n >= N$ $ abs(f(n)) <= C abs(g(n)). $]

#lemma[ Equivalently, $f(n) = Omega(g(n))$ if and only if $liminf_(n to infinity) abs(f(n)) slash abs(g(n)) > 0. $ ]

#proof[ For convenience, let $Q(n) = abs(f(n)) slash abs(g(n))$. For the forward direction, we note that there exists $N in NN$ and $c > 0$ such that for all $n >= N$ $ abs(f(n)) >= c abs(g(n)) \ ==> Q(n) >= c. $ Note that $c$ is a lower bound for ${Q(n)}_(n in NN)$. Consequently, it must be a lower bound for the tailing sequences ${Q(n)}_(n >= m)$ for any $m$. Then, we have $ liminf_(n -> infinity) Q(n) = sup_(m in NN) inf_(n >= m) Q(n) >= c > 0. $ Conversely, assume $lim inf Q(n) > 0$. Choose any $c in (0, lim inf Q(n))$. Then, such a $c$ is an eventual lower bound for $Q(n)$. That is, there exists $N in NN$ such that for all $n >= N$, we have $ abs(f(n)) >= c abs(g(n)). $ ]

#definition[We write $f(n) = Theta(g(n))$ when there are constants $c, C > 0$ such that $ c abs(g(n)) <= f(n) <= C abs(g(n)). $ Equivalently, $f(n) = Theta(g(n))$ iff $f(n) = Omega(g(n))$ and $f(n) = O(g(n))$. ]

#lemma[If $f_1, f_2 in O(g)$ then $f_1 + f_2 in O(g)$.]

#proof[ There exists $C_1, C_2, N_1, N_2 > 0$ such that for $n >= N_1$ and $n >= N_2$ $ abs(f_1) &<= C_1 abs(g) #h(20pt) "and" #h(20pt) abs(f_2) &<= C_2 abs(g). $ Then,
  for $N = max(N_1, N_2)$, we can say that if $n >= N$ then $ |f_1 + f_2| <= (C_1 + C_2) |g|. $ ]

#lemma[ If $f_1, f_2 in Omega(g)$ then $f_1 + f_2 in Omega(g)$ too. ]

#proof[ Same idea as above. \ ]

#remark[A stronger statement is possible: if $f_1 in Omega(g)$ and $f >= f_1$ then $f in Omega(g)$.]

#lemma[ If $f_1, f_2 in Theta(g)$ then $f_1 + f_2 in Theta(g)$ too. ]
#proof[ Follows from prior two lemmas and definition of $Theta$. \ ]

#definition[We write $f(n) in (g(n))$ (or $f(n) << g(n)$) if $f(n) slash g(n) arrow 0$ as $n arrow infinity$.
]
#definition[We write $f(n) in omega(g(n))$ (or $f(n) >> g(n)$) if $f(n) slash g(n) arrow infinity$ as $n arrow infinity$.
]

#lemma[If $f_1, f_2 in o(g)$ then $f_1 + f_2 = o(g)$.]
#proof[$ lim_(n -> infinity) (f_1(n) + f_2(n))/g(n) = lim_(n -> infinity) (f_1(n))/g(n) + lim_(n -> infinity) (f_2(n))/g(n) = 0. $]
#lemma[If $f_1, f_2 in omega(g)$ then $f_1 + f_2 = omega(g)$.]
#proof[Same idea as above.]

#remark[A stronger statement is possible: if $f_1 in omega(g)$ and $f >= f_1$ then $f in omega(g)$.]

#remark[Note that $O(dot)$ and $Omega(dot)$ both induce a _pre order_ (a reflexive, transitive relation) on functions $NN -> RR$. Similarly, $o(dot)$ and $omega(dot)$ induce a _strict partial order_ (an irreflexive, transtive relation). Finally, $Theta(dot)$ induces an _equivalence relation_ (a reflexive, symmetric, transitive relation). Consequently, $O(dot)$ and $Omega(dot)$ induce a _non-strict partial order_ (an antisymmetric preorder) on these equivalence classes.]

 We think of $O(dot), Omega(dot), Theta(dot)$ as making claims about the _asymptotic bounds_ of functions. We think of $o(dot), omega(dot)$ as making claims about the _relative growth_ of functions. The following lemmas should illustrate this point.

#lemma[ If $f = o(g)$ then $f = O(g)$. In fact, any positive constant $C > 0$ can be used to satisfy the definition of $O(g)$.]
#proof[
  By definition, we have $lim_(n to infinity) (f(n))/(g(n)) = 0$. So for any $C > 0$, there exists $N in NN$ such that for all $n >= N$, we have $ abs(f(n)/g(n)) <= C \ => abs(f(n)) <= C abs(g(n)). $
]

#lemma[ If $f = omega(g)$ then $f = Omega(g)$. In fact, any positive constant $c > 0$ can be used to satisfy the definition of $Omega(g)$.]

#proof[
  By definition, we have $lim_(n to infinity) (f(n))/(g(n)) = infinity$. That is to say for every $c > 0$, there exists $N in NN$ such that for all $n >= NN$, $ abs(f(n)/g(n)) >= c \ implies abs(f(n)) >= c abs(g(n)). $
]


The following is a common way to denote asymptotic equivalence.

#lemma[$f tilde g$ if and only if $f(n) = g(n) (1 + o(1)) $.]
#proof[$ lim_(n to infinity) f(n)/g(n) = 1 <==> lim_(n to infinity) [f(n)/g(n) - 1] = 0 <==> f(n)/g(n) - 1 = o(1) $. ]



A convenient result is that we can _sandwich_ our function to obtain a result of asymptotic equivalence.

#lemma[Suppose there are functions $"LB" tilde g, "UB" tilde g$ such that $ "LB"(n) <= f(n) <= "UB"(n). $ Then, $f tilde g$. ]

#proof[
  $ lim_(n->infinity) ("LB"(n))/g(n) <= &lim_(n -> infinity) f(n)/g(n)<= lim_(n -> infinity) "UB"(n)/g(n) \ ==> 1 <= &lim_(n -> infinity) f(n)/g(n) <= 1 \ ==> &lim_(n -> infinity) f(n)/g(n) = 1. $
]

Usually, we end up decomposing a function into two terms---one which is asymptotically equivalent to our target and one that is negligble with respect to it.

#lemma[If $f = f_1 + f_2$ where $f_1 tilde g$ and $f_2 = o(g)$, then $f tilde g$]
#proof[
 $ lim_(n -> infinity) f(n)/g(n) = lim_(n -> infinity) (f_1(n))/g(n) + lim_(n -> infinity) (f_2(n))/g(n) = 1. $
]

== the hierarchy

Here is the dream.

#definition[A function is $g(n)$ is said to be in _standard form_ if it is the product of the following types
+ Constants #h(1fr) (eg. #h(3pt) $sqrt(2 pi), 6, e^(-2)$)
+ Constant powers of $n$ #h(1fr) (eg. #h(3pt) $n, sqrt(n), n^(5/2), n^(-3)$)
+ Constant powers of $ln n$ #h(1fr) (eg. #h(3pt) $ln n, sqrt(ln n), 1/(ln n)$)
+ Exponentials #h(1fr) (eg. #h(3pt) $2^n, e^(-n), 2^(n/2)$ )
+ $n^(c n)$ for constant $c$ #h(1fr) (eg. #h(3pt) $n^n$)]

#prop[For all $K > 0$ and $epsilon > 0$
$ ln^K n << n^epsilon, \ n^K << (1 + epsilon)^n, \ K^n << n^(epsilon n). $]
#proof[Start with $f(n) = n^K$ and $g(n) = (1 + epsilon)^n$. Note that, $ lim_(n -> infinity) (f(n + 1))/f(n) = lim_(n -> infinity) (1 + n^(-1))^K = 1^K = 1.  $
Take any $c$ such that $1 < c < 1 + epsilon$. There exist $n_0$ such that for all $n > n_0$, $(f(n + 1))/f(n) < c$. Then,
$ (f(n_0 + m))/(g(n_0 + m)) <= (c^m f(n_0))/((1 + epsilon)^m g(n_0)) -> 0 $ as $m -> infinity$.

Note that under the parametrization $n = e^m$, $ln^K n << n^epsilon$ becomes $m^K << (e^epsilon)^m$. Note that from the above result, $ m^K << (1 + epsilon)^K << (e^epsilon)^K $
using the fact that $1 + x <= e^x$.

Finally, for the last result, fix $c > K$ and $n_0$ with $n_0^epsilon >= c$. For $n >= n_0$, $n^(epsilon n) >= c^n >> K^n$. \ ]

Sometimes we see a $(1 + o(1))$ factor in the exponent. This gives very crude bounds. For example, $f(n) = g(n)^(1 + o(1))$ is equivalent to saying that
+ for any $epsilon > 0$, for $n$ sufficiently large, $f(n) > g(n)^(1 - epsilon)$.
+ for any $epsilon > 0$, for $n$ sufficiently large, $f(n) < g(n)^(1 + epsilon)$.

This is a much weaker claim then $f tilde g$. For example, if we have $g(n) = n^2$ then $f(n)$ could be any of $n^2, n^2 ln n, n^2 ln^5 n, n^2 ln^(-3) n$.

Working with asymptotics can simplify issues quite a bit. Consider the following theorem.

#prop[Let $a, c > 0$ and and $b in RR$. Define, for $x > 1$, $f(x) = c x^a ln^b x$. For $y$ sufficiently large, there is a unique $x$ with $y = f(x)$. Write $x = g(y)$ for such $y$. Asymptotically in $y$, $ x tilde d y^(1\/a)(ln y)^(-b\/a), $ where $d = a^(a\/b)c^(- 1\/a)$.]

#proof[
  Start by noting that, eventually the $x^a$ term dominates the polylogarithmic term to make $f$ increasing. More formally, note that

  $ f'(x) = a c x^(a - 1) ln^b x + b c x^(a - 1) ln^(b - 1) x \ = c x^(a - 1) ln^b x dot (a + b/(ln x)). $

 There exists $x_0 > 1$ such that for all $x > x_0$, we have $abs(b)/a < ln x$.  So, for all $x > x_0$, we have $f'(x) > 0$. Thus, $f'$ is eventually increasing.

 For large $x$,
 $ ln y = ln c + a ln x + b ln ln x tilde a ln x.  $

 where the asymptotic equivalence is justified by $ln c, ln ln x in o(ln x). $

Now, consider
 $ y &= c x^a ln^b x \ ==> x &=  c^(-1 slash a) y^(1 slash a)(ln x)^(-b slash a) \ &tilde a^(a slash b) c^(-1 slash a) y^(1 slash a) (ln y)^(-b slash a). $

]

#prop[ If $y = Theta(x^a ln^b x)$ then $x = Theta(y^(1 slash a) ln^(-b slash a) x)$.]

== stirling's approximation

The following is the main result also known as Stirling's formula.

#prop[ $ n! tilde n^n e^(-n) sqrt(2 pi n) . $ ]

The proof of this theorem is slightly technical and so, has been omitted in favor of weaker results with shorter proofs. I would still recommend studying a proof of this-- I like the exposition in Spencer and Florescu's _Asymptopia_ as well as Keith Conrad's notes.

We estimate the logarithm of $n!$ via the formula
  $ S_n = ln(n!) = sum_(k = 1)^n ln k. $

  We expect $S_n$ to be close to the integral of the function $ln x$ between $x = 1$ and $x = n$. Define $ I_n = integral_1^n ln x #h(3pt) d x = [x ln x - x]_1^n = n ln n - n + 1. $

  Let $T_n$ be the value for the approximation of the integral $I_n$ via the trapezoidal rule using step size $1$. That is, estimate $integral_i^(i + 1) f(x) d x$ by $1/2 (f(i) + f(i + 1))$. Summing up over $1 <= i <= n - 1$,
  $ T_n = 1/2 ln 1 + sum_(k = 2)^(n - 1) ln k + 1/2 ln n = S_n - 1/2 ln n. $

  We estimate the error in this approximation by definine $ E_n = I_n - T_n. $

  Furthermore, for $1 <= k <= n - 1$, let $S_k$ denote the _sliver_ of area under the curve $y = ln x$ for $k <= x <= k + 1$ but over the straight line between $(k, ln k)$ and $(k + 1, ln (k + 1))$. As the curve $ln x$ is concave, the curve is over the straight line and we have, $ E_n = sum_(k = 1)^(n - 1) mu(S_k) $ with $mu$ denoting the area.

#lemma[$ lim_(n -> infinity) E_n = c < infinity. $]
#proof[
  Let $P = (k, ln k)$ and let $Q = (k + 1, ln(k + 1))$. Furthermore, let $C$ denote the curve $f(x) = ln x$ in the interval $[k, k + 1]$. Furthermore, $f$ has derivative between $1/k$ and $1/(k + 1)$ on the interval $[k, k + 1]$. Let $U$ denote the straight line segment starting at $P$ with slope $1/k$ and ending at $x = k + 1$. Let $L$ be the straight line segment starting at $P$ with slope $1/(k + 1)$, ending at $x = k + 1$.

  As the derivative of $C$ is always between those of $U$ and $L$, the curve $C$ is under $U$ and over $L$. That is to say, at $x = k + 1$, $L$ then is below the curve $C$, below the point $Q$. Thus, the straight line $P Q$ lies above the line $L$ and we can bound $mu(S_k)$ by the area between $U$ and $L$. The latter is a triangle with height being $1$ and base being the line from $U$ to $L$ at $x = k + 1$ which has length $1/k - 1/(k + 1)$. Thus,

  $ mu(S_k) <= 1/2 (1/k - 1/(k + 1)). $

  This value is $O(k^(-2))$ and we achieve convergence. We even obtain the explicit upper bound,

  $ sum_(k = 1)^infinity mu(S_k) <= sum_(k = 1)^infinity 1/2 (1/k - 1/(k + 1)) = 1/2. $

]

#prop[ There is some positive constant $K$, such that $ n! tilde K n^n e^(-n) sqrt(n). $]
#proof[
  From the definitions above,
  $ ln (n!) &= T_n + 1/2 ln n \ &= I_n - E_n + 1/2 ln n $
  The lemma above gives us,

  $ &= n ln n - n + 1/2 ln n + 1- c + o(1) $

  Exponentiating this gives us,

  $ n! tilde n^n e^(-n) sqrt(n) e^(1 - c).  $

]

We can get a more precise approximation by putting more effort into estimating the error and using the fact that $K = sqrt(2 pi)$.

#prop[$ e^(1\/(12n + 1)) dot n^n e^(-n) sqrt(2 pi n) <= n! <= e^(1\/(12n)) dot n^n e^(-n) sqrt(2 pi n) $]

Proving this requires a bit of care, we will be proving something a bit simpler of a similar flavor. 

#lemma[ $ (n!)/(n^n e^(-n) sqrt(2 pi n)) = (1 + (1 + o(1))/(12n)). $ ]
#proof[
  From Stirling's formula, we know that $e^(1 - c) = sqrt(2 pi n)$. Define $F_n = c - E_n$. Then, 
  $ ln(n!) = n ln n - n + 1/2 ln n + 1 - c + 1/2 ln n + F_n \ implies (n!)/(n^n e^(-n) sqrt(2 pi n)) = e^(F_n) $

  Thus, $e^(F_n)$ gives us the _error term_ in the approximation given by Stirling's formula. Since $F_n -> 0$, $e^(F_n) = 1 + F_n ( 1 + o(1))$. While we don't know $F_n$ in closed form, we may find it asymptotitcally. 

  We start by considering $mu(S_k)$ explicitly. 

  $ mu(S_k) = integral_k^(k + 1) ln x - [ ln k + (ln(k + 1) - ln k) (x - k) ] #h(2pt) d x $

  Parametrizing by $y = k + x$ for convenience, this becomes

  $ = integral_0^1 ln (y + k) - [(1 - y) ln k + y ln (k + 1)] #h(2pt) d x. $ 

  From the Taylor series, considering the asymptotics as $k -> oo$, uniformly over $y in [0, 1]$.

  $ ln(k + y) = ln k - 1 $

]

== taylor's theorem

= binomial coefficients

== introduction

== bounds

= primes

== using asymptotics

== prime number theorem

== bertrand's postulate

= integrals

== approximating sums

== harmonic numbers

= just some beautiful results

Of course subjective, but for whatever reasons I think the results below are quite striking.

== greshgorin's circles

simplicity

== amitsur-levitzki

shocking

== prüfer encoding

elegant

== dft

neat 'things fit in'

== mastering floors and ceilings

master theorem, also sunk cost

== moore bound for irregular graphs

nice information theoretic proof

== hardin-taylor theorem

surprising, platonic, axiom of choice
