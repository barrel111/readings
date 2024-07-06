#import "@local/preamble:0.1.0": *
#import "@preview/cetz:0.2.2": canvas, plot

#show: project.with(
  course: "1910SU",
  sem: "Summer",
  title: "Group Discussion: Differentiation I",
  subtitle: "Solutions",
  contents: false,
)

#let tri = $triangle.t$

= Trigonometric Derivatives

== Prove the identity: $lim_(x arrow 0) sin(x)/x = 1.$

#align(center)[
  #image("graphics/triangle.png", width: 35%)
]

From the picture above, we can conclude $ tri A B C <= accent(A B C, paren.t) <= tri A B D. $

#remark[Notationally, I am using $accent(A B C, paren.t)$ to denote the area of the
  sector colored blue in the figure above.]

Furthermore, the area of each of the shapes can be calculated as follows,

$ tri A B C              &= 1/2 dot.c b dot.c h = 1/2 dot 1 dot sin x \
accent(A B C, paren.t) &= 1/2 dot.c r^2 dot.c x = 1/2 dot.c x \
tri A B D              &= 1/2 dot.c b dot.c h = 1/2 dot.c 1 dot.c tan x $

Substituting these values back into our initial inequality, we get the desired
result.

$ (sin x)/2 <= x/2 <= (tan x)/2. $

From the first inequality, we obtain the desired upper bound,

$ (sin x)/2 <= x /2 implies (sin x)/x <= 2/2 implies (sin x)/x <= 1. $

From the second inequality, we obtain the desired lower bound,

$ x/2 <= (tan x)/2 implies x <= (sin x)/(cos x) implies cos x <= (sin x)/x. $

Thus, $ cos x <= (sin x)/x <= 1. $

By the Squeeze Theorem,

$   &lim_(x -> 0) cos x <= lim_(x -> 0) (sin x)/x <= lim_(x -> 0) 1 \ implies &1 <= lim_(x -> 0) (sin x)/x <= 1 \ implies &lim_(x -> 0) (sin x)/x = 1. $

#align(right)[$square$]

== Prove the identity $lim_(x arrow 0) (cos x - 1)/x = 0.$

We start by multiplying the numerator and denominator by $(cos x + 1)$ as
suggested by the hint.
$ (cos x - 1)/x dot.c (cos x + 1)/(cos x + 1) = (cos^2 x - 1)/x(cos x + 1) $
From $sin^2 x + cos^2 x = 1$, it follows that $cos^2 x - 1 = -sin^2 x$. So,
$ = -(sin^2 x)/(x (cos x + 1)) $
The trick now is to write the expression above as a product of terms each of
whose limit as $x arrow 0$ is known.
$ = (sin x)/x dot.c (- sin(x)) dot 1/(cos x + 1) $
From the previous part, we know that $lim_(x arrow 0) (sin x)/x = 1$.
Furthermore, by continuity of $sin$, we note that $lim_(x arrow 0) -sin x = -sin 0 = 0.$ Similarly,
by continuity of $1/(cos x + 1)$ at $x = 0$, we have $lim_(x arrow 0) 1/(cos x + 1) = 1/2.$ Thus,
we may conclude the following.

$ lim_(x arrow 0) (cos x - 1)/x &= (lim_(x arrow 0) (sin x)/x) (lim_(x arrow 0) - sin(x)) (lim_(x arrow 0) 1/(cos x + 1)) \
                              &= 1 dot 0 dot 1/2 = 0 $

#align(right)[$square$]

== Prove that $d/(d x) sin x = cos x$ from first principles.
~

