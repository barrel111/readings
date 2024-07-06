#import "@local/preamble:0.1.0": *
#import "@preview/cetz:0.2.2": canvas, plot

#show: project.with(
  course: "1910SU",
  sem: "Summer",
  title: "Group Discussion: Differentiation II",
  subtitle: "Solutions",
  contents: false,
)

= Quotient Rule

== $d/(d x) tan x$

$ d/(d x) tan(x) &= d/(d x) ((sin x)/(cos x)) \ &= sin x (d/(d x) 1/(cos x)) + 1/(cos x) (d/(d x) sin x) \ &= sin x (-1/(cos^2 x) dot (- sin x)) + (cos x)/(cos x) \ &= (sin^2 x)/(cos^2 x) + 1 \ &= 1/(cos^2 x) = sec^2 x. $

== $d/(d x) sec x$

$ d/(d x) sec x &= d/(d x) (1/(cos x)) \ &= -1/(cos^2 x) dot (- sin (x)) \ &= (sin x)/(cos^2 x) \ &= tan x sec x. $

== $d/(d x) csc x$

$ d/(d x) csc x &= d/(d x) (1/(sin x)) \ &= -(cos x)/(sin^2 x) \ &= - cot x csc x. $

= Chain Rule

== $d/(d x) arcsin x$
~

By definition,

$ sin(arcsin x) = x. $

Differentiating both sides,

$ d/(d x) sin(arcsin x) = d/(d x) x. $

To be a bit more explicit about the use of the Chain Rule, suppose $y = arcsin x$.
Then,

$ implies (d/(d y) sin y) (d/(d x) arcsin x) = 1 \
implies d/(d x) arcsin x = 1/(cos y) = 1/(cos(arcsin x)) = 1/(sqrt(1 - x^2)). $

How do we show that $cos(arcsin x) = sqrt(1 - x^2)$ ? There are two methods
(though, maybe a better descriptor would be that they are two different
perspectives for the same underlying proof):

=== Algebraically showing $cos(arcsin x) = sqrt(1 - x^2)$

Recall that $ sin^2 theta + cos^2 theta = 1. $
So, $ cos theta = plus.minus sqrt(1 - (sin theta)^2). $
In our case, $theta = arcsin x$. The range of $arcsin x$ is $theta in [- pi/2, pi/2]$.
In this range, $cos$ is always positive, so it suffices to take just the
positive square root to obtain

$ cos(arcsin x) = sqrt(1 - sin^2(arcsin x)) = sqrt(1 - x^2). $

=== Geometrically showing $cos(arcsin x) = sqrt(1 - x^2)$

Let $y = arcsin x$. Then note that $y$ represents the angle in a right-angled
triangle with unit hypotenuse and perpendicular with side length $sin(y) = x$.
Pictorally,

#align(center)[#image("graphics/cos arcsin.png", width: 35%)]

Note that $cos y$ then corresponds to the adjacent side whose length can be
obtained by using Pythagoras's Theorem-- $ cos y &= sqrt(1 - sin^2 y) \ &= sqrt(1 - x^2) \ implies cos (arcsin x) &= sqrt(1 - x^2.) $

== $d/(d x) arctan x$
~

By definition,

$ tan(arctan x) = x. $

Differentiating both sides,

$ d/(d x) tan(arctan x) = d/(d x) x. $

To be a bit more explicit about the use of the Chain Rule, suppose $y = arccos x$.
Then,

$ implies (d/(d y) tan y) (d/(d x) arctan x) = 1 \
implies d/(d x) arctan x = 1/(sec^2 y) = 1/(sec^2 arctan x) = 1/(1 + x^2). $

How do we show that $sec^2(arctan x) = 1 + x^2$ ? Again, there are two methods:

=== Algebraically showing $sec^2(arctan x) = 1 + x^2$.

Note that

$ sec^2 theta = tan^2 theta + 1. $

In our case, $theta = arctan x$. So, $ sec^2 arctan x = x^2 + 1. $

=== Geometrically showing $sec^2(arctan x) = 1 + x^2$.

Consider a right-angled triangle with angle $theta$ such that the perpendicular
side has length $x$ and adjacent side has length $1$. Then $theta = arctan x$.
Pictorally,

#align(center)[#image("graphics/sec^2 arctan.png", width: 30%)]

So, the hypotenuse has length $sqrt(x^2 + 1)$. Then,

$ sec^2 theta = 1/(cos^2 theta) = (sqrt(1 + x^2))^2 = 1 + x^2 \ sec^2 arctan x = 1 + x^2. $
