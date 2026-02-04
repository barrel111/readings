#import "@local/preamble:0.1.0": *
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#show: project.with(
  course: "",
  sem: "Summer",
  title: "Cauchy-Schwarz Masterclass",
  subtitle: "Problems",
  authors: ("Shaleen Baral",),
)

#set enum(indent: 15pt, numbering: "a.")

= Starting with Cauchy
== The 1-Trick and the Splitting Trick

By the Cauchy-Schwarz inequality, with $b_1 = dots.c = b_n = 1$, we get

$ a_1 + a_2 + dots.c + a_n <= sqrt(n) (a_1^2 + a_2^2 + dots.c + a_n^2)^(1/2). $

For the second inequality, consider $x_k = a_k^(1/3)$ and $y_k = a_k^(2/3)$.
Then, by Cauchy-Schwarz we have

$ sum_(k = 1)^n x_k y_k &<= (sum_(k = 1)^n x_k^2)^(1/2) (sum_(k = 1)^n y_k^2)^(1/2) \ implies sum_(k = 1)^n a_k &<= (sum_(k = 1)^n a_k^(2/3))^(1/2) (sum_(k = 1)^n a_k^(4/3))^(1/2) $

== Product of Averages and Averages of Products

By the Cauchy-Schwarz inequality and using the fact that $1 <= a_k b_k$ implies $1 <= sqrt(a_k b_k)$,
we have

$ (sum_(k = 1)^n p_k a_k) (sum_(k = 1)^n p_k b_k) >= (sum_(k = 1)^n p_k a_k^(1/2) b_k^(1/2))^2 >= (sum_(k = 1)^n p_k)^2 = 1. $

== Why Not Three or More?

By applying the Cauchy-Schwarz inequality twice,

$ sum_(k = 1)^n a_k b_k c_k &<= (sum_(k = 1)^n a_k^2)^(1/2) (sum_(k = 1)^n b_k^2 c_k^2)^(1/2) \ &<= (sum_(k = 1)^n a_k^2)^(1/2) (sum_(k = 1)^n b_k^4)^(1/4) (sum_(k = 1)^n c_k^4)^(1/4). $

Thus,

$ (sum_(k = 1)^n a_k b_k c_k )^4 <= (sum_(k = 1)^n a_k^2)^2 sum_(k = 1)^n b_k^4 sum_(k = 1)^n c_k^4. $

For the next inequality, we start with the observation that for any $k in [n]$,

$ c_k <= (sum_(k = 1)^n c_k^2)^(1/2). $

Using this and the Cauchy-Schwarz inequality, we have

$ sum_(k = 1)^n a_k b_k c_k &<= sum_(k = 1)^n a_k b_k (sum_(k = 1)^n c_k^2)^(1/2) \ &<= (sum_(k = 1)^n a_k^2)^(1/2) (sum_(k = 1)^n b_k^2)^(1/2) (sum_(k = 1)^n c_k^2)^(1/2). $

Thus,

$ (sum_(k = 1)^n a_k b_k c_k)^2 <= sum_(k = 1)^n a_k^2 sum_(k = 1)^n b_k^2 sum_(k = 1)^n c_k^2. $

== Some Help From Symmetry

+ This pretty much follows from Problem 1.1. Consider,

$ ((x+y)/(x + y + z))^(1/2) + ((x + z)/(x + y + z))^(1/2) + ((y + z)/(x + y + z))^(1/2) <= 3^(1/2) ((2(x + y + z))/(x + y + z))^(1/2) = 6^(1/2). $

+ Again, we use the Cauchy-Schwarz inequality,
$ (x + y + z)^2 &= (x/(sqrt(y + z))sqrt(y + z) + y/(sqrt(x + z))sqrt(x + z) + z/(sqrt(x + y))(sqrt(x + y)))^2 \ &<= 2(x + y+ z) (x^2/(y + z) + y^2/(x + z) + z^2/(x + y)) \ implies x + y + z &<= 2 (x^2/(y + z) + y^2/(x + z) + z^2/(x + y)). $

