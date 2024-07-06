#import "@local/preamble:0.1.0": *

#show: project.with(
  course: "CS",
  sem: "Summer",
  title: "Discrete Probability",
  subtitle: "",
)

= Events and Probability
== Events

Random phenonmenon are observed by means of experiments. Each experiment results
in an _outcome_. The collection of all possible outcomes $omega$ is called the _sample space_ $Omega$.
Any subset $A subset.eq Omega$ of the sample space $Omega$ can be regarded as a
representation of some _event_.

#definition(
  "Indicator Function",
)[Let $cal(P)$ be a property that an element $x$ of some set $E$ may or may not
  satisfy. Then the indicator function for $cal(P)$, $bb(1)_(cal(P)): E arrow {0, 1}$ is
  defined by $ bb(1)_(cal(P))(x) = cases(1 #h(15pt) &"if" x "satisfies" cal(P)\,, 0 &"otherwise.") $]

#example[For any set $A subset.eq Omega$ we may define an indicator function $bb(1)_(A): Omega to {0, 1} $ using
  the set membership property: $ bb(1)_(A)(omega) = cases(1 #h(15pt) &"if" x in A\,, 0 &"otherwise.") $]

We say that an outcome $omega in Omega$ _realizes_ an event $A subset.eq Omega$ if $omega in A$.
Two event $A, B subset.eq Omega$ are said to be _incompatible_ if $A sect B = nothing$-- that
is, no outcome can realize both $A$ and $B$.

We refer to $nothing$ as the _impossible event_. Conversely, we refer to $Omega$ as
the _certain event_.

For a family of sets ${A_k}_(k in NN)$, we use the notation $sum_(k = 1)^infinity A_k$ to
denote $union_(k = 1)^infinity A_k$ if the family is pairwise disjoint.

#definition("Exhaustive")[A family of events is _exhaustive_ if any outcome $omega$ realizes at least one
  of them.]

#definition("Mutually Exclusive")[A family of events is _mutually exclusive_ if any two distinct events among them
  are incompatible.]

#definition(
  "Partition",
)[A family of sets ${A_k}$ partition $Omega$ if $ sum_(k = 1)^infinity A_k = Omega. $ In
  other words, we say that the events ${A_k}$ are _mutually exclusive_ and _exhaustive_.
  Furthermore, in terms of indicator functions, $ sum_(k = 1)^infinity bb(1)_(A_k) = 1. $]

If $B subset.eq A$, event $B$ is said to _imply_ event $A$, because $omega in Omega$ realizes $A$ whenever
it realizes $B$. In terms of indicator functions, $ bb(1)_(B)(omega) <= bb(1)_(A)(omega).$

== Probability

Probability theory assigns to each event a number, the _probability_ of said
event. We require the collection, $cal(F)$, of events to which a probability is
assigned to be a $sigma$-field.

#definition(
  $sigma"-field"$,
)[Let $cal(F)$ be a collection of subsets of $Omega$ such that
  + the certain event $Omega$ is in $cal(F)$,
  + if $A in cal(F)$, then $overline(A) in cal(F)$,
  + if ${A_k}_(k in NN)$ is a countable collection of sets in $cal(F)$ then $union_(k = 1)^infinity A_k in cal(F).$
  Then $cal(F)$ is a _$sigma$-field_ (or _$sigma$-algebra_) on $Sigma$. Here, we
  may also refer to it as the _$sigma$-field of events_.]

#remark[Particularly, $cal(F)$ may not be the collection of all subsets of $Omega$.]

The _trivial $sigma$-field_ is the collection of all subsets $2^Omega$ of $Omega$.
The _gross $sigma$-field_ is the $sigma$-field of two members ${nothing, Omega}$.

Usually, if $Omega$ is countable we take the $sigma$-field of events to be the
trivial $sigma$-field.

The _probability_ of an event measures the likeliness of its occurence.

#definition("Probability Measure")[A _probability_ on $(Omega, cal(F))$ is a mapping $P: cal(F) to RR$ such that
+ (_non-negativity_) $0 <= P(A) <= 1$,
+ (_unit measure_) )$P(Omega) = 1$,
+ (_sigma additivity_) $P(sum_(k = 1)^infinity A_k) = sum_(k = 1)^infinity P(A_k)$.]

The triple $(Omega, cal(F), P)$ is called a _probability space_ or _probability model_.

#remark[Notationally, we may replace intersection with commas i.e. $P(A, B) = P(A sect B)$.]

#remark[One may think of the axioms above as being motivatived by the heuristic interpretation of probability as _emperical frequency_.]

Some basic consequences of the axioms above are as follows.

#prop[For any event $A in cal(F)$ $ P(overline(A)) = 1 - P(A) $ and in particular, $P(nothing) = 0.$]
#proof[Using additivity, $ 1 = P(Omega) = P(A + overline(A)) = P(A) + P(overline(A)). $ By the fact that $P(Omega) = 1$, $P(nothing) = 0$ immediately follows. ]

