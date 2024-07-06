#import "@local/preamble:0.1.0": *
#import "@preview/lovelace:0.2.0": *

#show: setup-lovelace

#show: project.with(
  course: "CS",
  sem: "Summer",
  title: "Online Algorithms",
  subtitle: "",
  // authors: ("Shaleen Baral",),
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

#prop[`KN-Greedy` is a polynomial-time $2$-approximation algorithm for the simple
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
  competitive.]<min-uncompetitive>
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
#remark[Since this is a minimization problem, $q(OPT) > 0$ also implies $q(ALG) > 0$.]<max-uncompetitive>
#proof[ Same idea as the prior proof. ]

#prop[ Let $Pi$ be an online minimization problem, and let $cal(I) = {I_1, I_2, dots}$ be
  an infinite set of instances of $Pi$ such that $abs(I_i) <= abs(I_(i + 1))$, and
  such that the number of different input lengths in $cal(I)$ is infinite. Let $ALG$ be
  an online algorithm for $Pi$. If there is some constant $c >= 1$ such that
  + $ q(ALG(I_i))/q(OPT(I_i)) >= c, " for every" i in NN^+ $
  + $lim_(i to infinity) q(OPT(I_i)) = infinity$
  then $ALG$ isn't a $(c - epsilon)$-competitive online algorithm for $Pi$, for
  any $epsilon > 0$. ]<min-nobetter>
#proof[
  Suppose for contradiction that $ALG$ is a $(c - epsilon)$-competitive algorithm
  for some $epsilon > 0$. Then, there is a constant $alpha$ such that
  $ q(ALG(I_i)) <= (c - epsilon) dot.c q(OPT(I_i)) + alpha \
  implies q(ALG(I_i))/q(OPT(I_i)) - alpha/q(OPT(I_i)) <= c - epsilon $
  for every $i in NN^+$. By a), the first term above is at least $c$ and by b), we
  can find instances for which the second term is less than $epsilon$. Thus, we
  have a contradiction.
]

#prop[Let $Pi$ be an online maximization problem, and let $cal(I) = {I_1, I_2, dots}$ be
  an infinite set of instances of $Pi$ such that $abs(I_i) <= abs(I_(i + 1))$, and
  such that the number of different input lengths in $cal(I)$ is infinite. Let $ALG$ be
  an online algorithm for $Pi$. If there is some constant $c >= 1$ such that
  + $ q(OPT(I_i))/q(ALG(I_i)) >= c, " for every" i in NN^+ $
  + $lim_(i to infinity) q(OPT(I_i)) = infinity$
  then $ALG$ isn't a $(c - epsilon)$-competitive online algorithm for $Pi$, for
  any $epsilon > 0$.]<max-nobetter>
#proof[
  Suppose for contradiction that $ALG$ is a $(c - epsilon)$-competitive online
  algorithm for some $epsilon > 0$. Then, there is some constant $alpha$ such that
  $ q(OPT(I_i))/q(ALG(I_i)) - alpha/q(ALG(I_i)) <= c - epsilon $ for every $i in NN^+$.
  Furthermore, by a) and b), if $q(ALG(I_i))$ were bounded by a constant, it
  wouldn't be competitive at all. Thus, it is fair to assume that $lim_(i to infinity) q(ALG(I_i)) = infinity$.
  By a), the first term above is at least $c$ and from the previous sentence, we can find instances for which the
  second term is less than $epsilon$. Thus, we have a contradiction.
]

#remark[Propositions 1.2.1 and 1.2.2 need to be carefully interpreted. For example, they
  don't rule out the possibility for a $(c - 1/n)$-competitive algorithm.]

== Paging: Basics

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

One possible strategy is given by the following algorithm.

#algorithm(
  caption: [`FIFO`],
  $"The cache is organized as a queue. Whenever a page must be evicted, the one residing in the" \ "cache for the longest time is chosen. The first " k "pages may be removed arbirarily."$,
)

We analyze this algorithm by considering its behavior on different

