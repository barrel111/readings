#import "@local/preamble:0.1.0": *
#import "@preview/lovelace:0.2.0": *

#show: setup-lovelace

#show: project.with(
  course: "CS",
  sem: "Summer",
  title: "Online Algorithms",
  subtitle: "",
  authors: ("Shaleen Baral",),
)

#let OPT = `OPT`
#let ALG = `ALG`

= Introduction

== Approximation Algorithms

#definition(
  "Optimization Problem",
)[ An _optimization problem_ $Pi$ is a $5$-tuple $(cal(I), cal(O), s, q, g)$:
  + $cal(I)$: the set of _instances_.
  + $cal(O)$: the set of _solutions_.
  + $s: cal(I) arrow cal(P(cal(O)))$: for every instance $I in cal(I)$, $s(I) subset.eq cal(O)$ denotes
    the set of feasible solutions for $I$.
  + $q: cal(I) times cal(O) arrow bb(R)$: for every instance $I in cal(I)$ and every
    feasible solution $O in s(I)$, $q(I, O)$ denotes the measure of $I$ and $O$.
  + $g in {max, min}$.

  An _optimal solution_ for an instance $I in cal(I)$ of $Pi$ is a solution $OPT(I) in s(I)$ such
  that $ q(I, OPT(I)) = g{q(I, O) bar O in s(I)}. $
  If $g = min$, we call $Pi$ a _minimization problem_ and refer to $q$ as the _cost_.
  If $g = max$ we call $Pi$ a _maximization problem_ and refer to $q$ as the _gain_. ]

#definition(
  "Consistent",
)[An algorithm is _consistent_ for an (optimization) problem $Pi$ if it computes a
  feasible solution for every given instance.]

#definition(
  "Approximation Algorithms",
)[Let $Pi$ be an optimization problem, and let $ALG$ be a consistent algorithm for $Pi$.
  For $r >= 1$, $ALG$ is an _$r$-approximation algorithm_ for $Pi$ if, for every $I in cal(I)$ $ q(OPT(I)) <= r dot.c q(ALG(I)) $ if $Pi$ is
  a maximization problem, or $ q(ALG(I)) <= r dot.c q(ALG(I)) $ if $Pi$ is a
  minimization problem.

  The _approximation ratio_ of $ALG$ is defined as $ r_ALG = inf { r >= 1 bar ALG "is an" r"-approximation algorithm for" Pi}. $]

#remark[Sometimes we define $r$-approximation so that $r in (0, 1]$. ]

#definition(
  "Simple Knapsack Problem",
)[The _simple knapsack problem_ is a maximization problem specified as follows:

  An instance $I$ is given by a sequence of $n + 1$ numbers-- $w_1, w_2, dots, w_n, W$.
  A feasible set is any set $O subset.eq [n]$ such that $ sum_(i in O) w_i <= W. $ The
  gain of a solution $O$ and a corresponding instance $I$ is given by $ q(I, O) = sum_(i in O) w_i. $ The
  goal is to maximize this gain.]

#remark[Think of the numbers $w_i$ as being weights of items and $W$ as being the
  maximum weight capacity of the knapsack.]

#algorithm(caption: [`KN-GREEDY`], pseudocode-list[
  + $O = emptyset$
  + $s = 0$
  + *sort* such that $w_1>= w_2>= dots.c >= w_n$.
  + *while* $i < n$ and $s + w_(i + 1)<= W$ *do*
    + $O = O union w_(i + 1)$
    + $s = s + w_(i + 1)$
    + $i = i + 1$
  + *end*
  + *return* $O$
])