== A Crystallographic Inequality with a Message

Consider, using the Cauchy-Schwarz inequality,

$ g^2(x) &= (sum_(k = 1)^n p_k^(1/2) p_k^(1/2) cos(beta_k x)) \ &<= sum_(k = 1)^n p_k sum_(k = 1)^n p_k cos^2(beta_k x) \ &= sum_(k = 1) p_k/2 (1 + cos(2 beta_k x)) \ &<= 1/2 (sum_(k = 1)^n p_k + sum_(k = 1)^n p_k cos(2beta_k x)) \ &= 1/2 (1 + g(2x)). $

== A Sum of Inversion Preserving Summands

Momentarily, we shift focus on bounding $sum_(k = 1)^n 1/p_k$ from below. This
is also a consequence of Cauchy-Schwarz,

#numbered_eq(
  $ sum_(k = 1)^n 1/p_k = sum_(k = 1)^n p_k sum_(k = 1)^n 1/p_k >= (sum_(k = 1)^n 1)^2 = n^2 $,
)

The equality occurs iff $sqrt(p_k) = alpha/sqrt(p_k)$. That is, when all $p_k$ are
equal. This then implies that equality occurs iff $p_k = 1/n$.

Then, by the Cauchy-Schwarz inequality and the above result,

#numbered_eq(
  $ sum_(k = 1)^n (p_k + 1/p_k)^2 >= 1/n (sum_(k = 1)^n p_k + sum_(k=1)^n 1/p_k)^2 = 1/n (1 + sum_(k = 1)^n 1/p_k)^2 \ >= 1/n (1 + n^2)^2 >= n^3 + 2n + 1/n. $,
)

It is easy to check that $p_k = 1/n$ for all $k$ is a sufficient condition for
equality in (2). For it to be necessary, we just note that $p_k = 1/n$ is a
necessary condtion for equality in the second application of Cauchy-Schwarz in
(2).

== Flexibility of Form

Consider the inner product on $RR^2$ defined by

$ inner(bold(x), bold(y)) = 5 x_1 y_1 + x_1 y_2 + x_2 y_1 + 3 x_2 y_2 $

It is an inner product since,

+ $inner(bold(x), bold(x)) > 0$ for non-zero $bold(x) in RR^2$

  Consider, if one of the coordinates of $bold(x)$ is nonzero then,

  $ 5x_1^2 + 2x_1 x_2 + 3 x_2^2 = 4x_1^2 + 2x_2^2 + (x_1 + x_2)^2 > 0. $

+ $inner(alpha bold(x) + bold(v), bold(y)) = alpha inner(bold(x), bold(y)) + inner(bold(v), bold(y))$ for
  all $alpha in RR$ and $bold(x), bold(y), bold(v) in RR^2$

  Consider the following,

  $ inner(alpha bold(x) + bold(v), bold(y)) &= 5(alpha x_1 + v_1)y_1 + (alpha x_1 + v_1) y_2 + (alpha x_2 + v_2) y_1 + 3 (alpha x_2 + v_2) y_2 \ &= alpha(5 x_1 y_1 + x_1y_2 + x_2 y_1 + 3 x_2 y_2) + (5 v_1 y_1 + v_1 y_2 + v_2 y_1 + 3 v_2 y_2) \ &= alpha inner(bold(x), bold(y)) + inner(bold(v), bold(y)). $

+ $inner(bold(x), bold(y)) = inner(bold(y), bold(x))$ for all $bold(x), bold(y) in RR^2$

  This follows from a routine computation,

  $ inner(bold(x), bold(y)) &= 5 x_1 y_1 + x_1 y_2 + x_2 y_1 + 3x_2 y_2 \ &= 5 y_ 1x_1 + y_2 x_1 + y_1 x_2 + 3 y_2 x_2 \ &= inner(bold(y), bold(x)). $

Then by Cauchy-Schwarz on $bold(x) = (x, y)$ and $bold(alpha) = (alpha, beta)$,
we have