First, a quick note on the angle sum formula,
$ sin(a + b) = sin a cos b + cos a sin b. $ There are a lot of ways of proving
it and its interesting to see how you go on to see nicer and nicer proofs of it
as you learn more math (there are fairly neat proofs using linear algebra, the
Taylor series, Euler's formula etc.) Below is one such very nice proof, perhaps
even more extraordinary because of how elementary it is.

#align(center)[#image("graphics/sin sum.png", width: 35%)]

Now, lets move to the actual problem. This was also covered in the lecture notes
but, for completion, the derivative of $sin$ can be derived from first
principles as follows.

~

$ lim_(h to 0) (sin(x + h) - sin(x))/h &= lim_(h to 0) (sin x cos h+ sin h cos x - sin x)/(h) \ &= lim_(h arrow 0) (sin x dot.c (cos h - 1)/h + cos x dot (sin h)/h) \ &= sin x dot underbrace(lim_(h arrow 0) (cos h - 1)/h, 0) + cos x dot underbrace(lim_(h arrow 0) (sin h)/h, 1) \ &= cos x. $

#align(right)[$square$]

== Prove $d/(d x) cos x = - sin x$.
~

$ d/(d x) cos x =^((1)) d/(d x) sin (x + pi/2) =^((2)) cos(x + pi/2) =^((3)) -sin x. $

Lets focus on equalities $(1)$ and $(3)$ first. They follow from the identities $ cos x = sin (x + pi /2) #h(20pt) sin x = - cos(x + pi/2) $

They may be verified using the angle sum formulae $ sin (a + b) = sin a cos b + cos a sin b, cos (a + b) = cos a cos b - sin a sin b$.
Alternatively, one may derive them directly by considering the unit circle and
the following constructions.

#align(center)[#image("graphics/trig identity.gif", width: 35%)]

Now, we move to justifying equality $(2)$. Since $sin(x + pi/2)$ is a
composition of the functions $x arrow.bar sin x$ and $x arrow.bar x + pi/2$, we
have to justify this step a bit more than just citing our previous result that $d/(d x) sin x = cos x$.
Of course, since a composition is involved, we can just use the chain rule here!

However, since we hadn't talked about the chain rule explicitly during this
week, I want to highlight an alternative way of approaching $(2)$. First note
that, $sin (x + pi/2)$ is just $sin x$ shifted to the left by $pi/2$ units.
#align(
  center,
)[
  #canvas(length: 1cm, {
    plot.plot(
      size: (8, 6),
      x-tick-step: none,
      x-ticks: ((-2 * calc.pi, $-2 pi$), (0, $0$), (2 * calc.pi, $2 pi$)),
      y-tick-step: 1,
      {
        plot.add(
          style: (stroke: blue, fill: rgb(0, 0, 200, 75)),
          domain: (-2 * calc.pi, 2 * calc.pi),
          calc.sin,
          label: $sin x$,
        )
        plot.add(
          style: (stroke: red, fill: rgb(0, 0, 200, 75)),
          domain: (-2 * calc.pi, 2 * calc.pi),
          x => calc.sin(x + calc.pi / 2),
          label: $sin (x + pi slash 2) $,
        )
      },
    )
  })
]

Intuitively, shifting doesn't change the shape of the graph itself. So, we may
expect the derivative of $sin(x + pi/2)$ to perhaps just be the derivative of $sin x$ shifted
by the same amount i.e. $cos(x + pi/2)$. This intuition can be formalized from
first principles as follows:

Assume $f$ is a differentiable real-valued function. Let $g(x) = f(x + t)$ for
some fixed $t in RR$. Then,

$ d/(d x) g(x) &= lim_(h arrow 0) (g(x + h) - g(x))/h \ &= lim_(h arrow 0) (f(x + t + h) - f(x + t))/h $
Let $y = x + t$. $   &= lim_(h arrow 0) (f(y + h) - f(y))/h \ &= f'(y) = f'(x + t). $

#align(right)[$square$]

= Derivative of $e^x$

== Show that $lim_(h to 0) (e^h - 1)/h = lim_(u to 0) u/(ln(u + 1))$ using the substitution $u = e^h - 1$.
~

Note that substituting $u = e^h - 1$ to the second expression gives us the first
expression back.

$ u/(ln(u + 1)) = (e^(h) - 1)/(ln(e^h)) = (e^h - 1)/h $

Furthermore, note that as $h -> 0$, $u -> 0$ too. Thus,

$ lim_(h to 0) (e^h - 1)/h = lim_(u -> 0) u/(ln(u + 1)). $

#align(right)[$square$]

== Equate the previous limit with $lim_(u to 0) 1/(ln(u + 1)^(1/u)).$
~

Dividing the numerator and denominator by $u$, we get

$ u/(ln(u + 1)) = (1/u dot u)/(1/u dot ln(u + 1)) = 1/(ln(u + 1)^(1/u)) $

#align(right)[$square$]

== Show that the previous limit is equal to $1$.
~

Since $ln$ is continuous, we have

$ lim_(u -> 0) ln(u + 1)^(1/u) = ln(lim_(u to 0) (u + 1)^(1/u)) = ln e = 1. $

Thus,

$ lim_(u -> 0) 1/(ln(u + 1)) = 1/(lim_(u -> 0) ln(u + 1)) = 1/1 = 1. $