#theorem[`KN-Greedy` is a polynomial-time $2$-approximation algorithm for the simple
knapsack problem.]
#proof[
  Running time is $cal(O)(n)$, which is polynomial. The loop invariants ensure
  that the algorithm is consistent.

  Now, we show that this is a $2$-approximation algorithm. Consider the labeling
  of the weights after sorting i.e. assume $w_1 >= w_2>= dots.c >= w_n$. If the
  algorithm accepts all the items, then this is clearly the optimal solution too, $OPT = ALG$.

  Suppose that the algorithm rejects the $(r + 1)$-th item. If $sum_(i = 1)^r w_i >= W/2$ then
  we are done as $ ALG = sum_(i = 1)^r w_i >= W/2 >= OPT/2. $ Next, if $sum_(i = 1)^r w_i < W/2$ then
  note that $w_(r + 1) <= w_r < W/2$. Since the $(r + 1)$-th item is rejected,
  $ ALG = sum_(i = 1)^r w_i > W - w_(r+1) > W/2 >= OPT/2. $

  To see that this bound is tight with $r = 2$, we construct a family of instances
  whose approximation ratio approaches $2$. Consider the instance with $n = 3$,
  with weights $ W/2 + 1, W/2, W/2 $ and maximum weight capacity $W$. Then, the
  algorithm always accepts the item with weight $W/2 + 1$ and cannot accept any
  more whereas the optimum solution would accept the two items with weight $W/2$.
  The approximation ratio is then,

  $ OPT/ALG = W/(W/2 + 1) = 2 dot W/(W + 1) $

  As $W arrow infinity$, $OPT"/"ALG to 2$.

]

#definition(
  "FPTAS",
)[A _fully polynomial-time approximation scheme_ is an algorithm that takes as
  input an $epsilon> 0$ and an instance of a (optimization) problem and returns an
  output value that is at least $(1 - epsilon) OPT$ and at most $(1 + epsilon) OPT$.
  Importantly, the running time of the algorithm must be polynomial in both the
  size of the input and $1/epsilon$.]

== Online Algorithms

#definition(
  "Online Problem",
)[ An _online problem_ $Pi$ is a $5$-tuple $(cal(I), cal(O), s, q, g)$:
  + $cal(I)$: the set of _instances_. Every instance $I in cal(I)$ is a sequence of _requests_ $I = (x_1, x_2, dots, x_n)$ with $n in bb(N)$.
  + $cal(O)$: the set of _solutions_. Every output $O in cal(O)$ is a sequence of _answers_ $O = (y_1, y_2, dots, y_n)$ with $n in bb(N)$.
  + $s: cal(I) arrow cal(P(cal(O)))$: for every instance $I in cal(I)$, $s(I) subset.eq cal(O)$ denotes
    the set of _feasible solutions_ for $I$.
  + $q: cal(I) times cal(O) arrow bb(R)$: for every instance $I in cal(I)$ and every
    feasible solution $O in s(I)$, $q(I, O)$ denotes the measure of $I$ and $O$.
  + $g in {max, min}$.

  An _optimal solution_ for an instance $I in cal(I)$ of $Pi$ is a solution $OPT(I) in s(I)$ such
  that $ q(I, OPT(I)) = g{q(I, O) bar O in s(I)}. $
  If $g = min$, we call $Pi$ a _online minimization problem_ and refer to $q$ as
  the _cost_. If $g = max$ we call $Pi$ a _online maximization problem_ and refer
  to $q$ as the _gain_. ]

#definition(
  "Online Algorithm",
)[Let $Pi$ be an online problem and let $I = (x_1, x_2, dots, x_n)$ be an instance
  of $Pi$. An _online algorithm_ $ALG$ for $Pi$ computes the output $ALG(I) = (y_1, y_2, dots, y_n)$,
  where $y_i$ only depends on $x_1, x_2, dots, x_i$ and $y_1, y_2, dots, y_(i - 1)$;
  we also require $ALG(I) in s(I)$, that is, $ALG(I)$ is a fesible solution for $I$.]

#definition(
  "Competitive Ratio",
)[Let $Pi$ be an online problem, and let $ALG$ be a consistent online algorithm
  for $Pi$. For $c >= 1$, $ALG$ is _$c$-competitive_ for $Pi$ if there is a
  constant $alpha >= 0$ such that, for every instance $I in cal(I)$.
  $ q(OPT(I)) <= c dot.c q(ALG(I)) + alpha $ if $Pi$ is an online maximization
  problem, or $ q(ALG(I)) <= c dot.c q(OPT(I)) + alpha $ if $Pi$ is an online
  mimization problem. If these inequalities holds with $alpha=0$ we call $ALG$ _strictly $c$-competitive_. $ALG$ is _optimal_ if
  it is strictly $1$-competitive.

  The _competitive ratio_ is defined as $ c_ALG = inf {c >= 1 bar ALG "is" c"-competitive for" Pi}. $

  If the competitive ratio of $ALG$ is constant and the best that is achievable by
  any online algorithm for $Pi$, we call $ALG$ _strongly $c$-competitive_.]

