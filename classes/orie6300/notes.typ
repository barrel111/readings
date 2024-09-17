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

= Polyhedron

== Polyhedrons
#definition[A set $S subset.eq RR^n$ such that $S = {x in RR^n bar A x <= b}$ for some $A in RR^(m times n), b in RR^m$ is called a _polehdron_.]

#definition[A set $S subset.eq RR^n$ is _convex_ if, for all $x, y in S$ and all $0 <= theta <= 1$, we have $theta x + (1 - theta) x in S$.]

#lemma[Any polyhedron $P$ is convex.]
#proof[ 
  Suppose $P = {x bar A x <= b}$ and let $x , y in P$. Then for $theta in [0, 1]$, consider $ A [theta x + (1 - theta) x] = theta A x + (1 - theta) A x <= theta b + (1 - theta) b = b. $ Thus, $theta x + (1 - theta) x in P$. \ ]

== Vertices

For the remaining definitions, let $P = {x in RR^n bar A x <= b}$ be a polyhedron.

#definition[A point $x in P$ is a _vertex_ if $exists c in RR^n$ such that $c^T x > c^T y, #h(5pt) forall y in P - x$.]

#definition[A point $x in P$ is an _extreme point_ if there aren't any $z in P - x, theta in [0, 1]$ such that $x = theta y + (1 - theta) z$.]

#definition[Consider $x in P$. Then we call $a_i x <= b_i$ a _binding constraint_ if $a_i x = b$. Otherwise, we call it a _non-binding constraint_. ]

#definition[For any $x in P$, we may define the following matrices $ A_= = "the submatrix of " A "containing the rows of binding constraints," \ b_= =  "the subvector of " b "for the binding rows," \ A_< = "the submatrix of " A "containing the rows of non-binding constraints," \ b_< = "the subvector of " b "for the non-binding rows." $]

#definition[A point $x in P$ is a basic feasible solution (BFS) if $"rank"(A_=) = n$.]

#prop[Let $P = {x in RR^n bar A x <= b}$. The following are equivalient: 
+ $x$ is a vertex,
+ $x$ is an extreme point,
+ $x$ is a BFS.]

#proof[
  - _(i) $=>$ (ii)_

  We prove this by contradiction. Suppose _(ii)_ doesn't hold. 

  We have $c in RR^n$ such that $c^T x > c^T y, forall y in P - x$. Let $y, z in P - x$ such that $x = theta y + (1 - theta) z$ for some $theta in [0, 1]$.  Then consider, 
  $ c^T x = c^T (theta y + (1 - theta) z) = theta c^T y + (1 - theta) c^T z < theta c^T x + (1 - theta) c^T x = c^T x $

  Thus, we have a contradiction.

  - _(ii) $=>$ (iii)_

  We prove this by contrapositive, _$not$ (iii) $=>$ $not$ (ii)_. 

  We know that $"rank"(A_=) < n$. Then $exists y != 0 in RR^n$ such that $A_= y = 0$. Note that for any $epsilon > 0$ we can conclude that $x plus.minus epsilon y$ satisfies the binding constraints as verified below $ A_(=) (x plus.minus epsilon y) = A_=x plus.minus epsilon A y = A_= x = b. $

  Now, we show that for an appropriate choice of $epsilon > 0$, these vectors also satisfy the non-binding constraints.
  Note that $A_< x < b_<$ and hence, $b_< - A_<x > 0$. Thus, for small enough $epsilon > 0$ we have $ plus.minus epsilon A_< y < b_< - A_< x. $ 

  This immediately gives us what we want, $ A_<(x plus.minus epsilon y) = A_< x + epsilon A_< y < A_< x + b_< - A_< x < b_<. $

  So, $x$ can be written as a convex combination of $x plus.minus epsilon y$.

  - _(iii) $=>$ (i)_

  Define $I = {1 <= i <= m bar a_i x = b_i}$. Then, let $c = sum_(i in I) a_i^T$. Then, $ c^T x = (sum_(i in I) a_i ) x = sum_(i in I) a_i x = sum_(i in I) b_i. $

  Let $y in P$. Then, $ c^T y = sum_(i in I) a_i y <= sum_(i in I) b.  $

  If this inequality is tight, that is $c^T y = sum_(i in I) b$ then, $a_i y = b_i$. As $"rank"(A_=) = n$, $A_= y = b$ has a unique solution, $y = x$.

]

= More Polyhedrons

== Existence of Vertices
#definition[A polyhedron $P$ contains a line if $exists #h(2pt) x in P, y !=0 in RR^n$ such that ${x + lambda y bar y in RR} subset.eq P$. Otherwise, $P$ is _pointed_.]