#lemma[Any optimal solution `OPT` must make at least one page fault for every phase in a $k$-phase partition.]<opt-paging>
#proof[Let $I = (x_1, x_2, dots, x_N)$ be any instance of paging and consider $I$'s $k$-phase partition $P_1, P_2, dots, P_N$. WLOG, assume $x_1 in.not {p_1, p_2, dots, p_k}$. Shift the $k$-phase partition ${P_i}_( i in [N] )$ by a single page to form the partition ${P'_i}_(i in [N])$. Note that the last phase $P'_N$ may be empty but all others have the same length as before (i.e. $abs(P_i) = abs(P'_i)$).

For $i in [N - 1]$, all phases $P_i$ had maximum length (with respect to containing $k$-distinct pages) and thus, the corresponding phases $P'_i$ contain $k$ pages that differ from the page $p'$ that was last requested before the start of $P'_i$. Since $p'$ is in the cache of $OPT$ at the beginning of $P'_i$ and there are $k$ more distinct requests different from $p'$, $OPT$ has to cause one page fault during $P'_i$. This gives us $N - 1$ pages faults for $OPT$ plus an additional one on $x_1$ at the beginning before any of the phases ${P'_i}$.
]

#prop[`FIFO` is strictly $k$-competitive for paging.]<FIFO>
#proof[Let $I = (x_1, x_2, dots, x_N)$ be any instance of paging and consider $I$'s $k$-phase
  partition $P_1, P_2, dots, P_N$. WLOG, assume $x_1 in.not {p_1, p_2, dots, p_k}$.

  We start by showing that in any fixed phase $P_i$, $i in [N]$, `FIFO` does not cause more than $k$ page faults during $P_i$. By definition there are at most $k$ pages requested in this phase. Suppose $p$ is the first page in phase $P_i$ that causes a page fault for `FIFO`. Further suppose that $C_i$ is the set of all pages added to the cache in phase $P_i$. Then $p$ must be the first element of $C_i$ that is evicted from the cache. However, when $p$ is loaded into the cache there are $k - 1$ other pages in the cache that must be removed before $p$. So, $p$ must remain in the cache for the next $k - 1$ page faults. Every element of $C_i - p$ can cause at most one page fault in the next $k - 1$ page faults. Since there are at most $k - 1$ distinct pages requested in $P_i$, it must be the case that phase $P_i$ ends in the next $k - 1$ page faults too. Thus, no element causes more than one page fault in phase $P_i$. Consequently, there are at most $k$ page faults in total during any one phase.


  Thus, by @opt-paging,
  $ ALG <= k dot.c N <= k dot OPT. $
]

In fact, this is the best we can hope for.

#prop[No online algorithm for paging is better than $k$-competitive.]
#proof[ For convenience, take $n$ to be a multiple of $k$. Consider instances with $k + 1$ pages $p_1, p_2, dots, p_k, p_(k + 1)$. Recall that the cache is initialized $(p_1, p_2, dots, p_k)$. Since the cache size is $k$, there is exactly one page, at any given time step, that isn't in the cache of $ALG$. The idea is that the adversary always requests precisely this uncached page to obtain an instance of length $n$. Since the adversary knows $ALG$, it can always forsee which page will be replaces by $ALG$ if a page fault occurs (for example, it can just run $ALG$ to determine this).

More formally, the following algorithm can construct the instance for us.
#algorithm(
  caption: [Paging Adversary],
  pseudocode-list[
    + $I = (p_(k + 1))$
    + $i = 1$
    + *while* $i <= n - 1$ do
      + $p = "the page that is currently note in the cache of" ALG$
      + $I = I union p$
      + $ i = i + 1$
    + *end*
    + *return* $I$
]
)
By construction, this causes a page fault at every time step. Hence, $ALG$ has a total cost of $n$ on instance $I$.

Now, we study the optimal cost $OPT$ for this instance. We divide the input into distinct consecutive phases such that each phase consists of exactly $k$ time steps. Note that $ALG$ makes $k$ page faults in every phase. So, we want to show that $OPT$ makes at most one page fault in every phase.

