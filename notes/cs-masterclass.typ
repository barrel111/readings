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

#prop(
  "Cauchy-Schwarz",
)[For $a_i, b_i in RR$ we have $ a_1b_1 + a_2b_2 + dots.c + a_n b_n <= sqrt(a_1^2 + a_2^2 + dots.c + a_n^2)sqrt(b_1^2 + b_2^2 + dots.c + b_n^2). $]

#proof(
  [of Cauchy-Schwarz (via Induction)],
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
  "of Cauchy-Schwarz (via (1))",
)[
  Assume that neither ${a_k}$ not ${b_k}$ are made of zeroes. Then define the
  sequences, $ hat(a)_k = a_k / (sum_(k = 1)^infinity a_k^2)^(1/2) #h(25pt) hat(b)_k = b_k / (sum_(k = 1)^infinity b_k^2)^(1/2). $

  Now, apply eqn. (1) to ${hat(a)_k}$ and ${hat(b)_k}$.

  $ sum_(k = 1)^infinity hat(a)_k hat(b)_k <= 1/2 sum_(k = 1)^infinity hat(a)_k^2 + 1/2 sum_(k = 1)^infinity hat(b)_k^2 = 1 \
  implies sum_(k = 1)^infinity (a_k b_k)/((sum_(k = 1)^infinity a_k^2)^(1/2) (sum_(k = 1)^infinity b_k^2)^(1/2)) <= 1 \
  implies sum_(k = 1)^infinity a_k b_k <= (sum_(k = 1)^infinity a_k^2)^(1/2) (sum_(k = 1)^infinity b_k^2)^(1/2). $

  #remark[Normalization is a systematic way of getting from an _additive inequality_ to a _multiplicative inequality_.]

]

#prop[Equality holds in the Cauchy-Schwarz inequality iff the sequences ${a_k}$ and ${b_k}$ are
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
  the mapping $(bold(a), bold(b)) arrow.bar inner(bold(a), bold(b))$ is an _inner product_ and
  we say that $(V, inner(dot.c, dot.c))$ is a _real inner product space_ provided
  that the pair $(V, inner(dot.c, dot.c))$ has the following properties
  + $inner(bold(v), bold(w)) = inner(bold(w), bold(v))$ for all $bold(v), bold(w) in V$
  + $inner(bold(v), bold(v)) > 0$ for all nonzero $bold(v) in V$
  + $inner(alpha bold(v) + bold(u), bold(w)) = alpha inner(bold(v), bold(w)) + inner(bold(u), bold(w))$ for
    all $alpha in RR$ and $bold(u), bold(v), bold(w) in V$
]

On $RR^n$, the following inner product is popular.

#definition(
  "Euclidean Inner Product",
)[For $bold(a), bold(b) in RR^n$, $ inner(bold(a), bold(b)) = sum_(j = 1)^n a_j b_j $]

This lets us rewrite the Cauchy-Schwarz inequality succinctly.

#prop[For $bold(a), bold(b) in RR^n$ we have $ inner(bold(a), bold(b)) <= inner(bold(a), bold(a))^(1/2) inner(bold(b), bold(b))^(1/2). $]

Of course, there are other inner product spaces too!

#example[ On $RR^n$ the following weighted sum defines an inner product, $ inner(bold(a), bold(b)) = sum_(j = 1)^n a_j b_j w_j. $ ]

#example[ Consider the vector space $C [a, b]$ of real-valued continuous functions on the
  bounded interval $[a, b]$. Then, for any continuous $w:[a, b] to RR$ such that $w(x) > 0$ for
  all $x in [a, b]$, we can define an inner product on $C[a, b]$ by setting $ inner(f, g) = integral_a^b f(x)g(x)w(x) #h(2pt) d x. $ ]

This naturally leads us to ask whether Cauchy-Schwarz is true for all inner
product spaces.

#prop[Let $(V, inner(dot, dot))$ be an inner product space. Then, for any $bold(v), bold(w) in V$ we
  have $ inner(bold(v), bold(w)) <= inner(bold(v), bold(v))^(1/2) inner(bold(w), bold(w))^(1/2). $ For
  nonzero $bold(v), bold(w) in V$ we have $ inner(bold(v), bold(w)) = inner(bold(v), bold(v))^(1/2) inner(bold(w), bold(w))^(1/2) " if and only if " bold(v) = lambda bold(w) $ for
  a nonzero constant $lambda$.]