#prop[Let $P = {x in RR^n bar A x <= b}$ be a non-empty polyhedron. The following three are equivalent
+ $P$ has at least one vertex 
+ $P$ is pointed 
+ $"rank"(A) = n$]
#proof[
  - _(ii) $=>$ (i)_
  Consider any point $x in P$. If $"rank"(A_=) = n$, then $x$ is a vertex and we are done. Otherwise, we have $"rank"(A_=) < b$. Then $exists y != 0 in RR^n$ such that $A_= y = 0$. We know that the line ${x + lambda y bar lambda in RR}$ isn't entirely contained in $P$ as $P$ is pointed. That is to say, $exists lambda^star$ and $1 <= j  <= m$ such that $a_j x < b_j$ however $a_j (x + lambda^star y) = b_j$. Let $x' = x + lambda^star y$. Equivalently, we have $x' in P$. Then, 
  $ A_= x' = A (x + lambda^star y) = underbrace(A_= x, b_=) + lambda^star A_= y = b_= $

  $A'_=$ is a superset of the rows, then $exists M in RR$ of $A_=$. 

  If $a$ is a row of $A_=$, $a y = 0$. Note that $a_j y != 0$. That is $a_j$ is not a linear combination of the rows of $A_=$. Thus, $"rank"(A_=') > "rank"(A_=)$. 

  - _(i) $=>$ (iii)_
  Suppose $x in P$ is a vertex. Then $ n = "rank"(A_=) <= "rank"(A) <= n. $ 
  Thus, $"rank"(A) = n$.

  - _(iii) $=>$ (ii)_
  Assume $"rank"(A) = n$. For the sake of contradiction, suppose $P$ contains a line ${x + lambda y bar lambda in RR} subset.eq P$ for $y != 0$. Let $1 <= j <= m$. Then we know that $forall lambda in RR$, $ a_j (x + lambda y) <= b_j$ holds. Taking the limit as $lambda -> "sgn"(a_j y) dot oo$, we get that $a_j (x + lambda y) -> oo$ if $a_j y != 0$. Thus, it must be the case that $a_j y = 0$. By injectivity of $A$, we note that $y = 0$. Thus, it must be the case that $P$ is pointed. 

]

#definition[A set $X subset.eq B$ where $B$ is some normed space is called bounded whenever $exists M in RR$, such that  $norm(x) <= M$ for all $x in P$.]

#corollary[If $P$ is nonempty and bounded then $P$ has at least one vertex.]

#corollary[The feasible region of an LP in standard form, if it is nonempty, has at least one vertex.]

#prop[Given an LP maximizes $c^T x$ over $x in P$, $P$ is nonempty, pointed polyhedron. If there is an optimal feasible solution $x^star$, there is an optimal feasible solution that is a vertex of $P$.]
#proof[Define $Q = P sect {x in RR^n bar c^T x = c^T x^star}$. $Q$ is a nonempty polyhedron as $x^star in Q$. Note that $Q$ is pointed becaue $Q subset.eq P$ is pointed. By the prior proposition, $exists$ vertex $v$ of $Q$. Note that $v$ is feasible and $c^T v = c^T x^star$, so $v$ is optimal. Suppose that $v$ is not an extreme point of $P$, i.e. $y, z in P - {v}, 0 <= theta <= 1$ such that $v = theta y + (1 - theta) z$. Then, $ c^T x^star = c^T v = c^T (theta y) + (1 - theta) z = theta c^T y + (1 - theta) c^T z <= c^T x^star $ Note that $c^T y = c^T z = c^T x^star$ as otherwise $c^T x^star < c^T x^star$, a clear contradiction. Note that as $y, z in Q - {v}$, this would imply that $v$ is not an extreme point of $Q$.

]

== Convex Hull

#definition[Given $v_1, dots, v_k in RR^n$, A _convex combination_ is any $sum_(i = 1)^k lambda_i v_i$ where $lambda_i >= 0$ for all $i in [k]$ and $sum_(i = 1)^k lambda_i = 1$.]

#definition[Given $v_1, dots, v_k in RR^n$, the _convex hull_, $"conv"({v_1, dots, v_k})$ is the set of all their convex combinations.]

#definition[Any $S subset.eq RR^n$ that can be written as $S = "conv"({v_1, dots, v_k})$ for some $v_1, dots, v_k$ is called a _polytope_.]

#prop("Carathéodory's Theorem")[Given $v_1, dots, v_k in RR^n$ and $y in RR^n$, such that $y in "conv"({v_1, dots, v_k})$. Then, there exists $S subset.eq {v_1, dots, v_k}, abs(S) <= n + 1$ such that $y in "conv"(S)$.]
#proof[Let $A = mat(v_1, v_2, dots, v_k) in RR^(n times k)$ and $lambda = (lambda_1, lambda_2, dots, lambda_k) in RR^(k)$. Then, $y in "conv"({v_1, dots, v_k})$ translates to the condition that $A lambda = y$ for $lambda >= 0$ such that $bold(1) dot lambda = 1$. Note that his polyhedron is nonempty. By the prior proposition, there exists som vertex $lambda^star$ of this polyhedron. Furthermore, $lambda^star$ is a BFS. Thus, $A_=$ has rank $k$. Thus, at least $k - (n + 1)$ entries of $lambda^star$ are $0$. 

]