#prop[Probability is _monotone_, that is to say $ A subset.eq B implies P(A) <= P(B). $]
#proof[Using subadditivity, $ P(B) = P(A union (B - A)) = P(A) + P(B - A) >= P(A). $]

#prop[Probability is sub-$sigma$-additive, that is to say $ P(union.big_(k = 1)^infinity A_k) <= sum_(k = 1)^infinity P(A_k). $]
#proof[Using subadditvity and monotonicity,
$ P(union.big_(k = 1)^infinity A_k) = P(union.big_(k = 1)^infinity (A_k - union.big_(ell = 1)^(k - 1) A_k)) = sum_(k = 1)^infinity P(A_k - union.big_(ell = 1)^(k - 1) A_k) <= sum_(k = 1)^infinity P(A_k). $]

#definition("Negligible")[A set $N subset Omega$ is called _$P$-negligible_ if it is contained in an event $A in cal(F)$ of probability $P(A) = 0$.]

#prop[A countable union of negligible sets is a negligible set.]
#proof[ Let $N_k$, $k >= 1$, be $P$-negligble sets. By definition, there exists a sequence $A_k$, $k >= 1$ of events of null probability such that $N_k subset.eq A_k$, $k >= 1$. We then have,  $ N := union_(k >= 1) N_k subset,eq A := union_(k >= 1) A_k. $ Note that $P(A) = 0$. So, by $sigma$-subadditivity and non-negativity of $P$, $P(N) = 0$.]

#definition("Almost Surely")[A property $cal(P)$ relative to the samples $omega in Sigma$ is said to hold _$P$-almost-surely_ ("$P$-a.s.") if $ P({omega; omega "verifies property" cal(P)}) = 1. $]

#remark[If there is no ambiguity, we may abbreviate $P$-almost-surely to just almost-surely.]

#definition("Non-Decreasing Sets")[A sequence of events ${A_n}_(n >= 1)$ is _non-decreasing_ if $A_n subset.eq A_(n + 1)$ for all $n >= 1$.]
#definition("Non-Increasing Sets")[A sequence of events ${A_n}_(n >= 1)$ is _non-decreasing_ if $A_(n + 1) subset.eq A_(n + 1)$ for all $n >= 1$.]
#prop[Let ${A_n}_(n >= 1)$ be a non-decreasing sequence of events. Then, $ P(union_(k = 1)^infinity A_n) = lim_(n arrow.t infinity) P(A_n). $ ]<non-dec-events>
#proof[ Note that $ A_n = A_1 + (A_2 - A_1) + dots + (A_n - A_(n - 1)) \ union.big_(k = 1)^infinity A_k = A_1 + (A_2 - A_1) + dots + (A_n - A_(n - 1)) $ Thus, $ P(union.big_(k = 1)^infinity A_k) &= P(A_1) + sum_(j = 2)^infinity P(A_j - A_(j - 1) ) \ &= lim_(n arrow.t infinity) { P(A_1) + sum_(j = 2)^n P(A_j - A_(j - 1))} = lim_(n arrow.t infinity) P(A_n). $]

#corollary[Let ${B_n}_(n >= 1)$ be a non-increasing sequence of events. Then, $ P(sect.big_(n = 1)^infinity B_n)  = lim_(n arrow.t infinity) P(B_n). $]
#proof[ Note that ${overline(B_n)}$ is a non-decreasing sequence of events. Thus, by @non-dec-events and De-Morgan's law we have,
$ P(sect.big_(n = 1)^infinity B_ n) = 1 - P(union.big_(n = 1)^infinity overline(B_n)) = 1 - lim_(n arrow.t infinity) P(overline(B_n)) = lim_(n arrow.t infinity) (1 - P(overline(B_n))) = lim_(n arrow.t infinity) P(B_n) $]

Next, we introduce the $liminf$ and $limsup$ for sets.

#definition("Liminf I")[The $liminf$ of a sequence ${A_n}_(n in NN)$ of sets is defined to be $ liminf_(n arrow.t infinity) A_n = union.big_(n = 1)^infinity sect.big_(j >= n) A_j. $]
#definition("Limsup I")[The $limsup$ of a sequence ${A_n}_(n in NN)$ of sets is defined to be $ limsup(n arrow.t infinity) A_n = sect.big_(n = 1)^infinity union.big_(j >= n) A_j. $]

The following lemma give useful interpretations for these.