For any phase $P_i$, consider the first time step $T_j$, $j in [(i - 1)k + 1, i k]$, wherein the first page fault occurs. Note that there $P_i$ consists of exactly $i k - j <= k - 1$ more time steps, so at msot $k - 1$ more distinct pages are requested. Since the cache stores $k$ pages, there must be at least one page $p'$ in the cache that isn't requested during this phase and $OPT$ chooses $p'$ to evict. If there are more than one candidate for $p'$, $OPT$ can break the tie by choosing the page whose first request is the latest among all such pages [TERRIBLE EXPOSITION: should just explicitly say that Longest Forward Distance is the local optima or not leak details of the $OPT$ strategy without meaning to!]. We have, on this instance,

$ ALG(I) = n = k dot n/k >= k dot OPT(I). $

Now if , as $n arrow infinity$, the number of page faults caused by $OPT$ is constant or bounded, $ALG$ isn't competitive at all (@min-uncompetitive). On the other hand, if the number of page faults by $OPT$ increases with $n$, then $ALG$ cannot be better than $k$-competitive (@max-nobetter).
]

A natural counterpart to `FIFO` is the following strategy.
#algorithm(
  caption: [`LIFO`],
  $"The cache is organized as a stack. Whenever a page must be evicted, the one that was most" \ "recently loaded into the cache is chosen. On the first page fault, an arbirary page may be " \ "removed."$,
)

This is a terrible strategy! Intuitively, this is because we end up using only one of the cells in the cache.

#prop[`LIFO` is not competitive for paging.]
#proof[
  We use @min-uncompetitive by showing that, for every $n$, there is an instance of paging of length $n$ such that $q(mono("LIFO"))/q(OPT)$ grows propotionally with $n$.

  Consider an instance of length $n$ on $m = k + 1$ total pages where the adversary always requests the same two pages. Since the cache is initialized with pages $p_1, dots, p_k$, the adversary starts off by requesting page $p_(k + 1)$. As a result, `LIFO` must evict a page $p_i$ from the cache. Since the adversary knows that `LIFO` chooses $p_i$, it requests it in time step $T_2$ and `LIFO` removes $p_(k + 1)$. The adversary keeps requesting these two pages, constructing the instance $I$,
  $ (p_(k + 1), p_i, p_(k + 1), p_i, dots) $
  We see that on this instance, `LIFO` causes a page fault at every time step. On the other hand, the optimal solution $OPT$ just removes a page $p_j$ with $j != i$ in time step $T_1$ and has overall cost $1$ because both $p_i$ and $p_(k + 1)$ will be in the cache from this time step onwards.
]

Intuitively, we may expect the frequency of access to be a good heuristic. This gives us the following strategy dubbed _Least Frequently Used_.

#algorithm(
  caption: [`LFU`],
  $"On a page fault, the page that was, so far, least frequently used is removed."$,
)

Unfortunately, this isn't much better in the worst case.

#prop[`LFU` is not competitive for paging.]
#proof[ Again, we want to employ @min-uncompetitive. The idea is very similar to the adversarial construction for `LIFO`. Consider the instance $I$ given by,
$ "("underbrace(p_1\, p_1\, dots\, p_1, n' "requests"), underbrace(p_2 \, p_2\, dots \, p_2, n' "requests"), dots ,underbrace(p_(k - 1)\, p_(k - 1)\, dots\, p_(k - 1), n' "requests"), underbrace(p_(k + 1)\, p_k\, dots\, p_(k + 1) \, p_k, 2(n' - 1) "requests")  ")" $
of length $n' (k - 1) + 2(n' - 1)$. By the initial contents of the cache, no page faults occur in the first $n'(k - 1)$ time steps for any online algorithm.

