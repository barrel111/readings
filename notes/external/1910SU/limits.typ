#import "@local/preamble:0.1.0":*

#show: project.with(
  course: "1910PREP",
  sem: "Summer",
  title: "Limits!",
  subtitle: "",
  authors: ("Shaleen Baral",),
)

= Introduction

We start by giving an (informal) definition of what limits are. While not
mathematically precise, it captures all the intuition needed to understand the
technical definition and suffices for our needs (see Section 2.3 of Thomas's
Calculus for the precise definition).

#definition(
  "Limits",
)[We say the _limit of $f(x)$ is $L$ as $x$ approaches $a$_ and write this as $ lim_(x arrow a) f(x) = L $ if
  we can get $f(x)$ as close to $L$ as we want for all $x$ sufficiently close to $a$,
  from both sides, without actually letting $x$ be $a$.]

Note how the concept of a limit doesn't care about what happens at the point
where the limit is being taken, $a$ (the function can even be undefined at $a$!),
but rather it is all about the behavior around the point $a$.

= Rules for Computing

There are four properties of the limit that often end up being useful for
computations.

*Assuming that the limits $lim_(x arrow a) f(x)$ and $lim_(x arrow
a) g(x)$ both exist*, we have the following facts:

+ *Constant Rule.* #h(5pt) If $c$ is some fixed real number then $lim_(x arrow a)[c f(x)] = c dot [lim_(x arrow a) f(x)]$.

+ *Sum Rule.* #h(5pt) $lim_(x arrow a) [f(x) plus.minus g(x)] = lim_(x arrow a) f(x) plus.minus lim_(x arrow a) g(x).$

+ *Product Rule.* #h(5pt) $lim_(x arrow a) [f(x) g(x)] = [lim_(x to a) f(x)][lim_(x to a) g(x)]$

+ *Quotient Rule.* #h(5pt) If $lim_(x arrow a) g(x) != 0$ then $ lim_(x arrow a) [f(x)/g(x)]= (lim_(x arrow a) f(x))/(lim_(x arrow a)g(x))$

= Continuous Functions

For certain _sufficiently nice_ functions you may have noticed that the limit at
a point is just the value that the function takes at that point. We call
functions having this property _continuous functions_.

#definition(
  "Continuity at a point",
)[A function $f(x)$ is _continuous at the point $a$_ if $ lim_(x arrow a)f(x) = f(a). $]

#definition(
  "Continuous function",
)[A function $f(x)$ is a _continuous function_ if it is continuous at every point
  in its domain.]

For your pleasure and benefit, I present a delightful assortment of continuous
functions!

+ Polynomials (i.e. functions that are just sums of multiples of non-negative powers of $x$).
  #example[$x^2$, $3x^5 - x^3 + x^2$, $x^8 + 100, 1.$ (for clarity, the last example is the
    constant function $f(x) = 1$)]

+ Roots
  #example[$sqrt(x), root(3, x), root(4, x).$]

+ Trigonometric functions.
  #example[$sin(x)$, $cos(x)$, $tan(x)$, $csc(x)$, $sec(x)$, $cot(x).$]

+ Exponentials and Logarithms.
  #example[$e^x, 2^x, ln(x), log_2(x), log_(10)(x).$]

Furthermore, if $f(x)$ and $g(x)$ are continuous functions, we may conclude that
the following functions are also continuous:

+ $f(x) + g(x), f(x) - g(x).$

+ $f(x)g(x).$

+ $f(g(x)).$

+ $f(x)/g(x)$ if $g(x) != 0$ for any $x$.

= Squeeze Theorem

Sometimes, inequalities can be helpful in computing limits too. The following
result ends up being quite useful.

#theorem(
  "Squeeze Theorem",
)[Suppose that for all $x$ on $[b , c]$ (except possibly at $x = a$) we have, $ g(x) <= f(x) <= h(x). $ Also
  suppose that $ lim_(x arrow a) g(x) = lim_(x arrow a) h(x) = L $ for some $a$ in $[b, c]$.
  Then, $ lim_(x arrow a) f(x) = L. $]

#remark[Recall, $[b, c]$ is the shorthand for the closed interval, ${x bar b <= x <= c}$--
  in words, it is the set of all real numbers betweein $b$ an $c$ (including $b$ and $c$).]

The name comes from the fact that, graphically, it appears as though the graphs
of $g$ and $h$, "squeeze" the graph of $f$ at $x = a$ to acquire the same common limit.

#figure(image("graphics/squeeze-theorem.svg", width: 40%), caption: [
  Squeeze Theorem.
])
