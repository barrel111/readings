#import "@local/preamble:0.1.0": *
#import "@preview/cetz:0.2.2": canvas, plot

#show: project.with(
  course: "1910SU",
  sem: "Summer",
  title: "Group Discussion: Integration",
  subtitle: "Solutions",
  contents: false,
)

Recall the statement of the _First Fundamental Theorem of Calculus_, 

#prop[Let $f$ be a continuous real-valued function defined on a closed interval $[a, b]$. Let $F$ be the function defined, for all $x in [a, b]$, by $ F(x) = integral_a^x f(t) d t. $ Then $F$ is uniformly continuous on $[a, b]$ and differentiable on the open interval $(a, b)$ and $ F'(x) = f(x) $ for all $x in (a, b)$. That is, $F$ is an antiderivative of $f$ on $(a, b)$. ]

= First Fundamental Theorem of Calculus

== $a = 0, f(x) = x^2$

$ A(x) &= integral_0^x t^2 d t \
       &= lr((t^3)/3|)_a^x \
       &= (x^3)/3 $ 
$ d/(d x) A(x) = x^2 $ 

== $a = 2, f(x) = 1/x$

$ A(x) &= integral_2^x 1/x d t \ 
       &= lr(ln x |)_2^x \
       &= ln x - ln 2 $ 
$ d/(d x) A(x) = 1/x $ 

== $a = pi, f(x) = cos x$

$ A(x) &= integral_pi^x cos x d t \
       &= lr(sin x|)_pi^x \ &= sin x - sin pi \ &= sin x $ 

= Chain Rule

== $A(x) = integral_0^x t^3 d t$

By the First Fundamental Theorem of Calculus,  

$ d/(d x) A(x) &= x^3. $ 

== $A(x^2) = integral_0^x^2 t^3 d t$

By the Chain Rule,

$ d/(d x) A(x^2) &= A'(x^2) d/(d x) x^2 = x^6 dot 2x = 2x^7. $ 

== $B(x) = integral_x^0 t^3 d t$

By the First Fundamental Theorem of Calculus,

$ d/(d x) B(x) &= d/(d x) integral_x^0 t^3 d t \
               &= -d/(d x) integral_0^x t^3 d t \ 
               &= -x^3. $

== $B(x^2) = integral_(x^2)^0 t^3 d t$

By the Chain Rule, 

$ d/(d x) B(x^2) = B'(x^2) d/(d x) x^2 = -x^6 dot 2x = -2x^7. $

== $d/(d x) integral_0^(x^2) f(t) d t$

Define 

$ A(x) = integral_0^x f(t) d t. $ 

Then, by the Chain Rule,

$ d/(d x) A(x^2) = A'(x^2) d/(d x) x^2 = 2 f(x^2) x. $ 

== $d/(d x) integral_(p(x))^(q(x)) f(t) d t$

This is essentially the same idea as the previous barts, albeit generalized slightly. Consider first the decomposition,  

$ integral_(p(x))^(q(x)) f(t) d t &= integral_0^(q(x)) f(t) d t + integral^0_(p(x)) f(t) d t \ &= integral_0^(q(x)) f(t) d t - integral_0^(p(x)) f(t) d t $

Then, 

$ d/(d x) integral_(p(x))^(q(x)) f(t) d t &= d/(d x) integral_0^(q(x)) f(t) d t - d/(d x) integral_0^(p(x)) f(t) d t \
&= f(q(x)) q'(x) - f(p(x)) p'(x). $ 