#proof[ We try to use a variant of the additive method developed above. Consider, $ 0 <= inner(bold(v) - bold(w), bold(v) - bold(w)) \ implies inner(bold(v), bold(w)) <= 1/2 (inner(bold(v), bold(v)) + inner(bold(w), bold(w))). $

  We normalize to convert this to a multiplicative bound. Since the inequality
  holds trivially for $bold(v) = bold(0)$ or $bold(w) = bold(0)$, we assume that $bold(v), bold(w)$ are
  nonzero. Define,

  $ hat(bold(v)) = bold(v)/inner(bold(v), bold(v))^(1/2) #h(15pt) hat(bold(w)) = bold(w)/inner(bold(w), bold(w))^(1/2) #h(5pt) . $

  We then have,

  $ inner(hat(bold(v)), hat(bold(w))) <= 1/2 (inner(hat(bold(v)), hat(bold(v))) + inner(hat(bold(w)), hat(bold(w)))) = 1 \ implies inner(
    bold(v)/(inner(bold(v), bold(v))^(1/2)),
    bold(w)/(inner(bold(w), bold(w))^(1/2)),

  ) <= 1 \ implies inner(bold(v), bold(w)) <= inner(bold(v), bold(v))^(1/2) inner(bold(w), bold(w))^(1/2). $

  Now, we deal with the necessary condition for equality. If $bold(v), bold(w)$ are
  nonzero then the normalized vectors $hat(bold(v)), hat(bold(w))$ are well
  defined. Furthermore, equality in the Cauchy-Schwarz inequality then gives us $inner(hat(bold(v)), hat(bold(w))) = 1.$ So,

  $ inner(bold(hat(v)), bold(hat(w))) = 1/2 (inner(bold(hat(v)), bold(hat(v))) + inner(bold(hat(w)), bold(hat(w)))) \ implies inner(bold(hat(v)) - bold(hat(w)), bold(hat(v)) - bold(hat(w))) = 0 \ implies bold(hat(v)) = bold(hat(w)) $

  Thus, $ bold(v) = lambda bold(w) " for " lambda = inner(bold(v), bold(v))^(1/2)/inner(bold(w), bold(w))^(1/2). $ ]

== Symmetry and Amplification

