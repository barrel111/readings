#import "@local/preamble:0.1.0": *

#show: project.with(
  course: "",
  sem: "Summer",
  title: "Cauchy-Schwarz Masterclass",
  subtitle: "Notes",
  authors: ("Shaleen Baral",),
)

= Starting with Cauchy

== Proofs

#theorem(
  "Cauchy-Schwarz",
)[For $a_i, b_i in RR$ we have $ a_1b_1 + a_2b_2 + dots.c + a_n b_n <= sqrt(a_1^2 + a_2^2 + dots.c + a_n^2)sqrt(b_1^2 + b_2^2 + dots.c + b_n^2). $]

#proof(
  "of Cauchy-Schwarz (via Induction)",
)[

  Let $H(n)$ stand for the hypothesis that Cauchy's inequality is valid for $n$.

  The base case $H(1)$ is trivially true as the $a_1 b_1 = sqrt(a_1^2) sqrt(b_1^2)$.
  The second base case $H(2)$ follows from observing that,

  $ 0 <= (a_1 b_2 - b_1 a_2)^2 \ implies 2a_1 a_2 b_1 b_2 <= a_1^2 b_2^2 + b_1^2 a_2^2 \ implies a_1^2 b_1^2 + 2a_1 a_2 b_1 b_2 + a_2^2 b_2^2 <= a_1^2 b_2^2 + a_1^2 b_1^2 + a_2^2 b_2^2 + b_1^2 a_2^2 \ implies a_1 b_1 + a_2 b_2 <= sqrt(a_1^2 + a_2^2) sqrt(b_1^2 + b_2^2). $

  Now, assuming $H(n)$ holds for some $n >= 1$ we wish to show that $H(n + 1)$ also
  holds. Consider, using the inductive hypothesis,

  $ a_1 b_1 + a_2b_2 + dots.c + a_n b_n + a_(n + 1)b_(n + 1) <= sqrt(a_1^2 + a_2^2 + dots.c + a_n^2) sqrt(b_1^2 + b_2^2 + dots.c + b_n^2) + a_(n + 1) b_(n + 1). $

  Then, using $H(2)$,

  $ <= sqrt(a_1^2 + a_2^2 + dots.c + a_n^2 + a_(n + 1)^2) sqrt(b_1^2 + b_2^2 + dots.c + b_n^2 + b_(n + 1)^2). $

  Thus, $H(n + 1)$ also holds. By induction, Cauchy's inequality holds for all $n in NN$.

]

#lemma[ $ sum_(k = 1)^infinity a_k^2 < infinity " and " sum_(k = 1)^infinity b_k^2 < infinity " implies that " sum_(k = 1)^infinity |a_k b_k| < infinity. $ ]<additive-bound>
#proof(
  "(without Cauchy-Schwarz)",
)[ We want to show that $a_k b_k$ is small whenever $a_k^2$ and $b_k^2$ are small.
  The following observation gives us what we want,
  $ 0 <= (x - y)^2 implies x y <= 1/2 (x^2 + y^2 ). $

  We apply this to $x = |a_k|$ and $y = |b_k|$ and add the inequalities up,

  #numbered_eq(
    $sum_(k = 1)^infinity |a_k b_k| <= 1/2 sum_(k = 1)^infinity a_k^2 + 1/2 sum_(k = 1)^infinity b_k^2 < infinity.$,
  ) ]

#proof(
  "of Cauchy-Schwarz (via eqn. (1))",
)[
  Assume that neither ${a_k}$ not ${b_k}$ are made of zeroes. Then define the
  sequences, $ hat(a)_k = a_k / (sum_(k = 1)^infinity a_k^2)^(1/2) #h(25pt) hat(b)_k = b_k / (sum_(k = 1)^infinity b_k^2)^(1/2). $

  Now, apply eqn. (1) to ${hat(a)_k}$ and ${hat(b)_k}$.

  $ sum_(k = 1)^infinity hat(a)_k hat(b)_k <= 1/2 sum_(k = 1)^infinity hat(a)_k^2 + 1/2 sum_(k = 1)^infinity hat(b)_k^2 = 1 \
  implies sum_(k = 1)^infinity (a_k b_k)/((sum_(k = 1)^infinity a_k^2)^(1/2) (sum_(k = 1)^infinity b_k^2)^(1/2)) <= 1 \
  implies sum_(k = 1)^infinity a_k b_k <= (sum_(k = 1)^infinity a_k^2)^(1/2) (sum_(k = 1)^infinity b_k^2)^(1/2). $

  #remark[Normalization is a systematic way of getting from an _additive inequality_ to a _multiplicative inequality_.]

]

#theorem[Equality holds in the Cauchy-Schwarz inequality iff the sequences ${a_k}$ and ${b_k}$ are
  scalar multiple of one another.]

