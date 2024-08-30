#import "@local/preamble:0.1.0": *
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#show: project.with(
  course: "ORIE6300",
  sem: "FA24",
  title: "Mathematical Programming I",
  subtitle: "Notes",
  authors: (
    "Shaleen Baral",
  ),
)

= Introduction: LP and Duality

== Why take this class?  

Mathematical programming is a very well-studied field. Many optimization problems can be recast as or at least approximated well by mathematical programs. Doing so not only allows us to use algorithms but also use the theory of mathematical programming to uncover structural insights. The course will roughly cover

+ Linear Programming
  - Geometry
  - Duality Theory
  - Algorithms

+ Convex Programming

+ First-Order Methods

== Logistics 

Weekly assignments due every Thursday night (11:59pm). Grading scheme is as follows:
- $40%$ HW assignments ($~10$)
- $20%$ in-person final
- $15%$ take-home midterm
- $15%$ take-home final
- $10%$ participation/scribing

== Linear Programming

Let $x in RR^n$ denote the _decision variables_. We are looking to solve _for_ these decision variables. Let $c in RR^n$ be fixed. Then, $c^T x$ is our _objective function_. We also specify a _constraint_ $A x <= b$ on our decision variables where $A in RR^(m times n), b in RR^m$ are both fixed. The inequality is read element wise. A linear program optimizes the objective function subject to these given constraints,

$ max c^T x #h(15pt) "s.t." #h(15pt) A x <= b, x in RR^n. $

We say $x in RR^n$ is a _feasible solution_ if $A x <= b$.

We define the _feasible region_, $Q = {x in RR^n bar A x <= b}$. 

A feasible solution $x in RR^n$ is _optimal_ if its _value_, $c^T x$, is at least as large as the value of any other feasible solution. 

$ min b^T y #h(15pt) "s.t." #h(15pt) A^T y = c, y in RR^m, y >= 0. $

#prop("Weak Duality")[If $x in RR^n$ feasible in primal and $y in RR^m$ feasible in dual then $c^T x <= b^T y$.]

#proof[ We know that $A^T y = c$. Then, $ c^T x = y^T A x <= y^T b. $ The last inequality is justified by the fact that $y >= 0$. 

]

= Strong Duality
~

Recall the primal and dual programs from the previous lecture

$ "PRIMAL:" #h(10pt) &max c^T x #h(20pt) "s.t." #h(20pt) A x <= b. \ "DUAL:"#h(10pt) &min b^T y #h(20pt) "s.t." #h(20pt) A^T y = c, y>= 0 $

First, we interpret our linear program in a "physical" sense. We make three observations, 

+ if we place ball at an optimal feasible solution, it doesn't accelerate
+ if the ball doesn't accelerate, the forces acting on it sum to $0$
+ "wall" $a_i x_i <= b_i$ may exert a force on ball along $-a_i^T$; if $a_i x < b_i$, then this force is $0$.

#lemma[If $x^star$ is an optimal feasible solution to the primal, then there exists $y in RR^n$, $y >= 0$, $c + sum_(i = 1)^m -y_i a_i^T = 0$, and $y_i = 0$ whenever $a_i x^star < b_i$.]

#prop("strict duality")[If $x^star$ is an optimal feasible solution to the primal, there exists an optimal feasible solution of the dual, $y^star$, such that $c^T x^star = b^T y^star$.]
#proof[Assuming $c^T x^star = b^T y^star$, we are guaranteed the optimality of $y^star$ by weak duality. 

Now, we actually show that such a feasibly solution must exist. Fix $x^star$, let $y^star$ be the dual solution given by the prior lemma. Then $y^star$ is dual feasible as 

$ c^T x^star = (A^T y^star)^T x^star = y^star^T A x ^star <= y^star^T b = b^T y^star. $

The middle term can be expanded to incorporate how tight the inequality is. $ y^star^T A x^star = y^star (b + A x^star - b) = y^star b + y^star^T (A x^star - b) $

Note however that, $ y^star^T (A x^star - b) = sum_(i = 1)^m y_i (a_i x^star - b_i) $

If $(a_i x^star - b_i)$ is non-zero for some $i in [m]$, then by the prior lemma $y_i = 0$.  Thus, this term must be zero.

$ c^T x^star = y^star^T A x^star = y^star b $]

Now, we focus on taking the dual of the dual. First, there are two forms in which we can specify a linear program

$ "basic form:" #h(10pt) &max c^T x #h(20pt) "s.t." #h(20pt) A x <= b. \ "standard form:"#h(10pt) &min b^T y #h(20pt) "s.t." #h(20pt) A^T y = c, y>= 0  $

There are two strategies

+ transform LPs from standard form into basic form, then take dual. \ Let $overline(c) = b, overline(A) = A^T, overline(b) = c$. Then, the LP in standard form given above can be represented in basic form as follows  $ max (-overline(c))^T x #h(10pt) "such that" #h(10pt) -overline(A) x &<= - overline(b) \ overline(A) x &<= overline(b) \ -I x &<= 0 $ Now, we take the dual of this program. We have $ min #h(5pt) mat(-overline(b), overline(b), 0, dots.c, 0) #h(2pt) y #h(10pt) "such that" #h(10pt) mat(-overline(A)^T, overline(A)^T, -I) #h(2pt) y = -overline(c) $ For convenience, let $y = mat(s; t; w)$ such that $ mat(-overline(A)^T, overline(A)^T, -I) #h(2pt) y = -overline(A)^T s + overline(A)^T t - w. $ This lets us rewrite our program as $ max #h(2pt) overline(b)^T (s - t) #h(10pt) "such that" #h(10pt) overline(A)^T (s - t) + w &= overline(c) \ s,t,w &>= 0. $ Making the substitution $z = s - t$, we simplify this expression. $ max #h(2pt) overline(b)^T z #h(10pt) "such that" #h(10pt) overline(A)^T z + w &= overline(c) \ w &>= 0. $ Finally the requirement that $w >= 0$ is equivalent to simply saying $overline(A)^T z <= overline(c)$. Thus, we have recovered the following program $ max overline(b)^T z #h(10pt) "such that" #h(10pt) overline(A)^T z <= overline(c). $

+ directly rederive dual for LPs in standard form.