This material is from #link(
  "https://web.archive.org/web/20240516183201/https://terrytao.wordpress.com/2007/09/05/amplification-arbitrage-and-the-tensor-power-trick/",
)[Terence Tao's blog].

We consider the general setting of a complex inner product space, $V$.// That is to say, $V$ is a complex inner product space that is complete with respect to the norm induced by the inner product.
In this context, the Cauchy-Schwarz inequality is given by

$ abs(inner(bold(v), bold(w))) <= inner(bold(v), bold(v))^(1/2) inner(bold(w), bold(w))^(1/2). $

To prove this, we start off with the additive bound,

$ 0 <= inner(bold(v) - bold(w), bold(v) - bold(w)) \ implies Re inner(bold(v), bold(w)) <= 1/2 (inner(bold(v), bold(v)) + inner(bold(w), bold(w))). $

This is a weaker bound than Cauchy-Schwarz as $Re inner(bold(v), bold(w)) <= abs(inner(bold(v), bold(w))) <= inner(bold(v), bold(v))^(1/2) inner(bold(w), bold(w))^(1/2) <= 1/2 (inner(bold(v), bold(v)) + inner(bold(w), bold(w)))$.
The last inequality follows from the AM-GM inequality (see next chapter for more
details).

We can amplify this additive bound by observing some symmetry imbalances.
Particularly, the phase rotation $bold(v) arrow.bar e^(i theta) bold(v)$ preserves
the right-hand side but not the left-hand side,

$ Re #h(2pt) e^(i theta) inner(bold(v), bold(w)) <= 1/2 (inner(bold(v), bold(v)) + inner(bold(w), bold(w))). $

We can choose any real $theta$ we want. To make the left-hand side as large as
possible, we choose $theta$ to cancel the phase of $inner(bold(v), bold(w))$.
This gets us,

$ abs(inner(bold(v), bold(w))) <= 1/2 (inner(bold(v), bold(v)) + inner(bold(w), bold(w))). $

Now, to strengthen the right-hand side we exploit a different symmetry, _homogenisation symmetry_.
Particularly, consider the map $(bold(v), bold(w)) arrow.bar (lambda bold(v), 1/lambda bold(w))$ for
a scalar $lambda > 0$. This gives us,

$ abs(inner(bold(v), bold(w))) <= lambda^2/2 inner(bold(v), bold(v)) + 1/(2 lambda^2) inner(bold(w), bold(w)). $

The choice of $lambda = sqrt(norm(bold(w)) slash norm(bold(v)))$ minimizes the
right-hand side. This gives us,

$ abs(inner(bold(v), bold(w))) <= inner(bold(v), bold(v))^(1/2) inner(bold(w), bold(w))^(1/2). $

== Another Perspective

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
that $ inner(bold(v), bold(w)) <= norm(bold(v)) norm(bold(w)) $ with equality
iff $bold(v)$ and $bold(w)$ are proportional with a positive constant. Again, we
motivate our proof by thinking in terms of expressing proportionality. A first
attempt is to say that $bold(v), bold(w)$ are proportional with a positive
constant iff $bold(v) slash norm(bold(v)) = bold(w) slash norm(bold(w))$ (note
how this doesn't work for proportionality in general, for example we could have $bold(v) = - bold(w)$).
As we did before, we can equivalently express this condition as requiring $norm(bold(w)) bold(v) - norm(bold(v)) bold(w) = 0$.
So that we may express this using inner products, we consider the squared
version of this: $(norm(bold(w)) bold(v) - norm(bold(v)) bold(w))^2 = 0$. Note
that the left-hand side is in fact always greater than or equal to zero. Then,
expanding the left hand side immediately gives us the Cauchy-Schwarz result,

$ (norm(bold(w)) bold(v) - norm(bold(v)) bold(w))^2 = 2norm(bold(v))^2norm(bold(w))^2 - 2 norm(bold(w)) norm(bold(v)) inner(bold(v), bold(w)). $

For a complex inner product space, $(norm(bold(w)) bold(v) - norm(bold(v)) bold(w))^2$ expands
as

$ (norm(bold(w)) bold(v) - norm(bold(v)) bold(w))^2 = 2 norm(bold(v))^2 norm(bold(w))^2 - norm(bold(w)) norm(bold(v)) (inner(bold(v), bold(w)) + inner(bold(w), bold(v))) $

Let $x$ be a complex number with modulus $abs(x) = 1$ and the property that $inner(bold(w), x bold(v))$ is
real and non-negative. Consequently, $inner(bold(w), x bold(v)) = abs(inner(bold(w), bold(v)))$.
We readily get that $abs(inner(bold(w), bold(v))) = inner(bold(w), x bold(v)) <= norm(bold(v)) norm(bold(w))$ with
equality iff $x norm(bold(w)) bold(v) - norm(bold(v)) bold(w) = 0$.

= The AM-GM Inequality

== Geometric Perspective

The following additive bound that we used for a proof of Cauchy-Schwarz has more to offer still,
$ x y <= x^2/2 + y^2/2. $

A geometric interpretation for this would be that a rectangle's area is bounded by average area of the two squares whose sidelengths coincide with the rectangle. For nonnegative $(x, y)$, the substitution $(x, y) |-> (sqrt(x), sqrt(y))$ gives the classic AM-GM inequality that has richer interpretations, 
$ sqrt(x y) <= (x + y)/2. $

Note that, equivalently, $4 sqrt(x y) <= 2 (x + y)$. The right hand side can be interpreted as the perimeter of any rectangle with the area $x y$ and the left hand side can be interpreted as the perimeter of the unique square of area $x y$. Thus, this inequality tells us that the square has the least perimeter among all rectangles of the same area. The inequality is also equivalent to $x y <= ((x + y)/2)^2$. We can interpret the left hand side as the area of any rectangle with fixed perimeter $p = 2(x + y)$. The right hand side is then the area of the square with perimeter $p$. Thus, the inequality also tells us that among all rectangles having fixed perimeter, the square attains the maximum area. Such reframings furnish the interpretation of the AM-GM inequality as an _isoperimetric_ property of rectangles.

== Moving Towards Generality

We can show that the $n$-cube with edge length $S/n$ will have the largest volume among all boxes for which $sum_[n] a_i = S$.

#prop[For any sequence of nonnegative real numbers $a_1, a_2, ..., a_n$ one has $ (a_1 a_2 ... a_n)^(1/n) <= (a_1 + a_2 + ... + a_n)/n. $]
#proof[We prove this by _Cauchy induction_. We prove this for all powers of $2$ first. Note that $n = 2$ already follows from our prior discussion. Now assuming it holds for $n = 2^k$, let us show that it holds for $2 n = 2^( k + 1 )$. Then, $ 1/(2n) sum_(i = 1)^(2n) a_i &>= 1/2 ((product_(i = 1)^n a_i)^(1/n) + (product_(i = n + 1)^(2n) a_i)^(1/n)) \ &>= (product_(i = 1)^(2n) a_i)^(1/(2n)). $ Thus, the AM-GM inequality holds for all powers of $2$. Now, let $n, k in NN$ be such that $2^(k - 1) < n < 2^k$. Let $overline(a) = 1/n sum_[n] a_i$. Define a sequence ${alpha_i}_[2^k]$ of length $2^k$ as follows: $ alpha_i = cases(a_i #h(10pt) &"if" i in [n]\,, overline(a) &"otherwise".) $ Then apply AM-GM here, $ (product_(i = 1)^n a_i)^(1/2^k) overline(a)^((1-n/2^k)) = (product_(i = 1)^(2^k)alpha_i)^(1/2^k) &<= 1/2^k sum_(i = 1)^2^k alpha_i = (n overline(a) + (2^k - n) overline(a))/2^k = overline(a). \ implies (product_(i = 1)^n a_i)^(1/2^k) &<= overline(a)^(2^k/n) \ implies (product_(i = 1)^n a_i)^(1/n) &<= overline(a) = 1/n sum_(i = 1)^n a_i. $ This proves the AM-GM inequality for all $n in NN$. \ ]

Next, we consider a weighted AM-GM inequality.
#prop[Suppose $p_1, p_2, ..., p_n in QQ_(>= 0)$ are such that $sum_[n] p_i = 1$. Then for any sequence of nonnegative real numbers $a_1, a_2, ..., a_n$ one has $ a_1^(p_1) a_2^(p_2) ... a_n^(p_n) <= p_1 a_1 + p_2 a_2 + ... + p_n a_n. $]
#proof[
  Let $M in ZZ$ be a large enough integer such that each $p_i$ admits a representation $p_i = k_i/M$. Then, consider the sequence ${alpha_i}_([M])$ of $M$ positive integers comprising of $k_i$ copies of $a_i$. Then, the result follows by applying AM-GM to ${alpha_i}_([M])$.
]

We move on to the general AM-GM inequality. 
First, it may be presented as a consequence of the prior result, via an instructive density/continuity argument. 

#corollary[Suppose $p_1, p_2, ..., p_n in RR_(>= 0)$ are such that $sum_[n] p_i = 1$. Then for any sequence of nonnegative real numbers $a_1, a_2, ..., a_n$ one has $ a_1^(p_1) a_2^(p_2) ... a_n^(p_n) <= p_1 a_1 + p_2 a_2 + ... + p_n a_n. $]
#proof[We give a continuity/density proof. Let $Delta_n = {bold(x) in RR^n_(>= bold(0)) | sum_[n] x_i = 1}$ denote the $n$-simplex. 

It essentially suffices to argue that $QQ^n inter Delta_n$ is dense in $Delta_n$. Note that $overline(QQ^n inter Delta_n) = overline(QQ^n) inter Delta_n = RR^n inter Delta_n = Delta_n$. Thus, $QQ^n inter Delta_n$ is dense in $Delta_n$. 

This means that for any $(p_1, ..., p_n) in Delta_n$ we may find sequences $p_1(t), ..., p_2(t)$ such that $(p_1(t), ..., p_2(t)) in QQ^n inter Delta_n$. Then, for every $t in NN$, by our rationally-weighted AM-GM, we have $ product_(i = 1)^n a_i^(p_i (t)) <= sum_(i = 1)^n p_i (t) a_i $ $ implies lim_(t -> oo) product_(i = 1)^n a_i^(p_i (t)) <= lim_(t -> oo) sum_(i = 1)^n p_i (t) a_i \ implies product_(i = 1)^n a_i^(p_i) <= sum_(i = 1)^n p_i a_i. $
]