$ 5x alpha + x beta + y alpha + 3 y beta <= (5x^2 + 2x y + 3y^2)^(1/2) (5alpha^2 + 2 alpha beta + 3 beta^2)^(1/2). $

== Doing Sums

+ $sum_(k = 0)^oo a_k x^k <= 1/(sqrt(1 - x^2)) (sum_(k = 0)^oo a_k^2)^(1/2)$ for $x in [0, 1)$ \ \ For $x in [0, 1)$, we have $sum_(k = 0)^oo x^(2k) = 1/(1 - x^2)$. If $sum_(k = 0)^oo a_k^2 = oo$ the bound trivially holds. Otherwise, we apply Cauchy-Schwarz to obtain $ sum_(k = 0)^oo a_k x^k <= 1/(sqrt(1 - x^2)) (sum_(k = 0)^oo a_k^2)^(1/2). $ 

+ $sum_(k = 1)^n a_k/k < sqrt(2) (sum_(k = 1)^n a_k^2)^(1/2)$ \ \ We start by noting, $ sum_(k = 1)^n 1/k^2 <= 1 + integral_1^n 1/k^2 d k = 2 - 1/n < 2. $ When $sum_(k = 0)^oo a_k^2 = oo$ the bound trivially holds. Otherwise, we apply Cauchy-Schwarz to obtain $ sum_(k = 0)^oo a_k/k < sqrt(2) (sum_(k = 1)^n a_k^2)^(1/2). $

+ $sum_(k = 1)^n a_k/(sqrt(n + k)) < (log 2)^(1/2) (sum_(k = 1)^n a_k^2)^(1/2)$ \ \ We start by noting that $ sum_(k = 1)^n 1/(n + k) < integral_(n)^(2n) 1/k d k = ln 2n - ln n = ln 2. $ When $sum_(k = 0)^oo a_k^2 = oo$ the bound trivially holds. Otherwise, we apply Cauchy-Schwarz to obtain $ sum_(k = 1)^n a_k/(sqrt(n + k)) < (ln 2)^(1/2) (sum_(k = 1)^n a_k^2)^(1/2). $

+ $sum_(k = 0)^n binom(n, k) a_k <= binom(2n, n)^(1/2) (sum_(k = 0)^n a_k^2)^(1/2) $ \ \ This is a standard application of Cauchy-Schwarz after proving that $sum_(k = 0)^n binom(n, k)^2 = binom(2n, n)$. This is equivalent to $sum_(k = 0)^n binom(n, k) binom(n, n - k) = binom(2n, n)$. We give a combinatorial proof of this. The right hand side counts the number of ways of choosing $n$ elements of a $2n$-element set. To see that the left hand side also does so, consider the following process of selection: fix a partition of a $2n$-element set into two sets of size $n$; from the first partition select $k$ elements and from the second parition select $n - k$ elements. Summing up over all choices of $k$, we get the left hand side. \ Finally, apply Cauchy-Schwarz to obtain
$ sum_(k = 0)^n binom(n, k) a_k <= (sum_(k = 0)^n binom(n, k)^2)^(1/2) (sum_(k = 0)^n a_k^2)^(1/2) = binom(2n, n)^(1/2) (sum_(k = 0)^n a_k^2)^(1/2). $

== Beating the Obvious Bounds

First, note that $(a + b)^2 + (a - b)^2 = 2 (a^2 + b^2)$. Thus, we get

$ abs(sum_(j = 1)^n a_j)^2 + abs(sum_(j = 1)^n (-1)^j a_j)^2 &= 2 ((sum_(j = 1)^(floor(n\/2)) a_( 2j ))^2 + (sum_(j = 1)^(ceil(n/2)) a_j)^2) \ &<= 2 (floor(n/2) sum_(j = 1)^(floor(n\/2))a_(2j)^2 + ceil(n/2) sum_(j = 1)^(ceil(n\/2))a_j^2) \ &<= 2 ((n/2 + 1) sum_(j = 1)^(ceil(n\/2))a_(2j)^2 + (n/2 + 1) sum_(j = 1)^(ceil(n\/2))a_j^2) \ &<= (n + 2) sum_(j = 1)^n a_j^2. $