After that, all pages in the cache except for $p_k$ have been requested $k + 1$ times. Thus when $p_(k + 1)$ is requested, at time step $T_(n'(k - 1) + 1)$, `LFU` evicts page $p_k$. Next, the adversary requests page $p_k$ and `LFU` evicts $p_(k + 1)$  as it has been requested only once. This is iterated $n' - 1$ times until both $p_k$ and $p_(k + 1)$ have been requested $n' - 1$ times each. Note that `LFU` (by induction) makes a page fault in each of the last $2(n' - 1)$ time steps.

On the other hand, the optimal solution $OPT(I)$ simply removes a page $p_j$ with $j != k$ in time step $T_(n'(k - 1) + 1)$ and causes no more page faults. Since
$ n' = (n + 2)/(k + 1), $
the competitive ratio of `LFU` can be bounded from below by
$ 2(n' - 1) = 2 dot (n - k + 1)/(k + 1) $
which is a linear function of $n$.
]

#remark[Taking a closer look at the previous propositions, we see that the lower bound on the competitive ratio of `LIFO` is stronger than the one for `LFU` by a factor of $(k + 1)/2$.]

== Paging: Marking

With some basic results out of the way, we shift our focus to a general class of algorithms for pagins known as _marking algorithms_. These play an important role in the context of randomized algorithms for paging.

#definition("Marking Algorithm")[A _marking algorithm_ works in phases and _marks_ pages that were already requested; it only removes pages that are not marked. If all pages in the cache are marked and a page fault occurs, the current phase ends and a new one starts by first, unmarking all pages in the cache. Before processing the first request, all pages get marked such that the first request that causes a page fault starts a new phase. In pseudocode, the general form is as shown below.
#algorithm(
  caption: "Marking Algorithm",
  pseudocode-list[
    + *mark* all pages in the cache #comment[first page fault starts new phase]
    + *for* every request $x$ *do*
      + *if* $x in "cache"$
        + *if* $x$ is unmarked
          + *mark* $x$
        + *output* "0"
      + *else*
        + *if* there is no unmarked page
          + #line-label(<reset-mark>) *unmark* all pages in the cache #comment[start new phase]
        + #line-label(<marking-choice>) $p =$ page somehow chosen among all unmarked cached pages
        + #line-label(<remove-unmark>) *remove* $p$ and *insert* $x$ at the old position of $p$
        + #line-label(<pagefault-mark>)*mark* $x$
        + *output* "$p$"
    + *end*
  ]
)]

Marking algorithms are really nice!

#let PM = k => $P_(mono("MARK"), #k)$

#lemma[ There are at most $k$ page faults in one marking phase.]<k-faults-in-phase>
#proof[A page that has been marked in one phase never gets unmarked until the next phase starts (@reset-mark). Furthermore, throughout a phase, a marked page remains in the cache as only unmarked pages are ever removed (@remove-unmark). Since there are at most $k$ pages in the cache, there are at most $k$ pages that are marked in a single phase. In any one such phase $PM(i)$, note that every page fault leads to a page being marked (@pagefault-mark). So, there are at most $k$ page faults in one marking phase too. ]

#prop[Every marking algorithm is strictly $k$-competitive.]
#proof[Let `MARK` be a fixed marking algorithm. Let $I$ denote the given input and consider its $k$-phase partition into $N$ phases $P_1, dots, P_N$. By the same argument as @FIFO, we conclude that any optimal algorithm $OPT$ makes at least $N$ page faults in total on $I$.

Now, we show that `MARK` makes at most $k$ page faults in one fixed phase $P_i$ with $i in [N]$. We denote the $overline(N)$ phases defined by `MARK` by $PM(1), PM(2), dots, PM(overline(N))$. First, we claim that both $N = overline(N)$ and that $P_i = PM(i)$ for $i in [N]$. The result we want follows from verifying these two claims since `MARK` makes at most $k$ page faults in one phase $PM(i)$ (@k-faults-in-phase).