== An Elementary Path to Generality

Despite it's elegance, the continuity argument often loses the strictness of an equality and doesn't elucidate much about the circumstances in which equality is attained. It is instructive to thus look for a more elementary proof.

We start by giving a proof of perhaps that some would dub as being _one of the most useful inequalities in practice_.

#lemma[The inequality $1 + x <= e^x$ holds for all $x in RR$, and the inequality is strict except when $x = 0$.]
#proof[We give a proof by the Mean Value Theorem and case analysis. When $x = 0$, clearly the equality holds. When $x > 0$, we are asserting $1 < (e^x - 1)/x$. This follows by applying the MVT on the interval $(0, x)$ to $f(x) = e^x$, $ (e^x - 1)/x = (f(x) - f(0))/x = f'(y) = e^y $ for some $y in (0, x)$. As $y > 0$, we have $e^y > 1$ from which the result follows.

When $x < 0$, we are asserting $1 > (e^x - 1)/x$. Again, apply MVT on the interval $(x, 0)$ to $f(x) = e^x$, $ (e^x - 1)/x = (f(x) - f(0))/x = f'(y) $ for some $y in (x, 0)$. As $y < 0$, we have $e^y < 1$ from which the result follows.]

#prop[Suppose $p_1, p_2, ..., p_n in RR_(>= 0)$ are such that $sum_[n] p_i = 1$. Then for any sequence of nonnegative real numbers $a_1, a_2, ..., a_n$ one has $ a_1^(p_1) a_2^(p_2) ... a_n^(p_n) <= p_1 a_1 + p_2 a_2 + ... + p_n a_n. $]