== Schur's Lemma -- The $R$ and $C$ Bound

$ abs(sum_(j = 1)^m sum_(k = 1)^n c_(j k) x_j y_k)^2 &<= (sum_(j = 1)^m x_j^2) (sum_(j = 1)^m (sum_(k = 1)^n c_(j, k) y_k )^2) \ 
&<= (sum_(j = 1)^m x_j^2) (sum_(j = 1)^m (sum_(k = 1)^n c_(j k))(sum_(k = 1)^n c_(j k) y_k^2)) \
&<= (max_k sum_(k = 1)^n |c_(j k)|) (sum_(j = 1)^m x_j^2) (sum_(k = 1)^n sum_(j = 1)^m c_(j k) y_k^2) \
&<= (max_k sum_(k = 1)^n |c_(j k)|) (max_j sum_(j = 1)^m c_(j k)) (sum_(j = 1)^m x_j^2) (sum_(k = 1)^n y_k^2) \ &= C R (sum_(j = 1)^m x_j^2) (sum_(k = 1)^n y_k^2). $

== Schwarz's Argument in an Inner Product Space

$ p(t) = inner(bold(v) + t bold(w), bold(v) + t bold(w)) = norm(bold(v))^2 + 2 t inner(bold(v), bold(w)) + t^2 norm(bold(w))^2 $

We know that $p(t) >= 0$. Thus, the discriminant must be non-positive. That is,

$ (2 inner(bold(v), bold(w)))^2 - 4 norm(bold(v))^2 norm(bold(w))^2 <= 0 implies inner(bold(v), bold(w)) <= norm(bold(v)) norm(bold(w)). $

Equality holds if and only if the discriminant is $0$. This is true if and only if there exists a $t^star$ such that $p(t^star) = 0$. In turn, this holds if and only if $norm(v + t^star bold(w)) = 0$ which is true if and only if $bold(v) = - t^star bold(w)$.

== Example of a Self-Generalization

Consider the vector space $V^n$, with the inner product
$ inner((bold(x)_1, ..., bold(x)_n), (bold(y)_1, ..., bold(y)_n)) = sum_(i = 1)^n inner(bold(x_i), bold(y_i)). $

It is easy to verify that this is in fact an inner product. Then, by the fact that Cauchy-Schwarz holds in abstract inner product spaces, we then have:

$ sum_(i = 1)^n inner(bold(x)_i, bold(y)_i) &<= inner((bold(x)_1, ..., bold(x)_n), (bold(y)_1, ..., bold(y)_n)) \ &<= inner((bold(x)_1, ..., bold(x)_n), (bold(x)_1, ..., bold(x)_n))^(1/2) inner((bold(y)_1, ..., bold(y)_n), (bold(y)_1, ..., bold(y)_n))^(1/2) \ &<= (sum_(i = 1)^n inner(bold(x)_i, bold(x)_i))^(1/2) (sum_(i = 1)^n inner(bold(y)_i, bold(y)_i))^(1/2). $

== Application of Cauchy's Inequality to an Array

Let $b_( j k ) = alpha_j + beta_k$ with $ alpha_j = 1/n sum_(k = 1)^n a_(j k) #h(25pt) beta_k = 1/m sum_(j = 1)^m a_(j k). $ Without loss of generality we may suppose $sum_(j, k) a_(j k) = sum_([m]) alpha_j = sum_([n]) beta_k = 0$. Then note, $ 0 &<= sum_(j, k) (a_(j k) - b_(j k))^2 \ &= sum_(j, k) (a_(j k)^2 - 2 a_(j k) b_(j k) + b_(j k)^2) \ &= sum_(j, k) a_(j k)^2 - 2  sum_(j, k) a_(j k) alpha_j - 2  sum_(j, k) a_(j k) beta_k + sum_(j, k) (alpha_j + beta_k)^2 \ &= sum_(j, k) a_(j k)^2 - 2 n sum_(j) alpha_j^2 - 2 m sum_k beta_k^2 + n sum_j alpha_j^2 + 2 sum_(j, k) alpha_j beta_k + m sum_k beta_k^2 \ implies 1/n sum_(j) alpha_j^2 &+ 1/m sum_k beta_k^2 <= sum_(j, k) a_(j k)^2. $