#proof[ We focus on the nontrivial case where neither of the sequences is identically
  zero and where both $sum_(k = 1)^infinity a_k^2, sum_(k = 1)^infinity b_k^2$ are
  finite.

  The backward direction is easy to prove by a routine computation. We focus on
  the forward direction. The equality #numbered_eq(
    $ sum_(k = 1)^infinity a_k b_k = (sum_(k = 1)^infinity a_k^2)^(1/2) (sum_(k = 1)^infinity b_k^2)^(1/2) $,
  ) implies the equality (with $hat(a)_k, hat(b)_k$ defined as above) #numbered_eq(
    $ sum_(k = 1)^infinity hat(a)_k hat(b)_k = 1/2 sum_(k = 1)^infinity hat(a)_k^2 + 1/2 sum_(k = 1)^infinity hat(b)_k^2 = 1. $,
  )

  By the two-term bound, $x y <= 1/2(x^2 + y^2)$ we also know that $ hat(a)_k hat(b)_k <= 1/2 hat(a)_k^2 + 1/2 hat(b)_k^2 " for all " k =1,2, dots, $

  If any of these inequalities were strict, then we wouldn't get the equality in
  eqn. (3). Thus, the equality in eqn. (2) holds for a nonzero series only when we
  have $hat(a)_k = hat(b)_k$ for all $k = 1, 2, dots$. By the definitiion of these
  normalized values, we have that $ a_k = lambda b_k " for all " k = 1, 2, dots, $
  with $lambda$ given by the raio
  $ lambda = (sum_(j = 1)^infinity a_j^2)^(1/2) slash.big (sum_(j = 1)^infinity b_j^2)^(1/2). $ ]

== Notation and Generalizations

The Cauchy-Schwarz inequality can be quite compactly represented in the context
of an _inner product space_. We introduce the requisite material here.

#definition[Suppose $V$ is a real vector space. Then a function on $V times V$ defined by
  the mapping $(bold(a), bold(b)) arrow.bar innerproduct(bold(a), bold(b))$ is an _inner product_ and
  we say that $(V, innerproduct(dot.c, dot.c))$ is a _real inner product space_ provided
  that the pair $(V, innerproduct(dot.c, dot.c))$ has the following properties
  + $innerproduct(bold(v), bold(w)) = innerproduct(bold(w), bold(v))$ for all $bold(v), bold(w) in V$
  + $innerproduct(bold(v), bold(v)) > 0$ for all nonzero $bold(v) in V$
  + $innerproduct(alpha bold(v) + bold(u), bold(w)) = alpha innerproduct(bold(v), bold(w)) + innerproduct(bold(u), bold(w))$ for
    all $alpha in RR$ and $bold(u), bold(v), bold(w) in V$
]

On $RR^n$, the following inner product is popular.

#definition(
  "Euclidean Inner Product",
)[For $bold(a), bold(b) in RR^n$, $ innerproduct(bold(a), bold(b)) = sum_(j = 1)^n a_j b_j $]

This lets us rewrite the Cauchy-Schwarz inequality succinctly.

#theorem[For $bold(a), bold(b) in RR^n$ we have $ innerproduct(bold(a), bold(b)) <= innerproduct(bold(a), bold(a))^(1/2) innerproduct(bold(b), bold(b))^(1/2). $]

Of course, there are other inner product spaces too!

#example[ On $RR^n$ the following weighted sum defines an inner product, $ innerproduct(bold(a), bold(b)) = sum_(j = 1)^n a_j b_j w_j. $ ]

#example[ Consider the vector space $C [a, b]$ of real-valued continuous functions on the
  bounded interval $[a, b]$. Then, for any continuous $w:[a, b] to RR$ such that $w(x) > 0$ for
  all $x in [a, b]$, we can define an inner product on $C[a, b]$ by setting $ innerproduct(f, g) = integral_a^b f(x)g(x)w(x) #h(2pt) d x. $ ]

This naturally leads us to ask whether Cauchy-Schwarz is true for all inner
product spaces.

#theorem[Let $(V, innerproduct(dot, dot))$ be an inner product space. Then, for any $bold(v), bold(w) in V$ we
  have $ innerproduct(bold(v), bold(w)) <= innerproduct(bold(v), bold(v))^(1/2) innerproduct(bold(w), bold(w))^(1/2). $ For
  nonzero $bold(v), bold(w) in V$ we have $ innerproduct(bold(v), bold(w)) = innerproduct(bold(v), bold(v))^(1/2) innerproduct(bold(w), bold(w))^(1/2) " if and only if " bold(v) = lambda bold(w) $ for
  a nonzero constant $lambda$.]