#proof[ First, note that the inequality $x <= e^(x - 1)$ allows us to bound the left-hand side, a product of terms, by an exponential of a sum, similar to the one we find on the right hand side. Particularly, $ product_(i = 1)^n a_i^(p_i) <= product_(i = 1)^n e^(a_i p_i - p_i) = e^((sum_(i = 1)^n p_i a_i) - 1). $ In fact, the right hand side of the AM-GM inequality can also be bounded by the same term. $ sum_(i = 1)^n p_i a_i <= e^((sum_(i = 1)^n p_i a_i) - 1). $ Now, we are met with a challenge: can we convert a common bound for two quantities to a bound between the two quantities? $ max(product_(i = 1)^n a_i^(p_i) , sum_(i = 1)^n p_i a_i) <= e^((sum_(i = 1)^n a_i p_i) - 1). $ However, note that this does provide a relationship between our desired quantities at least when one of them is equal to the right hand side. Particularly, the case where $sum_(i = 1)^n a_i p_i = 1$ draws attention. Normalization allows us to exploit this structure. Particularly, let $A = sum_(i = 1)^n a_i p_i$ and define $alpha_i = a_i/A$. Then, we get $ product_(i = 1)^n alpha_i^(p_i) <= 1 \ implies product_(i = 1)^n (a_i/(A))^(p_i) = (1/(A)) product_(i = 1)^n a_i^p_i <= 1 \ implies product_(i = 1)^n a_i^p_i <= sum_(i = 1)^n a_i p_i. $ We recover the equality case by lookig back and noting that $a_k/A <= exp(a_k/A - 1)$ with equality if and only if $a_k/A = 1$. That is, if and only if, $a_1 = a_2 = ... = a_k$. ]

Similar to an approach we used for Cauchy-Schwarz, normalization was quite useful here. We can try to further justify this intuition on slightly more rigorous terms.

+ For inequalities that can be expressed as $F(bold(x)) >= 0$ with a homogenous $F$ (i.e. there exists $k$ such that for all $bold(x)$ we have $F(lambda bold(x)) = lambda^k F(bold(x))$), we can without loss of generality scale our variables.