The general result follows after an appropriate change of variables.

== A Cauchy Triple and Loomis-Whitney

+ Consider, \ $ 
sum_(i,j,k = 1)^n a_(i j)^(1/2) b_(j k)^(1/2) c_(k i)^(1/2) &= sum_(i, j = 1)^n a_(i j)^(1/2) sum_(k = 1)^n b_(j k)^(1/2) c_(k i)^(1/2) \ &<= sum_(i, j = 1)^n a_(i j)^(1/2) (sum_(k = 1)^n b_(j k))^(1/2) (sum_(k = 1)^n c_(k i))^(1/2) \ &= sum_(j = 1)^n (sum_(k = 1)^n b_(j k))^(1/2) sum_(i = 1)^n a_(i j)^(1/2) (sum_(k = 1)^n c_(k i))^(1/2) \ &<= sum_(j = 1)^n (sum_(k = 1)^n b_(j k))^(1/2) (sum_(i = 1)^n a_(i j))^(1/2) (sum_(i, k = 1)^n c_(k i))^(1/2) \ &<= (sum_(i, j = 1)^n a_(i j))^(1/2) (sum_(j, k = 1)^n b_(j k))^(1/2) (sum_(i, k = 1)^n c_(k i))^(1/2). $ \ Consider, \ $sum_(i,j,k = 1)^n$

+ Let $n = max_(bold(x) in A) norm(bold(x))_oo. $ Then let $ a_(i j) = bb(1) {(0, i, j) in A_x}, \ b_(j k) = bb(1) {(k, 0, j) in A_y}, \ c_(k i) = bb(1) {(k, i, 0) in A_z}. $ \ Note that $a_(i j)^(1/2) b_(j k)^(1/2) c_(k i)^(1/2) = a_(i j) b_(j k) c_(k i) in {0, 1}$. Furthermore, $a_(i j) b_(j k) c_(k i) = 1$ if and only if $(i, j, k) in A$. Thus, $ |A| = sum_(i, j, k = 1)^n a_(i j)^(1/2) b_(j k)^(1/2) c_(k i)^(1/2) <=  (sum_(i, j = 1)^n a_(i j))^(1/2) (sum_(j, k = 1)^n b_(j k))^(1/2) (sum_(i, k = 1)^n c_(k i))^(1/2) = |A_x|^(1/2) |A_y|^(1/2) |A_z|^(1/2). $

== An Application to Statistical Theory

First, we differentiate with respect to $theta$.
$ sum_(k in D) g(k) p(k; theta) = theta => sum_(k in D) g(k) p_theta (k; theta) = 1 \ sum_(k in D) p(k; theta) = 1 => sum_(k in D) p_theta (k; theta) = 0 $

Now, we apply Cauchy-Schwarz,
$ 1 &= (sum_(k in D) (g(k) - theta) p_theta (k; theta))^2 \ &<= (sum_(k in D) (g(k) - theta)^2 p (k; theta)) (sum_(k in D)((p_theta (k; theta))/p(k; theta))^2 p_theta (k; theta)) \ &<= bold("Var")[g] dot bold("I")(theta). $

= The AM-GM Bound

== More from Leap-forward Fall-back Induction

== Bernoulli and the Exponential Bound

== Bounds by Pure Powers

== A Canadian Challenge 

== A Bound Between Differences

== Geometry of the Geometric Mean 

== One Bounded Product Implies Another

== Optimality Principles for Products and Sums

== An Isoperimetric Inequality for the 3-Cube

== Åkerberg's Refinement

== Superadditivity of the Geometric Mean

== On Approximate Equality in the AM-GM Bound

== An AM-GM Inequality for Complex Numbers

== A Leap-Forward Fall-Back _Tour de France_