Start by observing that $P_1$ and $PM(1)$ start with the first request that causes a page fault. Every phase $P_i$ except the last one is, by definition, is a maximum-length sequence of $k$ distinct requests. Every requested page gets marked by `MARK` after being requested. When $k$ distinct pages have been requested then all pages in `MARK`'s cache are marked. With the $(k + 1)$-th distinct page $p'$ requested since the beginning of $P_(i)$, a new phase $P_(i + 1)$ starts. In this time step, a new phase $PM(i + 1)$ is also started as there is no unmarked page left in its cache to replace with $p'$. So, the phases $P_i$ and $PM(i)$ coincide. ]

There are quite a few algorithms that fit into the marking paradigm. Consider the _Least Recently Used_ strategy given below.

#algorithm(
  caption: `LRU`,
  $"On a page fault, the page that was last requested least recently is removed. The first " k \ "pages may be removed arbitrarily."$
)

#prop[`LRU` is a marking algorithm.]
#proof[ We want to show that `LRU` never removes a page that is currently marked by some marking algorithm. Suppose for contradiction that there exists an instance $I$ such that `LRU` removes a marked page. Let $p$ be the page for which this happens for the first time, and denote the corresponding timestep by $T_(j)$ with $j in [n]$ during some phase $P_i$ with $i in [N]$. Since $p$ is marked, it must have been requested before during $P_i$, say in time step $T_(j')$ with $j' < j$. After that $p$ was the most recently used. So, if `LRU` removes $p$ in time step $T_j$, there must have been $k$ distinct requests following time step $T_(j')$ -- the first $(k - 1)$ cause $p$ to become least recently used and on the $k$-th request $p$ is removed by `LRU`. However, this implies that $P_i$ consists of at least $k + 1$ different requests, which contradicts the definition of a $k$-phase partition.]

== Paging: Lookahead and Resource Augmentation

So far, we have been dealing with analyzing the worst case performance of our online algorithms. However, it might be realistic to assume some additional knowledge about the input.

A straightforward approach to give an online algorithm an advantage compared to the classical model is to alow it to have some _lookahead_ i.e. allow it to look into the future for $l$ time steps. However, in this context, it doesn't give us much improvement.

#prop[No online algorithm with lookahead $ell$ for paging is better than $k$-competitive.]
#proof[ Consider paging with lookahead $ell$. That is to say, in any time step, an online algorithm $ALG_ell$ sees the current request together with subsequent $ell$ requests. Since the adversary also knows $ALG_ell$, it surely knows $ell$ and may use the following construction.

The idea is to repeat each request $ell$ times such that $ALG_ell$ is still in the dark at the time step where it has to replace a page. Consider an instance with $m = k + 1$ pages. The first $ell + 1$ requests all ask for the only page that is not in the cache initially i.e. $p_(k + 1)$. In the first time step, $ALG_ell$ must replace a page, but it cannot see which page is requested in time step $T_(ell + 2)$. Thus, the additional knowledge is completely useless and the adversary can request $p_i$ which $ALG_ell$ replaces in time step $T_1$. When $ALG_ell$ must find a page to replace with $p_i$, it only knows the prefix $ (p_(k + 1), underbrace(p_(k + 1) \, dots \, p_(k + 1), ell "requests"), p_i, underbrace(p_i\, dots\, p_i, ell "requests") ")" $
of the input. Again, this doesn't help.

Repeating this construction, the adversary can ensure that $ALG_ell$ causes a page fault every $ell + 1$ time steps. By @opt-paging, $OPT$ makes at most one page fault every $k(ell + 1)$ time steps. So, for such inputs of length $n$, $ALG_ell$ causes $n slash (ell + 1)$ page faults while $OPT$ causes at most $n slash (k(ell + 1)). $

[IMPROVE THIS PROOF.]]

Another way to empower online algorithms against the adversary is called _resource augmentation_, wherein we allow the online algorithm to use more resources than the optimal offline algorithm.

= Randomized Algorithms
== Randomized Online Algorithms
== Yao's Principle
== Paging: Randomized Algorithms
== Ski-Rental Problem