+ A normalization like $G(bold(x)) = 1$, for continuous $G$, restricts $bold(x)$ to the compact set $G^(-1)({1})$. Often times, this restriction to a compact set helps us identify when the inequality is tight.

== A Showcase: Carleman's Inequality

We showcase the power of AM-GM by presenting a proof of the Carleman inequality.
#prop[For any sequence $a_1, a_2, ..., in RR_(>= 0)$ we have $ sum_(k = 1)^oo (a_1 a_2 ... a_k)^(1/k) <= e sum_(k = 1)^oo a_k. $]

#proof[
A useful first approach would be trying to prove the qualitative assertion that $ e sum_(k = 1)^oo a_k < oo => sum_(k = 1)^oo (a_1 a_2 .. a_k)^(1/k). $

A natural approach would be to recognize that we may apply AM-GM to each term on the latter sum. This unfortunately doesn't help us.
$ sum_(k = 1)^n (a_1 a_2 ... a_k)^(1/k) <= sum_(k = 1)^n 1/k (sum_(i = 1)^k a_i) = sum_(i = 1)^n a_i sum_(j = i)^k 1/k  $

Particularly, this upperbound diverges as $n -> oo$. This moves us to consider _the principle of maximal effectiveness_: use our tools precisely when they are at their best. Note that the convergence of the sum requires that in any long block $a_1, ..., a_n$ there must be terms that are "highly unequal". Unfortunately, this is the regime where the AM-GM inequality is a bit inefficient. We may then think about rescaling each $a_k$ by a $c_k$ so that the terms in the sequence $c_i a_i$ are approximately equal. Then, 
$ sum_(k = 1)^oo (a_1 a_2 ... a_k)^(1/k) &= sum_(k = 1)^oo (a_1 c_1 a_2 c_2 ... a_k c_k)^(1/k)/(c_1 c_2 ... c_k)^(1/k) \ &<= sum_(k = 1)^oo (a_1 c_1 + ... + a_k c_k)/(k(c_1 c_2 ... c_k)^(1/k)) \ &= sum_(k = 1)^oo 1/(k(c_1 c_2 ... c_k)^(1/k)) sum_(j = 1)^k a_j c_j \ &= sum_(j = 1)^oo a_j c_j sum_(k = j)^oo 1/(k(c_1 c_2 ... c_k)^(1/k)) $

The qualitative conjecture then follows if we can show that the sums $c_j sum_(k = j)^oo 1/(k(c_1 c_2 ... c_k)^(1/k))$ are bounded. The simplest choice for a tail sum that goes to zero comes from considering the telescoping identity $ sum_(k = j)^oo 1/b_k - 1/b_(k + 1) = 1/b_j $ for sequences $b_j -> oo$. We choose the simplest candidate possible $b_k = k$. We then define ${c_i}$ via the recursion, $ (c_1 c_2 ... c_k)^(1/k) = k + 1. $
We can explicitly resolve this recursion via, $ c_1 c_2 ... c_(k - 1) = k^(k - 1), #h(10pt) c_1 c_2 ... c_k = (k + 1)^k implies c_k = (k + 1)^k/k^(k - 1) = k (1 + 1/k)^k. $ Substituting this to our prior work, 

$ sum_(k = 1)^oo (a_1 a_2 ... a_k)^(1/k) <= sum_(j = 1)^oo a_j c_j sum_(k = j)^oo 1/(k(c_1 c_2 ... c_k)^(1/k)) = sum_(j = 1)^oo (1 + 1/j)^j a_j < e sum_(j = 1)^oo a_j $

]

= Lagrange's Identity and Minkowski's Conjecture

The inductive proof of Cauchy-Schwarz involved (implicitly) using the polynomial identity $ (a_1^2 + a_2^2)(b_1^2 + b_2^2) = (a_1 b_1 + a_2 b_2)^2 + (a_1 b_2 - a_2 b_1)^2. $ However, we were wasteful in never using $(a_1 b_2 - a_2 b_1)^2$, other than noting its non-negativity. At the very least, this helps us characterize the equality case of Cauchy-Schwarz by noting that, assuming $(b_1, b_2) != (0, 0)$ we have $(a_1 b_2 - a_2 b_1)^2 = 0 <==> a_1/b_1 = a_2/b_2.$ 