#proof[ We try to use a variant of the additive method developed above. Consider, $ 0 <= innerproduct(bold(v) - bold(w), bold(v) - bold(w)) \ implies innerproduct(bold(v), bold(w)) <= 1/2 (innerproduct(bold(v), bold(v)) + innerproduct(bold(w), bold(w))). $

  We normalize to convert this to a multiplicative bound. Since the inequality
  holds trivially for $bold(v) = bold(0)$ or $bold(w) = bold(0)$, we assume that $bold(v), bold(w)$ are
  nonzero. Define,

  $ hat(bold(v)) = bold(v)/innerproduct(bold(v), bold(v))^(1/2) #h(15pt) hat(bold(w)) = bold(w)/innerproduct(bold(w), bold(w))^(1/2) #h(5pt) . $

  We then have,

  $ innerproduct(hat(bold(v)), hat(bold(w))) <= 1/2 (innerproduct(hat(bold(v)), hat(bold(v))) + innerproduct(hat(bold(w)), hat(bold(w)))) = 1 \ implies innerproduct(
    bold(v)/(innerproduct(bold(v), bold(v))^(1/2)),
    bold(w)/(innerproduct(bold(w), bold(w))^(1/2)),

  ) <= 1 \ implies innerproduct(bold(v), bold(w)) <= innerproduct(bold(v), bold(v))^(1/2) innerproduct(bold(w), bold(w))^(1/2). $

  Now, we deal with the necessary condition for equality. If $bold(v), bold(w)$ are
  nonzero then the normalized vectors $hat(bold(v)), hat(bold(w))$ are well
  defined. Furthermore, equality in the Cauchy-Schwarz inequality then gives us $innerproduct(hat(bold(v)), hat(bold(w))) = 1.$ So,

  $ innerproduct(bold(hat(v)), bold(hat(w))) = 1/2 (innerproduct(bold(hat(v)), bold(hat(v))) + innerproduct(bold(hat(w)), bold(hat(w)))) \ implies innerproduct(bold(hat(v)) - bold(hat(w)), bold(hat(v)) - bold(hat(w))) = 0 \ implies bold(hat(v)) = bold(hat(w)) $

  Thus, $ bold(v) = lambda bold(w) " for " lambda = innerproduct(bold(v), bold(v))^(1/2)/innerproduct(bold(w), bold(w))^(1/2). $ ]

== Symmetry and Amplification