#remark[Commonly, we refer to $OPT(I)$ as the _optimal offline solution_. It may not
  even be achievable online as it may require knowledge of the complete instance!]

#remark[If the competitive ratio of an online algorithm $ALG$ is at most $c$, where $c$ is
  a constant, we call $ALG$ _competitive_ or if $alpha=0$, _strictly competitive_.
  If the algorithm does not possess a competitive ratio with an upper bound that
  is idenpednent of the input length, we call it _not competitive_. It is fine to
  call an online algorithm competitive if its competitive ratio depends on some
  parameter of the problem being studied. This classification isn't always clear
  cut but is still often helpful.]

_Why do we have the additive constant $alpha$ when defining the competitive
ratio?_ The additive constant allows us to ignore finitely many exceptional
instances on which the online algorithm may perform poorly. Particularly, to
prove lower bounds, the constant $alpha$ forces us to construct infinitely many
instances with increasing costs or gains. The following lemmas and propositions
make this notion more explicit.

#lemma[Let $Pi$ be an online minimization problem and let $cal(I) = {I_1, I_2, dots}$ be
  an infinite set of instances of $Pi$ such that $abs(I_i) <= abs(I_(i + 1))$ and
  such that the number of different input lengths in $cal(I)$ is infinite. Suppose
  further that $q(OPT) > 0$ on $cal(I)$. If there is an increasing, unbounded
  function $c: NN^+ arrow RR^+$ such that, $ q(ALG(I_i))/q(OPT(I_i)) >= c(n) "where" n = |I_i|, $ then $ALG$ isn't
  competitive.]
#proof[
  Suppose for contradiction that $ALG$ is competitive, that is
  $ q(ALG(I_i)) <= c' dot.c q(OPT(I_i)) + alpha. $
  Then,
  $ [c(n) - c'] dot.c q(OPT(I_i)) <= alpha. $
  This clearly contradicts the fact that $alpha$ is a constant.
]

#lemma[Let $Pi$ be an online minimization problem and let $cal(I) = {I_1, I_2, dots}$ be
  an infinite set of instances of $Pi$ such that $abs(I_i) <= abs(I_(i + 1))$ and
  such that the number of different input lengths in $cal(I)$ is infinite. Suppose
  further that $q(ALG) > 0$ on $cal(I)$. If there is an increasing, unbounded
  function $c: NN^+ arrow RR^+$ such that, $ q(OPT(I_i))/q(ALG(I_i)) >= c(n) "where" n = |I_i|, $ then $ALG$ isn't
  competitive.]
#remark[Since this is a minimization problem, $q(OPT) > 0$ also implies $q(ALG) > 0$.]
#proof[ Same idea as the prior proof. ]

#theorem[ Let $Pi$ be an online minimization problem, and let $cal(I) = {I_1, I_2, dots}$ be
  an infinite set of instances of $Pi$ such that $abs(I_i) <= abs(I_(i + 1))$, and
  such that the number of different input lengths in $cal(I)$ is infinite. Let $ALG$ be
  an online algorithm for $Pi$. If there is some constant $c >= 1$ such that
  + $ q(ALG(I_i))/q(OPT(I_i)) >= c, " for every" i in NN^+ $
  + $lim_(i to infinity) q(OPT(I_i)) = infinity$
  then $ALG$ isn't a $(c - epsilon)$-competitive online algorithm for $Pi$, for
  any $epsilon > 0$. ]
#proof[
  Suppose for contradiction that $ALG$ is a $(c - epsilon)$-competitive algorithm
  for some $epsilon > 0$. Then, there is a constant $alpha$ such that
  $ q(ALG(I_i)) <= (c - epsilon) dot.c q(OPT(I_i)) + alpha \
  implies q(ALG(I_i))/q(OPT(I_i)) - alpha/q(OPT(I_i)) <= c - epsilon $
  for every $i in NN^+$. By a), the first term above is at least $c$ and by b), we
  can find instances for which the second term is less than $epsilon$. Thus, we
  have a contradiction.
]