We now wonder if similar polynomial identities can be used to characterize the case of equality for the $n$-dimensional Cauchy-Schwarz. 

== Detecting Defects 

We simply start by defining a polynomial that detects the defect in the Cauchy-Schwarz inequality, $ Q_n = (sum_(i = 1)^n a_i^2)(sum_(j = 1)^n b_j^2) - (sum_(i = 1)^n a_i b_i)^2 = sum_(1 <= i, j <= n) a_i^2 b_j^2  - sum_(1 <= i, j <= n) a_i b_i a_j b_j. $

Similarly to how $Q_2 = (a_1 b_2 - a_2 b_1)^2$, can we represent $Q_n$ in terms of squares? Here, the _principle of symmetry_ is a useful guide. Consider the following representation, that makes the symmetry abundantly clear.
$ Q_n &= 1/2 sum_(1 <= i, j <= n) (a_i^2 b_j^2 + a_j^2 b_i^2) - sum_(1 <= i, j <= n) a_i b_i a_j b_j \ &= 1/2 sum_(1 <= i, j <= n) (a_i^2 b_j^2 - 2 a_i b_i a_j b_j + a_j^2 b_i^2) \ &= 1/2 sum_(1<= i, j <= n) (a_i b_j - a_j b_i)^2. $

In fact, we have rediscovered, _Lagrange's identity_. 
$ (sum_(i = 1)^n a_i b_i)^2 = sum_(i = 1)^n a_i^2 sum_(j = 1)^n b_j^2 - 1/2 sum_(i = 1)^n sum_(j = 1)^n (a_i b_j - a_j b_i)^2. $

We now resolve the equality case for Cauchy-Schwarz. Note if $(b_1, ..., b_n) != bold(0)$ there exists $b_k != 0$. Note that all terms in $Q_n$ must be equal to zero. That is, for all terms containing $b_k$, we must have $a_i b_k = a_k b_i$ for all $1 <= i <= n$. Taking $lambda = a_k / b_k$, we get that $a_i = lambda b_i$ for all $1 <= i <= n$. In hindsight, this also gives rise to the interpretation of $Q_n$ as a measure of the proportionality of two sequences (this was in fact the intuition used in the proof from Gowers we covered before).

== Sums of Squares

Our prior discussion motivates the following question: _Can one always write a nonnegative polynomial as a sum of squares? That is, if the real polynomial $P(x_1, x_2, ..., x_n)$, for all $(x_1, ..., x_n) in RR^n$ satisfies $ P(x_1, x_2, ..., x_n) >= 0, $ can one find a set of real polynomials $Q_k (x_1, x_2, ..., x_n), #h(5pt) 1 <= k <= s$ such that $ P = Q_1^2 + ... + Q_s^2 ? $_

We first consider the simple case where $deg (P(x)) = 2$.

#lemma[If $deg(P(x)) = 2$ then if $P >= 0$ there exists polynomials $Q_1, Q_2$ such that $P = Q_1^2 + Q_2^2$.]
#proof[
  We may write $ P(x) = a x^2 + b x + c = a (x + b/(2a))^2 + (4 a c - b^2)/(4a). $ For large enough $x$, $P >= 0$ implies $a > 0$. Next, taking $x_0 = -b/(2a)$ note that $P(x_0) >= 0$ implies $4a c - b^2 >= 0$. Thus, both these terms are positive and can be written as a sum of squares, $ Q_1 (x) = sqrt(a) (x + b/2a) #h(10pt) Q_2 (x) = 1/2 sqrt((4a c - b^2)/a). $
]

Recalling the $n = 2$ case of Lagrange's identity, we get 
$ (a_1 b_1 + a_2 b_2)^2 = (a_1 + a_2)^2 (b_1 + b_2)^2 - (a_1 b_2 - a_2 b_1)^2. $

Substituting in polynomials, gives us a very nice algebraic property for (univariate) polynomials that can be represented as a sume of two squares.