= Bounded Polyhedra = Polytopes

== Bounded Polyhedra $subset.eq$ Polytope

== Separating Hyperplane Theorem
#prop("Separating Hyperplane Theorem")[If $c in RR^n$ is nonempty, closed and convex, $y in.not C$, then there exist $a in RR^n$, $b in RR$ such that $a^T y > b > a^T x$.]

#pagebreak()
= Polytopes $subset.eq$ Bounded Polyhedra
\

We shall prove the following result in this lecture.

#prop[Any polytope that con tains $0$ in its interior is a bounded polyhedron.]<polytope-zero-polyhedron>

#proof[Let $P$ be our polytope. It is enough, by @involution-polar, to show that $(P^o)^o$ is a bounded polyhedron. Then, by @polar-polytope, we note that $P^o$ is a polyhedron. Since $P^o$ contains $bold(0)$, it is a bounded polyhedron. Thus, $P^o$ is a polytope and $P = (P^o)^o$ is a polyhedron. Finally, $P$ is bounded by the convexity of the Euclidean norm. 

]

#definition[Let $S subset.eq RR^n$. Then, the _polar of $S$_ is the set $ S^o = {z in RR^n bar z^T x <= 1, #h(5pt) forall x in S}. $]

#lemma[If $C subset.eq RR^n$ is closed, convex and contains $0$, then $(C^o)^(o ) = C$.]<involution-polar>

#proof[ Fix $x in C$. We need to show that $x^T z <= 1$ for all $z in C^o$. But since $z in C^o$, $x^T z = z^T x <= 1$. Thus, $C subset.eq (C^o)^o$.

Fix $x in (C^o)^o$. For contradiction, assume $x in.not C$. 
]

#lemma[The polar of a polytope is a polyhedron.]<polar-polytope>

#lemma[If $bold(0)$ is in the interior of $S$, then $S^o$ is bounded.]

= Farkas' Lemma

#definition("cone")[For a set of vectors ${v_1, dots, v_n}$, we define their _cone_ to be $ "cone"(v_1, dots, v_n) = {sum_(i = 1)^n lambda_i v_i bar lambda_i >= 0} $]

#prop("Farkas' Lemma I")[Let $A in RR^(m times n), b in RR^m$. Exactly one of the following holds 
+ $exists x in RR^n. #h(4pt) A x = b, x >= 0$;
+ $exists y in RR^m. #h(4pt) A^T y >= 0, b^T y < 0.$]
#proof[ First, $(a)$ and $(b)$ can't both hold. For contradiction, suppose we have such an $x$ and a $y$. Consider the following linear programs that are duals of one another, 

$ max 0^T x "s.t." A x = b, x >= 0 #h(40pt) &(P) \ min b^T y "s.t." A^T y >= 0 #h(50pt) &(D) $

Then $x$ is a feasible solution of $(P)$ with value $0$ and $y$ is a feasible solution of $D$ with value $b^T < 0$. This contradicts weak duality.

Now, we show that at least one of these always holds. Particularly, if $not (a)$ then $(b)$ holds. 

Suppose $(a)$ doesn't hold. Let $ A = mat(v_1, dots.c, v_n)$ and $Q = "cone"(v_1, dots, v_n)$. By assumption, note that $b in.not Q$. Furthermore, $Q$ is nonempty, convex and closed. Now, Seperating Hyperplane Theorem yields $alpha in RR^n, beta in RR$ such that $ alpha^T b > beta > alpha^T p #h(20pt). forall p in Q $
with $alpha != 0, beta > 0$. Note that for $y = -alpha$, we have $b^T y = -b^T alpha = -alpha^T b < 0$.  

Now, we show that $A^T y >= 0$. That is, $forall i in [n]$, $v_i^T y >= 0$ (equivalently, $v_i^T alpha <= 0)$. Fix some $i$. Then $lambda v_i in Q$ for all $lambda >= 0$. Then, forall $lambda >= 0$, we also have $ alpha^T (lambda v_i) < B. $

Assume for contradiction that $v_i^T alpha > 0$. If we choose $lambda = beta/(v_i^T alpha)$ then $ beta = lambda v_i^T alpha < beta. $ 

Thus, $v_i^T alpha <= 0$.

]

#prop("Farkas' Lemma II")[Let $A in RR^(m times n)$, $b in RR^m$. Then exactly one of the following holds, 
#set enum(numbering: "a'.")
+ $exists x in RR^n. #h(4pt) A x <= b$;
+ $exists y in RR^m. #h(4pt) A^T y = 0. #h(4pt) y >= 0, b^T y < 0$

Furthermore, $(b')$ is equivalent to $(b'')$, 
#set enum(numbering: "a''.", start: 2)
+ $exists y in RR^n. #h(4pt) A^T y = 0, y >= 0, b^T y = -1$.]
#proof[ First, ]
