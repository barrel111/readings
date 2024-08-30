#import "@local/preamble:0.1.0": *
#import "@preview/cetz:0.2.2": canvas, plot, draw

#show: project.with(
  course: "1910SU",
  sem: "Summer",
  title: "Group Discussion: L'Hôpital's Rule",
  subtitle: "Solutions",
  contents: false,
)

= Limits with Exponents.

\

== Compute the limit $lim_(x -> oo) (1 + 2/x)^x $

First we compute the following. 

$ lim_(x -> infinity) ln ((1 + 2/x)^x) = lim_(x -> infinity) x ln (1 + 2/x) $

This is an indeterminate form of the type $infinity dot 0$. We write the expression above to resemble the form $0 / 0$ so that we can use L'Hôpital's rule. 

$ = lim_(x -> infinity) (ln(1 + 2/x)/(1/x)) $

Taking the derivatives of the numerator and denominator, we obtain

$ = lim_(x -> infinity) -x^2 dot 1/(1 + 2/x) dot (-2)/x^2 \ 
= lim_(x -> oo) 2/(1 + 2/x) = 2. $

Thus, 

$ lim_(x -> oo) (1 + 2/x)^x =e^(lim_(x -> infinity) x ln (1 + 2/x)) = e^2. $

== Compute the limit $lim_(x -> oo) (1 + 1/x^2)^x $

First we compute the following. 

$ lim_(x -> infinity) ln((1 + 1/x^2)^x) = lim_(x -> infinity) x ln(1 + 1/x^2 ) $

This is again an indeterminate form of the time $infinity dot 0$. We write the expression above to resemble the form $0/0$ so that we can use L'Hôpital's rule. 

$ = lim_(x -> oo) ((ln (1 + 1/x^2))/(1/x)) $

Taking the derivatives of the numerator and denominator, we obtain

$ = lim_(x -> oo) -x^2 dot 1/(1 + 1/x^2) dot (-2)/x^3 \ = lim_(x -> oo) 2/(x^3 + x) = 0. $

Thus, 

$ lim_(x -> infinity) (1 + 1/x^2)^x = e^(lim_(x -> oo) x ln (1 + 1/x^2)) = e^0 = 1. $ 

== Compute the limit $lim_(x -> 0^+) x^(sin x) $

First we compute the following. 

$ lim_(x arrow.b 0^+) sin x ln x $

This is an indeterminate form of the type $0 dot (- infinity)$. We rewrite this to resemble $oo/oo$ so that we can use L'Hôpital's rule. 

$ = lim_(x arrow.b 0^+) (ln x)/(csc x) $ 

Taking the derivative of the numerator and denominator gives us,

$ = lim_(x arrow.b 0^+) (1\/x)/(-cot x csc x) \ = lim_(x arrow.b 0^+) -(sin^2 x)/(x cos x) $

This is an indeterminate form of the type $0/0$. We apply L'Hopital's rule again. 

$ = lim_(x arrow.b 0^+) - (2 sin x dot cos x)/(cos x + x sin x) = 0/1 = 0. $

Thus, we have

$ lim_(x -> 0^+) x^(sin x) = e^(lim_(x -> 0^+) sin x ln x) = e^0 = 1. $

= (Non) Indeterminate Form $0^infinity$.

\

As $lim_(x -> a) g(x) = infinity$ and $lim_(x -> a) ln g(x) = lim_(x -> 0^+) ln x = -infinity$ . So, 

$ lim_(x -> a) g(x) ln f(x) = -infinity.  $

#remark[Note that, technically, we need to assume that $f(x)$ approaches $0$ from above as otherwise $ln f$ will be undefined.]

Thus, $lim_(x -> a) f(x)^(g(x)) = lim_(x -> a) e^(g(x) ln f(x)) = lim_(y -> -infinity) e^y = 0.$
