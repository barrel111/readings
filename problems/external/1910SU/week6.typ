#import "@local/preamble:0.1.0": *
#import "@preview/cetz:0.2.2": canvas, plot, draw

#show: project.with(
  course: "1910SU",
  sem: "Summer",
  title: "Group Discussion: Computing Limits",
  subtitle: "Solutions",
  contents: false,
)

= Compute the following limits.

\

== $lim_(x->oo) (x^2 + 1)/(2 + cos(4x))$

Note that as $2 + cos(4x) <= 3$,

$ (x^2 + 1)/3 <= (x^2 + 1)/(2 + cos(4x)). $

The lower bound tends to infinity as $x -> infinity$. Hence, $lim_(x -> infinity) (x^2 + 1)/(2 + cos(4x)) = oo$ by the Squeeze Theorem.


== $lim_(x -> oo) (2x + sin(x))/(x + 4)$

Consider, 

$ lim_(x -> infinity) (2x + sin(x))/(x + 4) = lim_(x -> infinity) (2 + (sin x)/x)/(1 + 4/x) = 2. $

We justify $lim_(x -> infinity) sin(x)/x = 0$ by using the Squeeze Theorem again, nothing that

$ -1/x <= sin(x)/x <= 1/x $

and both $-1/x$ and $1/x$ tend to $0$ as $x -> infinity$.

== $lim_(x -> pi) (sin(x))/(x - pi)$

We can use L'Höpital's rule as this is a $0/0$ indeterminate. So, 

$ lim_(x -> pi) (sin x)/(x - pi) = lim_(x -> pi) cos x = -1. $

== $lim_(x -> oo) (3x)/(x^2 - 1)$

We can do this by using L'Höpital's rule or just dividing the numerator and denominator by $x^2$ as follows:

$ lim_(x -> infinity) (3x)/(x^2 - 1) = lim_(x -> infinity) (3/x)/(1 - 1/x^2) = 0/1 = 0. $

= More Limits

== $lim_(x-> 0^+, 1^-, 1^+) 1/(x ln x)$

We consider each limit seperately. First, we just apply L'Höpital's rule to evaluate the limit for $x -> 0^+$. 

$ lim_(x -> 0^+) 1/(x ln x) = lim_(x -> 0^+) (1\/x)/(ln x) = lim_(x -> 0^+) (-1/x^2)/(1/x) = lim_(x -> 0^+) -1/x=-oo  $.

Next, we consider the limit as $x -> 1^-$. We start by noting that 
$ lim_(x -> 1^-) 1/(ln x) = -oo $

as $ln x -> 0$ acquiring just negative values as $x -> 0$. Thus, 

$ lim_(x -> 1^-) 1/(x ln x) = lim_(x -> 1^-) 1/x lim_(x -> 1^-) 1/(ln x) = -oo. $

Finally, consider the limit as $x -> 1^-$. Again, as $ln x -> 0$ acquiring just positive values as $x -> 0$. Then, 

$ lim_(x -> 1^+) 1/(ln x) = oo. $

Thus, 

$ lim_(x -> 1^+) 1/(x ln x) = lim_(x -> 1^+) 1/x lim_(x->1^+) 1/(ln x) = oo. $

A slight remark, we can justify $lim_(x -> 1^+) 1/(ln x) = infinity$ and $lim_(x -> 1^-) 1/(ln x) = -oo$ by using the Squeeze Theorem on the fact that 

$ ln x <= x - 1 => 1/(x - 1) <= 1/(ln x). $

== $lim_(x->0) (x^(40) + 2 ln x)/(sqrt(x^(90) + 1) + x^(20))$

$ lim_(x->0) (x^(40) + 2 ln x)/(sqrt(x^(90) + 1) + x^(20)) =  (lim_(x -> 0) x^(40) + 2 ln x)/(lim_(x -> 0) sqrt(x^(90) + 1) + x^(20)) = lim_(x -> 0) x^40 + 2 ln x = -oo. $

== $lim_(x->oo) (4e^x - 1)/(4 - e^x)$

Note, 

$ lim_(x -> oo) (4e^x - 1)/(4 - e^x) = lim_(x -> oo) (4 - 1/(e^x))/(4/(e^x) - 1) = (4 - lim_(x -> oo)1/e^x)/(-1 + lim_(x -> oo) 4/e^x) = -4. $

== $lim_(x->-1) (ln (x + 2))/(e^(-x) - e)$

We use L'Höpital's rule

$ lim_(x->-1) (ln (x + 2))/(e^(-x) - e) = lim_(x -> -1) (1/(x + 2))/(-e^(-x)) = -1/e. $



