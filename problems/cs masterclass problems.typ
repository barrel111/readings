#import "@local/preamble:0.1.0": *
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#show: project.with(
  course: "",
  sem: "Summer",
  title: "Cauchy-Schwarz Masterclass",
  subtitle: "Aluffi",
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



== Schur's Lemma -- The $R$ and $C$ Bound

== Schwarz's Argument in an Inner Product Space

== Example of a Self-generalization

== Application of Cauchy's Inequality to an Array

== A Cauchy Triple and Loomis-Whitney

== An Application to Statistical Theory