#align(right)[$square$]

== Show that $d/(d x) e^x = e^x$.
~

Note that the previous parts have shown
$ lim_(h -> 0) (e^h - 1)/h = 1. $

We start from the definition of the derivative.

$ d/(d x) e^x = lim_(h -> 0) (e^(x + h) - e^x)/h = e^x lim_(h to 0) (e^h - 1)/h = e^x. $

#align(right)[$square$]

= Pascal's Triangle

There are many ways to prove the required result, which is also known as _the Binomial Theorem_.
I will give two proofs here, one is a _combinatorial proof_ #h(3pt)#footnote[Combinatorial proofs are often quite elegant. For an in-depth exploration, I
  recommend reading the book _Proofs that Really Count_ by Benjamin & Quinn.] and
the other is _by induction_. I expect the second technique to be new to most of
you-- so, I wouldn't worry if not all of it makes sense in your first read
through!

== Combinatorial Proof

Recall that $binom(n, k)$ counts the number of ways of selecting $k$ objects
from $n$ objects.

We want to know what the coefficient of $x^k h^(n - k)$ (for $k in {0, 1, dots, n}$)
will be in the expansion of $ (x + h)^n = underbrace((x + h) (x + h) dots (x + h), n "times"). $

We note that each $x^k h^(n - k)$ term arises by selecting an $x$ term from $k$ of
the $(x + y)$ factors and a $y$ term from all the remaining factors. This
essentially amounts to selecting $k$ items from $n$ items. Thus, there are $binom(n, k)$ many $x^k h^(n - k)$ terms.
Summing over all the possible values of $k$, we obtain the formula we desired

$ (x + h)^n = sum_(k = 0)^n binom(n, k) x^k h^(n - k). $

#align(right)[$square$]

== Proof by Induction

Let $P(n)$ denote the statement that the following equality holds

#numbered_eq($ (x + h)^n = sum_(k = 0)^n binom(n, k) x^k h^(n - k). $)

#remark[For example, $P(2)$ corresponds to the statement that $ (x + h)^2 = x^2 + 2 x h + h^2. $]

*Base Case.* Now, we start by showing that $P(1)$ is true. We simplify both the
left and right hand side of $(1)$ with $n = 1$ to obtain

$   &(x + h)^1 = x + h \ &sum_(k = 0)^1 binom(1, k) x^k h^(1 - k) = binom(1, 0) x^0 h^1 + binom(1, 1) x^1 h^0 = x + h. $

Thus, $P(1)$ clearly holds.

*Induction.* Now, we show that if $P(n)$ holds for some $n in NN$ then $P(n + 1)$ is
also true. So, assume $P(n)$ is true for some $n$. That is to say, the following
equality is true,
$ (x + h)^n = sum_(k = 0)^n binom(n, k) x^k h^(n - k). $

Note then that
$ (x + h)^(n + 1) &= (x + h)(x + h)^(n) \ &= (x + h)sum_(k = 0)^n binom(n, k) x^k h^(n - k') \ &= sum_(k = 0)^n binom(n, k) x^(k + 1) h^(n - k) + sum_(k = 0)^n binom(n, k) x^k h^(n - k + 1) $

Let $k' = k + 1$. Then,

$   &= sum_(k' = 1)^n binom(n, k - 1) x^(k') h^(n + 1 - k') + sum_(k =0)^n binom(n, k) x^k h^(n + 1 - k) \ &= h^(n + 1) + sum_(k = 1)^n [binom(n, k - 1) + binom(n, k)] x^k h^(n + 1 - k) $
Then, we use the identity $binom(n, k - 1) + binom(n, k) = binom(n, k + 1)$
(this itself can be proven using a combinatorial proof or induction-- I leave
verifying this to you!) $ \ &= h^(n + 1) + sum_(k = 1)^n binom(n, k + 1) x^k h^(n + 1 - k) \ &= sum_(k = 0)^n binom(n, k + 1) x^k h^(n + 1 - k). $

Thus, $P(n + 1)$ is also true.

Thus, by induction, we have shown that $P(n)$ is true for all $n in NN$. (The
idea is that the base case shows that $P(1)$ is true and the second step lets us
show that $P(1) => P(2) => P(3) => dots.h "and so on"$)

#remark[By $NN$, I am denoting the set of _natural numbers_. These are all the positive
  integers.]

#align(right)[$square$]