#lemma[If $Q(x)$ and $R(x)$ can be written as a sum of two squares, so can $Q(x) R(x)$.]
#proof[ Write $ Q = Q_1^2 + Q_2^2, #h(15pt) R = R_1^2 + R_2^2. $ Then, by Lagrange's identity $ Q R = (Q_1^2 + Q_2^2) (R_1^2 + R_2^2) = (Q_1 R_1 + Q_2 R_2)^2 + (Q_1 R_2 - Q_2 R_1)^2. $ ]

This representation is suggestive of an inductive proof.

#prop[Any nonnegative univariate real polynomial can be written as the sum of squares of two real polynomials.]
#proof[
  We have already shown that this holds for univariate quadratic polynomials.

  Now suppose $P$ is a univariate polynomial with $deg P > 2$. 

  If $P$ has a real root $a$ of degree $m > 0$, then we have $P = (x - a)^m R(x)$ with $R(a) != 0$. If we set $x = a + epsilon$, then we equivalently have $P(x + epsilon) = epsilon^m R(a + epsilon)$. By continuity of $R$, there is a $delta$ such that $R(a + epsilon)$ has the same sign for all $|epsilon| <= delta$ (specifically, the same sign as $R(a)$). Since $P$ is always nonnegative, $epsilon^m$ must also have the same sign for all $|epsilon| <= delta$. Thus, $m = 2k$ for some $k in NN$. Thus, with $Q = (x - a)^k$, we have $P = Q^2 R$. Furthermore, as $P >= 0$, we must have $R >= 0$ too.

  If $P$ has no real roots, then by the fundamental theorem of algebra, we must have a complex root $r$. As $P(overline(r)) = overline(P(r)) = 0$, the conjugate $overline(r)$ is also a root. Thus, for $Q = (x - r) (x - overline(r))$, we have the factorization $P = Q R$. Furthermore, for $x >= abs(r)$, $Q >= 0$. Since $Q$ has no real zeros, $Q >= 0$ everywhere. As $P$ is nonnegative, $R$ must be nonnegative too.

Thus, in either case, we may represent $P$ as a product of lower degree polynomials. By induction, these lower degree polynomials can be written as the sum of squares. Consequently, $P$ is also the sum of squares.

]

== Minkowski's Conjecture

Unlike the case for univariate polynomials where it reduces to a set of discrete points, the zero set $P(x, y) = 0$ may be some complicated geometric shape. Minkowski conjectured that there exists nonnegative polynomials of two variables that cannot be written as the sum of squares of real polynomials. 

We can start by considering some sources of nonnegative polynomials over two variables. Obviously, considering polynomials that are a sum of squares of two real polynomials would be unhelpful. Alternatively, we may consider squaring both sides of the Cauchy-Schwarz inequality. However, Lagrange's identity rules this out as being a counterexample. Finally, we could try polynomials that the AM-GM inequality tells us must be nonnegative. We try to produce such a polynomial in the simplest manner possible. The simplest choice for nonnegative variables is $a_1 = x^2, a_2 = y^2$. Furthermore, to simplify the product we may choose $a_3 = 1/(x^2 y^2)$. Thus, $ 1 <= 1/3 (x^2 + y^2 + 1/(x^2y^2)) => -3x^2 y^2  + x^4 y^2 + x^2 y^4 + 1 >= 0. $ Let $P(x, y) = x^4 y^2 + x^2 y^4 - 3x^2 y^2 + 1$. By AM-GM, we have shown $P(x, y) >= 0$. If $P(x, y) = Q_1^2 (x, y) + ... + Q_s^2 (x, y)$ then we can make two observations.
- $deg Q_i <= 3$.
- $P(x, 0) = 1 = P(y, 0)$. Thus, $Q_i (0, x), Q_i (0, y)$ are both bounded.

As a result, each $Q_i$ can be expressed as $ Q_i = a_i + b_i x y + c_i x^2 y + d_i x y^2. $

Note now that the coefficient of $x^2 y^2$ in $sum _i Q_i^2$ is $sum_i b_i^2 >= 0$. However, the coefficient of $x^2 y^2$ in $P$ is $-3$. Thus, $P$ cannot be written as the sum of squares of real polynomials.

= On Geometry and Sums of Squares