#theorem[Let $Pi$ be an online maximization problem, and let $cal(I) = {I_1, I_2, dots}$ be
  an infinite set of instances of $Pi$ such that $abs(I_i) <= abs(I_(i + 1))$, and
  such that the number of different input lengths in $cal(I)$ is infinite. Let $ALG$ be
  an online algorithm for $Pi$. If there is some constant $c >= 1$ such that
  + $ q(OPT(I_i))/q(ALG(I_i)) >= c, " for every" i in NN^+ $
  + $lim_(i to infinity) q(OPT(I_i)) = infinity$
  then $ALG$ isn't a $(c - epsilon)$-competitive online algorithm for $Pi$, for
  any $epsilon > 0$.]
#proof[
  Suppose for contradiction that $ALG$ is a $(c - epsilon)$-competitive online
  algorithm for some $epsilon > 0$. Then, there is some constant $alpha$ such that
  $ q(OPT(I_i))/q(ALG(I_i)) - alpha/q(ALG(I_i)) <= c - epsilon $ for every $i in NN^+$.
  Furthermore, by a) and b), if $q(ALG(I_i))$ were bounded by a constant, it
  wouldn't be competitive at all. Thus, it is fair to assume that $lim_(i to infinity) q(ALG(I_i)) = infinity$.
  By a), first term above is at least $c$ and we can find instances for which the
  second term is less than $epsilon$. Thus, we have a contradiction.
]

#remark[Propositions 1.2.1 and 1.2.2 need to be carefully interpreted. For example, they
  don't rule out the possibility for a $(c - 1/n)$-competitive algorithm.]

== Paging

#definition(
  "Paging",
)[The _paging problem_ is an online minimization problem.

  Suppose there are $m in NN^+$ memory pages $p_1, p_2, dots, p_m$, which are
  stored in the main memory. An instance is a sequence $I = (x_1, x_2, dots, x_n)$ such
  that $x_i in {p_1, p_2, dots, p_m}$, for all $i in [n]$. This means that page $x_i$ is
  requested in time step $T_i$.

  An online algorithm $ALG$ for paging maintains a _cache_ memory of size $k$ with $k < m$,
  represented by the tuple $B_i = (p_(j_1), p_j_2, dots, p_j_k)$ for time step $T_i$.
  Initially, the cache is initialized as $B_0 = (p_1, p_2, dots, p_k)$, that is,
  with the first $k$ pages. If in some time step $T_i$, a page $x_i$ is requested
  and $x_i in B_(i - 1)$, $ALG$ outputs $y_i = 0$. Conversely, if $x_i in.not B_(i - 1)$, $ALG$ has
  to choose a page $p_j in B_(i - 1)$, which is then removed from the cache to
  make room for $x_i$. In this case, $ALG$ outputs $y_i = p_j$ and the new cache
  content is $B_i = (B_(i - 1) backslash p_j) union x_i$.

  The cost is defined as $ q(ALG(I)) = abs({i in [n] bar y_i != 0 }) $
  and the goal is to minimize it.]

#definition(
  $k"-Phase Partition"$,
)[ Let $I = (x_1, x_2, dots, x_n)$ be an arbitrary instance of paging. A _$k$-phase partition of $I$_ assigns
  the requests from $I$ to consecutive disjoint phases $P_1, P_2, dots, P_N$ such
  that
  + Phase $P_1$ starts with the first request for a page that is not initially in
    the cache. Then, $P_1$ contains a maximum-length subsequence of $I$ that
    contains at most $k$ distinct pages.
  + For any $i$ with $2 <= i <= N$, phase $P_i$ is a maximum-length subsequence of $I$ that
    starts right after $P_(i - 1)$ and again contains at most $k$ distinct pages. ]

#algorithm(
  caption: [`FIFO`],
  $"The cache is organized as a queue. Whenever a page must be evicted, the one residing in the" \ "cache for the longest time is chosen. The first " k "pages may be removed arbirarily."$,
)

#prop[`FIFO` is strictly $k$-competitive for paging.]
#proof[Let $I = (x_1, x_2, dots, x_N)$ be any instance of paging and consider $I$'s $k$-phase
  partition $P_1, P_2, dots, P_N$. WLOG, assume $x_1 in.not {p_1, p_2, dots, p_k}$.
]