This material is from #link(
  "https://web.archive.org/web/20240516183201/https://terrytao.wordpress.com/2007/09/05/amplification-arbitrage-and-the-tensor-power-trick/",
)[Terence Tao's blog].

We consider the general setting of a complex inner product space, $V$.// That is to say, $V$ is a complex inner product space that is complete with respect to the norm induced by the inner product.
In this context, the Cauchy-Schwarz inequality is given by

$ abs(innerproduct(bold(v), bold(w))) <= innerproduct(bold(v), bold(v))^(1/2) innerproduct(bold(w), bold(w))^(1/2). $

To prove this, we start off with the additive bound,

$ 0 <= innerproduct(bold(v) - bold(w), bold(v) - bold(w)) \ implies Re innerproduct(bold(v), bold(w)) <= 1/2 (innerproduct(bold(v), bold(v)) + innerproduct(bold(w), bold(w))). $

This is a weaker bound than Cauchy-Schwarz as $Re innerproduct(bold(v), bold(w)) <= innerproduct(bold(v), bold(w)) <= innerproduct(bold(v), bold(v))^(1/2) innerproduct(bold(w), bold(w))^(1/2) <= 1/2 (innerproduct(bold(v), bold(v)) + innerproduct(bold(w), bold(w)))$.
The last inequality follows from the AM-GM inequality (see next chapter for more
details).

We can amplify this additive bound by observing some symmetry imbalances.
Particularly, the phase rotation $bold(v) arrow.bar e^(i theta) bold(v)$ preserves
the right-hand side but not the left-hand side,

$ Re #h(2pt) e^(i theta) innerproduct(bold(v), bold(w)) <= 1/2 (innerproduct(bold(v), bold(v)) + innerproduct(bold(w), bold(w))). $

We can choose any real $theta$ we want. To make the left-hand side as large as
possible, we choose $theta$ to cancel the phase of $innerproduct(bold(v), bold(w))$.
This gets us,

$ abs(innerproduct(bold(v), bold(w))) <= 1/2 (innerproduct(bold(v), bold(v)) + innerproduct(bold(w), bold(w))). $

Now, to strengthen the right-hand side we exploit a different symmetry, _homogenisation symmetry_.
Particularly, consider the map $(bold(v), bold(w)) arrow.bar (lambda bold(v), 1/lambda bold(w))$ for
a scalar $lambda > 0$. This gives us,

$ abs(innerproduct(bold(v), bold(w))) <= lambda^2/2 innerproduct(bold(v), bold(v)) + 1/(2 lambda^2) innerproduct(bold(w), bold(w)). $

The choice of $lambda = sqrt(norm(bold(w)) slash norm(bold(v)))$ minimizes the
right-hand side. This gives us,

$ abs(innerproduct(bold(v), bold(w))) <= innerproduct(bold(v), bold(v))^(1/2) innerproduct(bold(w), bold(w))^(1/2). $

== Yet Another Proof ™

This material is from #link(
  "https://web.archive.org/web/20240215164458/https://www.dpmms.cam.ac.uk/~wtg10/csineq.html",
)[Timothy Gower's blog]. In this section, we will see a more motivated
development of a common proof for the Cauchy-Schwarz inequality (it is pretty
much the same proof as the one above).

Recall what we mean by the Cauchy-Schwarz result: For $a_k, b_k in RR$, we have $ sum_(k = 1)^infinity a_k b_k <= (sum_(k = 1)^infinity a_k^2)^(1/2) (sum_(k = 1)^infinity b_k^2)^(1/2) $ with
equality iff the sequences ${a_i}$ and ${b_i}$ are proportional.

The central idea for our proof will be trying to find a natural way to express
the fact that two sequences are proportional. One approach would be to say that
there exists a $lambda in RR$ such that $a_k = lambda b_k$ for every $k$.
However, why bother introducing an unknown variable $lambda$ unless we
absolutely have to? We could simply require all $a_k slash b_k$ to be equal.
Though, we may be worried about some $b_k$ being zero. We can resolve this by
simply saying that two sequences are proportional if $a_k b_j = a_j b_k$ for all $j, k$.

We want lots of (in fact, for all $j, k$ we want $a_k b_j - a_j b_k = 0$) terms
to be zero. This can be expressed by requiring the sum of all their squares to
be zero. So, sequences ${a_k}$ and ${b_k}$ are proportional iff $ sum_(k, j) (a_k b_j - a_j b_k)^2 = 0. $

Also note that the expression on the left is trivially at least zero. By
expanding out the left-hand side, we readily obtain both the Cauchy-Schwarz
inequality and the necessary condition for equality,

$ sum_(k, j) (a_k b_j - a_j b_k)^2 &= sum_(k, j) (a_k^2 b_j^2 - 2 a_k a_j b_k b_j + a_j^2 b_k^2) \ &= 2 sum_(k, j) a_k^2 b_j^2 - 2 sum_( k, j ) a_k b_k a_j b_j \ &= 2 sum_(k) a_k^2 sum_j b_j^2 - 2 (sum_(k) a_k b_k)^2. $

Now, we try to extend this idea to real inner product spaces. We want to show
that $ innerproduct(bold(v), bold(w)) <= norm(bold(v)) norm(bold(w)) $ with
equality iff $bold(v)$ and $bold(w)$ are proportional with a positive constant.
Again, we motivate our proof by thinking in terms of expressing proportionality.
A first attempt is to say that $bold(v), bold(w)$ are proportional with a
positive constant iff $bold(v) slash norm(bold(v)) = bold(w) slash norm(bold(w))$ (note
how this doesn't work for proportionality in general, for example we could have $bold(v) = - bold(w)$).
As we did before, we can equivalently express this condition as requiring $norm(bold(w)) bold(v) - norm(bold(v)) bold(w) = 0$.
So that we may express this using inner products, we consider the squared
version of this: $(norm(bold(w)) bold(v) - norm(bold(v)) bold(w))^2 = 0$. Note
that the left-hand side is in fact always greater than or equal to zero. Then,
expanding the left hand side immediately gives us the Cauchy-Schwarz result,

$ (norm(bold(w)) bold(v) - norm(bold(v)) bold(w))^2 = 2norm(bold(v))^2norm(bold(w))^2 - 2 norm(bold(w)) norm(bold(v)) innerproduct(bold(v), bold(w)). $

For a complex inner product space, $(norm(bold(w)) bold(v) - norm(bold(v)) bold(w))^2$ expands
as

$ (norm(bold(w)) bold(v) - norm(bold(v)) bold(w))^2 = 2 norm(bold(v))^2 norm(bold(w))^2 - norm(bold(w)) norm(bold(v)) (innerproduct(bold(v), bold(w)) + innerproduct(bold(w), bold(v))) $

Let $x$ be a complex number with modulus $abs(x) = 1$ and the property that $innerproduct(bold(w), x bold(v))$ is
real and non-negative. Consequently, $innerproduct(bold(w), x bold(v)) = abs(innerproduct(bold(w), bold(v)))$.
We readily get that $abs(innerproduct(bold(w), bold(v))) = innerproduct(bold(w), x bold(v)) <= norm(bold(v)) norm(bold(w))$ with
equality iff $norm(bold(w)) bold(v) - norm(bold(v)) bold(w) = 0$.