#lemma[$x in liminf_(n arrow.t infinity) A_n$ iff $x in.not A_n$ for finitely many $n$.]
#proof[$x in liminf_(n arrow.t infinity) A_n$ iff $x in sect.big_(j >= n)^infinity A_j$ for some $n in NN$. By definition, the latter is true iff $x in A_j$ for every $j >= n$ i.e. $x in.not A_j$ implies $j <= n$. Thus, $x in.not A_n$ for finitely many $n$.]
#remark[For this reason, a shorthand for the limit infimum is "$x$ is in $A_n$ all but finitely often", also expressed as $A_n$ a.b.f.o.]

#lemma[$x in limsup_(n arrow.t infinity) A_n$ iff for every $n in NN$, there exists $m >= n$ such that $x in A_m$.]
#proof[$x in limsup_(n arrow.t infinity) A_n$ iff $x in union.big_(j >= n) A_j$ for every $n in N$. The latter is true iff $x in A_j$ for some $j >= n$, for every $n in NN$.]
#remark[For this reason, a shorthand for the limit supremum is "$x$ is in $A_n$ infinitely often", also expressed as $A_n$ i.o.]

We can also define $limsup$ and $liminf$ in terms of indicator functions.

#lemma("Liminf II")[The $liminf$ of a sequence ${A_n}_(n in NN)$ of sets is given by $ liminf_(n arrow.t infinity) A_n = {x in Omega bar liminf_(n arrow.t infinity) bb(1)_(A_n)(x) = 1} $]
#proof[Note that the indicator function only acquires values in ${1, 0}$. For any $x in Omega$, $liminf_(n arrow.t infinity) bb(1)_(A_n)(x) = 1$ iff $bb(1)_(A_n)(x) < 1$ for finitely many $n in NN$. Thus, $bb(1)_(A_n)(x) = 0$ for finitely many $n in NN$ and $x in.not A_n$ for finitely many $n in NN$ too.]

#lemma("Limsup II")[The $limsup$ of a sequence ${A_n}_(n in NN)$ of sets is given by $ limsup_(n arrow.t infinity) A_n = {x in Omega bar limsup_(n arrow.t infinity) bb(1)_(A_n)(x) = 1}. $]
#proof[Note that the indicator function only acquires values in ${0, 1}$. For any $x in Omega$, $limsup_(n arrow.t infinity) bb(1)_(A_n)(x) = 1$ iff for every $sup_(j >= n) bb(1)_(A_j)(x) = 1$ for every $n in NN$. The later is true iff there exists $j >= n$ for every $n in NN$ such that $bb(1)_(A_j)(x) = 1$.]

#prop("Borel-Cantelli Lemma")[For any sequence of events ${A_n}_(n >= 1),$ $ sum_(k = 1)^infinity P(A_n) < infinity implies P(A_n "i.o.") = 0 $]
#proof[ The set $union.big_(k >= n)^infinity A_k$ decreases with $n$. Thus, by sequential continuity of probability, $ P(A_n "i.o.") = P(sect.big_(n = 1)^infinity union.big_(k >= n) A_k) = lim_(n arrow.t infinity) P(union.big_(k >= n) A_k). $ Then, by $sigma$-subadditivity, $ P(union.big_(k >= n) A_k) <= sum_(k >= n)P(A_k). $ By the fact that $sum_(k = 1)^infinity P(A_n) < infinity$, the right hand-side of the inequality goes to $0$ as $n arrow.t infinity$.]

#text("Counting Models", weight: "bold", size: 12pt)

A common setting is one where the set $Omega$ of all possible outcomes is finite and (for some reason) we are led to believe that all the outcomes $omega$ have the same probability. As the probabilities must sum up to one, each outcome has probability $1/abs(Omega)$. Since the probability of an event $A$ is the sum of the probabilities of all outcomes $omega in A$, we have $ P(A) = abs(A)/abs(Omega). $

In this setting, computing $P(A)$ merely requires _counting_ the elements in the sets $A$ and $Omega$. Now, we review some useful tools that can help with counting.

#prop("Stirling's Formula I")[$ n! tilde sqrt(2 pi n) (n/e)^n. $]
#prop("Stirling's Formula II")[$ sqrt(2 pi n) (n/e)^n <= n! <= sqrt(2 pi n) (n/e)^n e^(1/(12n)). $]
#remark[ For a simpler, cruder bound, $e^(1/(12n)) <= 1.09 < 2$ for all $n in NN$.]

We can apply this to estimate the binomial coefficients.

#prop[$ binom(n, k) <= ((e n)/k)^k $]
#proof[ $ binom(n, k) &= (n(n - 1) dots.c (n - k + 1))/k! \ &<= (n^k)/k! <= n^k/(sqrt(2 pi k) (k/e)^k) <= 1/sqrt(2 pi k) dot ((e n)/k)^k <= ((e n)/k)^k. $ ]

== Independence and Conditioning

= Random Variables
== Probability Distribution and Expectation
== Generating Function
== Conditional Expectation

= Bounds and Inequalities
== The Three Basic Inequalities
== Frequently Used Bounds
