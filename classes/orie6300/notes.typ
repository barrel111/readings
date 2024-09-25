#import "@local/preamble:0.1.0": *

#import "@preview/lovelace:0.2.0": *

#show: setup-lovelace


#show: project.with(
  course: "ORIE6300",
  sem: "FA24",
  title: "Mathematical Programming I",
  subtitle: "Notes",
  // authors: (
  //   "Shaleen Baral",
  // ),
)

= Introduction: LP and Duality

== Why should you take this class?  

Mathematical programming is a very well-studied field. Many optimization problems can be recast as or at least well-approximated by mathematical programs. Doing so not only allows us to use algorithms but also use the theory of mathematical programming to uncover structural insights. The course will roughly cover

+ Linear Programming
  - Geometry
  - Duality Theory
  - Algorithms

+ Convex Programming

+ First-Order Methods

== Logistics 

Weekly assignments due every Friday night (11:59pm). Grading scheme is as follows:
- $40%$ HW assignments ($~10$)
- $20%$ in-person final
- $15%$ take-home midterm
- $15%$ take-home final
- $10%$ participation/scribing

== Linear Programming

#definition[A _linear program (LP)_ is an optimization problem of the following shape
$ max #h(15pt) &c^T x \ "s.t." #h(15pt) &A x <= b $
where 
- $x in RR^n$ is the _decision variable_;
- $c in RR^n$ is fixed;
- $c^T x$ is called the _objective function_;
- $A in RR^(m times n)$ and $b in RR^m$ are fixed;
- $A x <= b$ is called the _constraint_.
]

#remark[The inequality $A x <= b$ is read elementwise i.e. it is equivalent to the system $a_i x <= b_i, #h(5pt) forall i in [m]$, where $a_i$ denotes the $i$-th row of $A$.]

#definition[A $x in RR^n$ is a _feasible solution_ if $A x <= b$.]

#definition[The _feasible region_ is the set of all feasible solutions, $ Q = {x in RR^n bar A x <= b}. $]

#definition[A feasible solution $x in RR^n$ is _optimal_ if its _value_, $c^T x$, is at least as large as the value of any other feasible solution.]

Suppose we are given a feasible solution $x in RR^n$. Is there any way we can certify its optimality? The essential idea is that we want to multiply each constraint $a_i x <= b_i$ with a $y_i >= 0$ so that,

$ &y_1 &times #h(10pt) (a_1 x &<= b_1) \ 
&y_2 &times #h(10pt) (a_2 x &<= b_2) \ 
& &#h(1pt) dots.v \ 
+#h(10pt) &y_m &times #h(10pt) (a_m x &<= b_m) \ 
&#line(length: 5%)& #line(length: 10%) &#line(length: 6%) \ 
&& c^T x &<= y^T b $

That is, this problem of certification is equivalent to generating upper bounds for $y^T b$ subject to the constraint $A^T y = c, y >= 0$. Searching for the best upper bound then motivates the notion of a _dual_ in the next definition.

#definition[
  An LP of the following form is known as the _primal_
  $ max #h(15pt) &c^T x \ "s.t." #h(15pt) &A x <= b. $

  The _dual_ to the _primal_ above is defined to be
$ min #h(15pt) &b^T y \ "s.t." #h(15pt) &A^T y = c \ &y >= bold(0). $

]

#prop("weak duality")[If $x in RR^n$ feasible in primal and $y in RR^m$ feasible in dual then $c^T x <= b^T y$.]

#proof[ We know that $A^T y = c$. Then, $ c^T x = y^T A x <= y^T b. $ The last inequality is justified by the fact that $y >= bold(0)$. 

]

In fact, a stronger result holds.

#prop("strong duality")[If the primal LP or the dual LP has an optimal feasible solution then both have an optimal feasible solutions and their values are equal.]

#pagebreak()
= Strong Duality and Dual of the Dual
~

== Strong Duality 

We present a not-quite rigorous argument for why strong duality holds. The purpose of this is to just develop our intuition and preview what we will be spending much of the upcoming lectures building up to.

Recall the primal and dual programs from the previous lecture


$ "primal:" #h(10pt) &max c^T x #h(20pt) "s.t." #h(20pt) A x <= b. \ "dual:"#h(10pt) &min b^T y #h(23pt) "s.t." #h(20pt) A^T y = c, #h(6pt) y>= bold(0). $

First, we interpret our linear program in a "physical" sense. Suppose the decision variable represents the position of a ball that is always acted on by a force, $c$. We make three observations, 

- if we place ball at an optimal feasible solution, it doesn't accelerate
- if the ball doesn't accelerate, the forces acting on it sum to $0$
- each _wall_, $a_i x_i <= b_i$, may exert a force on ball along $-a_i^T$; if $a_i x < b_i$, then this force is $0$.

The following lemma formalizes this notion.

#lemma[If $x^star$ is an optimal feasible solution to the primal, then there exists $y in RR^n$ such that 

+ $y >= bold(0)$
+ $c + sum_(i = 1)^m (-y_i) a_i^T = 0$
+ $forall i in [m]$, #h(4pt) $y_i (a_i x^star - b_i) = 0$, 

The last condition is equivalent to saying $y_i = 0$ whenever $a_i x^star < b_i$.]

#prop("strong duality")[If $x^star$ is an optimal feasible solution to the primal, there exists an optimal feasible solution of the dual, $y^star$, such that $c^T x^star = b^T y^star$.]
#proof[Assuming $c^T x^star = b^T y^star$, we are guaranteed the optimality of $y^star$ by weak duality. 

Now, we actually show that such a feasibly solution must exist. Fix $x^star$ and let $y^star$ be the dual solution given by the prior lemma. Then $y^star$ is dual feasible as the previous lemma guarantees that $y^star >= bold(0)$ and $A^T y^star = c$. By weak duality, we can show that $y^star$ is optimal by showing that $c^T x^star = b^T y^star$. Consider,

$ c^T x^star &= (A^T y^star)^T x^star \ &= (y^star)^T A x^star \ &= (y^star)^T (b + A x^star - b) \ &= (y^star)^T b + (y^star)^T (A x^star - b) \ &= b^T y^star $

The last inequality follows from that fact that if $(a_i x^star - b_i)$ is non-zero for some $i in [m]$, then by the prior lemma $y_i = 0$.  

]

== Dual of the Dual 

Now, we focus on taking the dual of the dual. Particularly, we want to prove the following result.

#prop[The dual of the dual is the primal.]

First, we note that there are two forms in which we can specify a linear program

$ "basic form:" #h(10pt) &max c^T x #h(20pt) "s.t." #h(20pt) A x <= b. \ "standard form:"#h(10pt) &min b^T y #h(23pt) "s.t." #h(20pt) A^T y = c, #h(5pt) y>= bold(0). $

Now, we provide two ways of proving this result.

#proof("(transform LPs from standard form into basic form, then take the dual)")[ 

  Consider an LP in standard form

  $ min #h(10pt) &overline(c)^T x \ "s.t." #h(10pt) &overline(A)x = overline(b) \ &x >= bold(0). $

  This corresponds to the dual of the primal 

  $ max #h(10pt) &c^T x \ "s.t." #h(10pt) &A x <= b. $

  under the subtitution $overline(A) = A^T, overline(b) = c$ and $overline(c) = b$.

  We may rewrite the standard form LP as a maximization and use inequality constraints.  $ max #h(10pt) &-overline(c)^T x \ "s.t." #h(10pt) &-overline(A) x <= - overline(b) \ &overline(A) x <= overline(b) \ &-I x <= bold(0). $ Now, we take the dual of this program. We have $ min &#h(10pt) mat(-overline(b)^T, overline(b)^T, 0, dots.c, 0; "")^T #h(2pt) y #h(10pt) \ "s.t." &#h(10pt) mat(-overline(A)^T, overline(A)^T, -I;"") #h(2pt) y = -overline(c). $ For convenience, let $y = mat(s; t; w)$ such that $ mat(-overline(A)^T, overline(A)^T, -I; "") #h(2pt) y = -overline(A)^T s + overline(A)^T t - w. $ This lets us rewrite our program as $ max #h(10pt) &overline(b)^T (s - t) \ "s.t." #h(10pt) &overline(A)^T (s - t) + w &= overline(c) \ &s,t,w >= bold(0). $ Making the substitution $z = s - t$, we simplify this expression. $ max #h(10pt) &overline(b)^T z \ "s.t." #h(10pt) &overline(A)^T z + w &= overline(c) \ &w >= bold(0). $ Finally the requirement that $w >= bold(0)$ is equivalent to simply saying $overline(A)^T z <= overline(c)$. Thus, we have recovered the following program $ max #h(10pt) &overline(b)^T z \ "s.t." #h(10pt) &overline(A)^T z <= overline(c). $ 

Making the subtitutions $overline(A) = A^T, overline(b) = c$ and $overline(c) = b$, we recover the primal,

$ max #h(10pt) &c^T x \ "s.t." #h(10pt) &A x <= b.  $
]

#proof("(directly derive the dual)")[

  In the previous lecture, we derived the dual of an LP in basic form by wanting to bound its objective value. Again, we will derive the dual of the dual by trying to bounds its objective value.

  As before, an LP in standard form looks like 

  $ min #h(10pt) &overline(c)^T x \ "s.t." #h(10pt) &overline(A)x = overline(b) \ &x >= bold(0). $

  We want to take the linear combinations  

  $ &y_1 times (overline(a)_1 x = overline(b)_1) \ 
  &y_2 times (overline(a)_2 x = overline(b)_2) \ 
  dots.v \
  + #h(10pt) &y_n times (overline(a)_n x = overline(b)_n) $

  such that for every $j in [n]$,

  $ sum_(j = 1)^n y_j overline(a)_(1j) <= c_j. $

  This then gives us the lower bound $overline(c)^T x >= y^T overline(b)$. The best bound is then given by the linear program,

  $ max #h(10pt) &y^T overline(b) \ "s.t." #h(10pt) &overline(A)^T y <= overline(c). $

]

The following table succinctly summarizes the relationship between variables in the primal and the dual.

// #align(center)[
// #table(columns: (120pt, auto, 120pt), stroke: none, inset: 4pt, align: center, 
// table.header([*Primal*], [], [*Dual*]), $max$, $<-->$, $min$, $<= "constraints"$, $<-->$, $"variable" >= 0$, $= "constraint"$, $<-->$, "variable unconstrained", $"variable" >= 0$, $<-->$, $>= "constraint"$, "variable unconstrained", $<-->$, $= "constraint"$)
// ]

#align(center)[
#table(columns: (65pt, auto, 110pt, auto, 65pt), stroke: none, inset: 4pt, align: center, 
table.header([*min LP \ constraints*], [], [*variables*], [], [*max LP \ constraints*]), "equality", $<-->$, "unbounded variables", $<-->$, "equality", $>=$, $<-->$, "nonnegative variables", $<-->$, $<=$, $<=$, $<-->$, "nonpositive variables", $<-->$, $>=$)
]

#pagebreak()
= Polyhedron

== Polyhedrons

#definition[A set $S subset.eq RR^n$ is called a _polyhedron_ if $S = {x in RR^n bar A x <= b}$ for some $A in RR^(m times n), b in RR^m$.]

#definition[A set $S subset.eq RR^n$ is _convex_ if, for all $x, y in S$ and all $0 <= theta <= 1$, we have $theta x + (1 - theta) x in S$.]

#lemma[Any polyhedron $P$ is convex.]
#proof[ 
  Suppose $P = {x bar A x <= b}$ and let $x , y in P$. Then for $theta in [0, 1]$, consider $ A dot.c [theta x + (1 - theta) x] = theta A x + (1 - theta) A x <= theta b + (1 - theta) b = b. $ Thus, $theta x + (1 - theta) x in P$. \ ]

== Vertices

For the remaining definitions, let $P = {x in RR^n bar A x <= b}$ be a polyhedron.

#definition[A point $x in P$ is a _vertex_ if there exists $c in RR^n$ such that $c^T x > c^T y$, for all $y in P \\ {x}$.]

#definition[A point $x in P$ is an _extreme point_ if there aren't any $y, z in P \\ {x}$ and $theta in [0, 1]$ such that $x = theta y + (1 - theta) z$.]

#definition[Consider $x in P$. Then we call $a_i x <= b_i$ a _binding constraint_ if $a_i x = b$. Otherwise, we call it a _non-binding constraint_. ]

#definition[For any $x in P$, we may define the following matrices $ A_= = "the submatrix of " A "containing the rows of binding constraints," \ b_= =  "the subvector of " b "for the binding rows," \ A_< = "the submatrix of " A "containing the rows of non-binding constraints," \ b_< = "the subvector of " b "for the non-binding rows." $]

#definition[A point $x in P$ is a _basic feasible solution (BFS)_ if $"rank"(A_=) = n$.]

#prop[Let $P = {x in RR^n bar A x <= b}$. The following are equivalient: 
+ $x$ is a vertex,
+ $x$ is an extreme point,
+ $x$ is a BFS.]<vertex-prop>

#proof[
  - _(a) $=>$ (b)_ \ We have $c in RR^n$ such that $c^T x > c^T y$, for all $y in P \\ {x}$. Let $y, z in P \\ {x}$.  WLOG assume that $c^T y >= c^T z$. Then consider, $ c^T (theta y + (1 - theta) z) &= theta c^T y + (1 - theta) c^T z \ &<= theta c^T y + (1 - theta) c^T y \ &= c^T y \ &< c^T x $ Thus, we have that $theta y + (1 - theta) z != x$.

  - _(b) $=>$ (c)_ \ We prove the contrapositive, _$not$ (c) $=>$ $not$ (b)_. \ Assume $"rank"(A_=) < n$. Then there exists $y in RR^n \\ {bold(0)}$ such that $A_= y = bold(0)$. Note that for any $epsilon > 0$ we can conclude that $x plus.minus epsilon y$ satisfies the binding constraints as verified below $ A_(=) (x plus.minus epsilon y) = A_=x plus.minus epsilon A y = A_= x = b. $ Now, we show that for an appropriate choice of $epsilon > 0$, these vectors also satisfy the non-binding constraints. \ Note that $A_< x < b_<$ and hence, $b_< - A_<x > bold(0)$. Thus, for small enough $epsilon > 0$ we have $ plus.minus epsilon A_< y < b_< - A_< x. $ #align(center)[#box(stroke: 0.5pt, inset: 10pt)[*Choosing $epsilon$* \ For example, take $epsilon = zeta/( norm(A_< y)_oo + 1)$ where $zeta = min_( i in [m] ) (b_< - A_< x)_i$ .]] Then, this immediately gives us what we want, $ A_<(x plus.minus epsilon y) = A_< x plus.minus epsilon A_< y <= b_<. $ So, $x$ can be written as a convex combination of $x plus.minus epsilon y in P$.

  - _(c) $=>$ (a)_\ Define $I = {i in [m] bar a_i x = b_i}$. Then, let $c = sum_(i in I) a_i^T$. Then, $ c^T x = (sum_(i in I) a_i ) x = sum_(i in I) a_i x = sum_(i in I) b_i. $  Let $y in P$. Then, $ c^T y = sum_(i in I) a_i y <= sum_(i in I) b_i. $ If this inequality is tight, that is $c^T y = sum_(i in I) b$ then, $a_i y = b_i$. As $"rank"(A_=) = n$, $A_= y = b$ has a unique solution, $y = x$. Thus, $x$ is a vertex.

]

#pagebreak()
= More Polyhedrons

== Existence of Vertices

#definition[A polyhedron $P$ contains a line if there exists $x in P, y in RR^n\\ {bold(0)}$ such that ${x + lambda y bar lambda in RR} subset.eq P$. Otherwise, $P$ is _pointed_.]

#remark[Without loss of genarality, we may just consider the half line, ${x + lambda y bar lambda >= bold(0), lambda in RR}$.]

#prop[Let $P = {x in RR^n bar A x <= b}$ be a non-empty polyhedron. The following three are equivalent
+ $P$ has at least one vertex,
+ $P$ is pointed,
+ $"rank"(A) = n$.]<exist-vertex-prop>
#proof[
  - _(b) $=>$ (a)_ \ Consider any point $x in P$. If $"rank"(A_=) = n$, then $x$ is a vertex and we are done. Otherwise, we have $"rank"(A_=) < b$. Then there exists $y in RR^n \\ {bold(0)}$ such that $A_= y = bold(0)$. As $P$ is pointed, we know that the line ${x + lambda y bar lambda >= bold(0), lambda in RR}$ isn't entirely contained in $P$. That is to say, there exists $lambda^star$ such that the line exits $P$ at $x + lambda^star y$. Particularly, at this specific $lambda^star$ a new constraint $j in [m]$ becomes tight: $a_j x < b_j$ but $a_j (x + lambda^star y) = b_j$. \ #align(center)[#box(stroke: 0.5pt, width: 75%, inset: 10pt)[
   *A More Rigorous Argument for $lambda^star$* \
    There exists $lambda'$ is such that $x + lambda' y in.not P$. Let $I subset.eq [m]$ such that for $i in I$, $ a_i (x + lambda' y) > b_i. $ Since $x + lambda' y in.not P$, $I$ must be non-empty. Note that for every $i in I$, $lambda |-> a_i (x + lambda y)$ is continuous and by the Intermediate Value Theorem, there exists $lambda_i in (0, lambda]$ such that $a_i (x + lambda_i y) = b_i$. Then take $lambda^star = min_(i in I) lambda_i$. ]] Let $x' = x + lambda^star y$. Note that the prior equality constraints are still tight, $ A_= x' = A (x + lambda^star y) = A_= x + lambda^star A_= y = b_=. $ Let $A'_=$ be the submatrix of $A$ containing the rows of binding constraints for $x'$. We know that $A'_=$ contains all the rows of $A_=$ and at least an addition row $a_j$ corresponding to a previous non-binding constraint, $a_j x < b_j$, becoming tight, $a_j (x + lambda^star y) = b_j$. \ Furthermore, we claim that $a_j$ is linearly independent of the rows of $A_=$. If $a$ is a row of $A_=$, then $a y = 0$. Note that $ a_j y > (b_j - a_j x)/lambda^star >0. $ That is, $a_j$ is not a linear combination of the rows of $A_=$. Thus, $"rank"(A_= ') > "rank"(A_=)$. Repeating this argument, by induction, we can find a basic feasible solution.
  - _(a) $=>$ (c)_ \ Suppose $x in P$ is a vertex. Then, $ n = "rank"(A_=) <= "rank"(A) <= n. $ Thus, $"rank"(A) = n$.

  - _(c) $=>$ (b)_ \ Assume $"rank"(A) = n$. Suppose $P$ contains a line ${x + lambda y bar lambda in RR} subset.eq P$ for $y in RR^n$. We will show that we must have $y = 0$. \ Let $j in [m]$. Then we know that for all $lambda in RR$, $ a_j (x + lambda y) <= b_j$ holds. Taking the limit as $lambda -> "sgn"(a_j y) dot oo$, we get that $a_j (x + lambda y) -> oo$ if $a_j y != 0$. Thus, it must be the case that $a_j y = 0$. By injectivity of $A$, we note that $y = bold(0)$. Thus, it must be the case that $P$ is pointed. 

]

#definition[Let $B$ be a normed space. A set $X subset.eq B$ is called bounded whenever there exists $M in RR$, such that  $norm(x) <= M$ for all $x in X$.]

#corollary[If a polyhedron $P$ is nonempty and bounded then $P$ has at least one vertex.]
#proof[
  A bounded bolyhedron cannot contain a line. Consider a line $lambda |-> x + lambda y$, for $y != bold(0)$. Then, for some $M in RR$, points of the line contained in $P$ must satisfy
  $ abs(lambda) norm(y) - norm(x) <= norm(x + lambda y) <= M \ implies abs(lambda) <= (M + norm(x))/norm(y). $
]

#corollary[The feasible region of an LP in standard form, if it is nonempty, has at least one vertex.]<standard-vertex>
#proof[The feasible region of a standard form LP is a subset of the nonnegative orthant $RR^n_(>=0)$ which does not contain a line. \ ]

An important result is that we can achieve optimality at a vertex.

#prop("fundamental theorem of linear programming")[ \ Let $P = { x in RR^n bar A x <= b}$ be a nonempty, pointed polyhedron. Suppose we are also given an LP $ max #h(15pt) &c^T x \ "s.t." #h(15pt) &x in P. $ If an optimal feasible solution exists, there is an optimal feasible solution that is a vertex of $P$.]
#proof[Define $Q = P sect {x in RR^n bar c^T x = c^T x^star}$. Note that $Q$ is a nonempty polyhedron as $x^star in Q$. Furthermore, $Q$ is pointed because $Q subset.eq P$ and $P$ is pointed. 

  By @exist-vertex-prop, there exists a vertex $v$ of $Q$. Note that $v$ is feasible and $c^T v = c^T x^star$, so $v$ is optimal. Suppose that $v$ is not an extreme point of $P$. That is to say, there exists $y, z in P \\ {v}$ and $theta in [0, 1]$ such that $ v = theta y + (1 - theta) z. $ Then, $ c^T x^star = c^T v = c^T (theta y) + (1 - theta) z = theta c^T y + (1 - theta) c^T z <= c^T x^star. $ Note that $c^T y = c^T z = c^T x^star$ as otherwise $c^T x^star < c^T x^star$, a clear contradiction. Thus, we have $y, z in Q \\ {v}$. However, this would imply that $v$ is not an extreme point of $Q$--- a contradiction! Thus, $v$ is a vertex of $P$ too. \ ]

== Convex Hull

#definition[Given $v_1, dots, v_k in RR^n$, a _convex combination_ is any $sum_(i = 1)^k lambda_i v_i$ where $lambda_i >= 0$ for all $i in [k]$ and $sum_(i = 1)^k lambda_i = 1$.]

#definition[Given $v_1, dots, v_k in RR^n$, their _convex hull_ is the set of all their convex combinations, $ "conv"({v_1, dots, v_k}) = {sum_(i = 1)^k lambda_i v_i bar lambda_i>= 0, sum_(i = 1)^k lambda_i = 1}. $]

#definition[Any $S subset.eq RR^n$ that can be written as $S = "conv"({v_1, dots, v_k})$ for some $v_1, dots, v_k$ is called a _polytope_.]

#prop("Carathéodory's Theorem")[\ Suppose $v_1, dots, v_k in RR^n$ and $y in "conv"({v_1, dots, v_k})$. Then, there exists $S subset.eq {v_1, dots, v_k}, abs(S) <= n + 1$ such that $y in "conv"(S)$.]
#proof[Assume, without loss of generality, let $k > n + 1$ as otherwise the proposition holds trivially due to linear dependence.

  Define $ A = mat(bar, bar, "", bar; v_1, v_2, dots, v_k; bar, bar, "", bar;) in RR^(n times k)  #h(10pt) "and" #h(10pt) lambda = vec(lambda_1, , dots.v, lambda _k) in RR^n. $
  Then the following polyhedron represents all the ways in which we may write $y$ as a convex combination of $v_1, dots, v_k$, 
  #numbered_eq($A lambda &= y,$)
  #numbered_eq($bold(1) dot lambda &= 1$)
  #numbered_eq($y &>= bold(0).$)
  Note that this polyhedron is nonempty as $y in "conv"({v_1, dots, v_k})$. By @standard-vertex, there exists some vertex $lambda^star$ of this polyhedron. Furthermore, $lambda^star$ is a BFS. Thus, $"rank"(A_=) = k$. The constraints corresponding to equation $(1)$ and $(2)$ have rank at most $n + 1$. So, at least $k - (n + 1)$ many constraints from $(3)$ must be binding. That is, at least $k - (n + 1)$ entries of $lambda^star$ are $0$. Let $S = {i in [k] bar lambda^star_i > 0}$. 

  Note that $|S| = k - (k - (n + 1)) = n + 1$ and $ y = sum_(i in S) lambda_i^star v_i, $
  as desired. \
]

#pagebreak()
= Bounded Polyhedra and Polytopes I

== Bounded Polyhedra $subset.eq$ Polytope

#prop[If $P$ is a bounded polyhedron, then $P = #conv($v_1, dots, v_k$)$, where $v_1, dots, v_k$ are the vertices of $P$.]
#proof[
  - $#conv($v_1, dots, v_k$) subset.eq P$ \ Note that $P$ is convex and contains $v_1, dots, v_k$. Thus, $#conv($v_1, dots, v_k$) subset.eq P$. 

  - $P subset.eq #conv($v_1, dots, v_k$)$ \ Let $x in P$, we want to show that $ exists lambda_1, dots, lambda_k >= 0, #h(2pt) sum_(i = 1)^k lambda_i =1. #h(5pt) x = sum_(i = 1)^k lambda_i v_i. $ We proceed by induction on $n - "rank"(A_=)$. \ *Base Case.* When $"rank"(A_=) = n$, $x$ is a basic feasible solution of $P$. Thus, $x = v_i$ for some $i in [k]$. Then the claim follows from setting $lambda_i = 1$ and $lambda_j = 0$ for all $j != i$. \ *Induction Hypothesis.* We assume that any $x' in P$ for which the binding constraints have a rank strictly higher than $"rank"(A_=)$ can be written as a convex combination of ${v_i}_(i in [k])$. \ *Inductive Step.* We know that $"rank"(A_=) < n$. Thus, tehre exists $y in RR^n \\ {0}$ such that $A_= y = 0$. Consider the line ${x + alpha y bar alpha in RR}$. Since $P$ is bounded, we know that there exists $alpha^- < 0$ and $alpha^+ > 0$ such that that $x + alpha z in P$ if and only if $alpha^- <= alpha <= alpha^+$. Furthermore, $x + alpha^+ y, x + alpha^- y$ have at least one more binding constraints than $x$. So, their binding constraints have rank strictly greater than $"rank"(A_=)$. By the induction hypothesis, there are $lambda_i^+, lambda_i^- >= 0$ with $sum_(i = 1)^k lambda_i^+ = 1 = sum_(i = 1)^k lambda_i^-$ such that $ x + alpha^+ y = sum_(i = 1)^k lambda_i^+ v_i, #h(10pt) x + alpha^- y = sum_(i = 1)^k lambda_i^- v_i. $ Consider the following convex combination, $ x= ((-alpha^-)/(alpha^+ - alpha^-)) (x + alpha^+ y) + (alpha^+/(alpha^+ - alpha^-)) (x + alpha^- y). $ Thus, $x$ is a convex combination of $x + alpha^+ y, x + alpha^- y in #conv($v_1, dots, v_k$)$. By convexity of the convex hull, $x in #conv($v_1, dots, v_k$)$.]

== Separating Hyperplane Theorem

We now discuss a sufficient condition for separating a set from a point by a hyperplane.

We start by proving the Extreme Value Theorem.

#prop("Weierstrass' Exteme Value Theorem")[\ Let $C subset.eq RR^n$ be a compact. Let $f: C -> RR$ be continuous. Then there exists $x in C$ such that $f(x) <= f(x')$ for all $x' in C$.]
#proof[ As $f$ is continuous, $f(C)$ compact and hence, closed. Since $inf_x f(x)$ is a limit point of $C$, it must be contained in $f(C)$. Hence, there exists $x in C$ such that $f(x) = inf_x f(x) <= f(x')$ for all $x' in C$. \ ]

Now, we move to the main result.

#prop("Separating Hyperplane Theorem")[\ Suppose $C subset.eq RR^n$ is nonempty, closed and convex. Suppose $y in.not C$. Then, there exist $a in RR^n$, $b in RR$ such that $a^T y > b > a^T x$.]
#proof[ Consider $f: C -> RR$ defined by $x |-> norm(x - y)^2$. Fix some $q in C$. Define $ hat(C) = {x in C bar norm(x - y) <= norm(q - y)}. $ Note that $hat(C)$ is nonempty as $q in hat(C)$. Furthermore, $hat(C)$ is closed and bounded being the intersection of $C$ with the closed ball of radius $norm(q - y)$ centered at $y$. \ As $hat(C)$ is compact, we can choose a $z in "argmin"_(x in hat(C)) f(x)$. Furthermore, for $x in C \\ hat(C)$, we have  $f(x) > f(q) >= f(z)$ as $ norm(x - y) > norm(q - y) >= norm(z - y). $ Thus, $z in "argmin"_(x in C) f(x)$ too. We then set $a = y - z, b = 1/2 (a^T y + a^T z)$. Note that as $y in.not C$ and $z in C$, we have $a != 0$. Note then that $z, y$ are separated by $a$ as $ a^T y - a^T z = a^T (y - z) = a^T a > 0. $ Furthermore, $a^T y > b$ and $a^T z < b$ as $ a^T y - b  = 1/2(a^T y - a^T z) > 0, \ a^T z - b = 1/2 (a^T z - a^T y) < 0. $ All we have to show now is that $a^T x < b$ for all $x in C$. This is equivalent to showing $a^T (z - x) >= 0$ for all $x in C$. We prove this now. Fix an $x in C$ and consider $x_theta = theta x + (1 - theta) z$ for $theta in (0, 1]$. Then, $ f(x_theta) = norm(x_theta - y)^2 = norm((z - y) + theta (x - z))^2. $ By convexity of $C$, we have $x_theta in C$. Thus, $f(x_theta) >= f(z) = (z - y)^T (z - y)$. Substituting the expression above into this we get, $ &theta^2 norm(x - z)^2 + 2 theta (x - z)^T (z - y) >= 0 \ implies& theta norm(x - z)^2 + 2(x - z)^T a >= 0 \ implies& (z - x)^T a >= - theta/2 norm(x - z)^2. $ This inequality hods for all $theta > 0$. Taking the limit as $theta -> 0$, we have $a^T (z - x) >= 0$.  \ ] 

#pagebreak()
= Bounded Polyhedra and Polytopes II

== Polars

#let circ = $circle.small$
#definition[Let $S subset.eq RR^n$. Then, the _polar of $S$_ is the set $ S^circ = {z in RR^n bar z^T x <= 1, #h(5pt) forall x in S}. $]

#lemma[If $C subset.eq RR^n$ is closed, convex, and contains $bold(0)$, then $C^(circ circ) = C$.]<polar-involution>

#proof[
  - $C subset.eq C^(circ circ)$ \ Fix $x in C$. We need to show that $x^T z <= 1$, for all $z in C^circ$. This follows from the fact that, as $z in C^circ$, we have $x^T z = z^T x <= 1$. 
  - $C^(circ circ) subset.eq C$ \ Assume for contradiction that $x in C^(circ circ)$  but $x in.not C$. Since $bold(0) in C$, $C$ is nonempty. By assumption $C$ is closed and convex. By the Separating Hyperplane Theorem, we obtain $a in RR^n$ and $b in RR$ such that $a^T x > b > a^T y$ for all $y in C$. Since $bold(0) in C$, it follows that $b > bold(0)$. \ Let $tilde(a) = a\/b$ so that $tilde(a)^T x > 1 > tilde(a)^T y$ for all $y in C$. The second inequality implies that $tilde(a) in C^circ$. As $x in C^(o o)$, we must have $x^T tilde(a) <= 1$. This contradicts $x^T tilde(a) > 1$. \ Thus, $x in C$ and hence $C^(circ circ) subset.eq C$.
]

#lemma[The polar of a polytope is a polyhedron.]<polar-polytope>
#proof[ Let $P = #conv($v_1, dots, v_k$)$. We claim that $P^circ = {z in RR^n bar z^T v_i <= 1, forall i in [k]}$. 
 - $(subset.eq).$ Note that $P^circ subset.eq {z in RR^n bar z^T v_i <= 1, forall i in [k]}$. This is because an element polar must satisfy all the constraints of the set on the right, and more. 
- $(supset.eq).$ Fix $z in RR^n$ such that $z^T v_i <= 1$ for all $i in [k]$. Any $x in P$ can be written as a convex combination $sum_(i = 1)^k lambda_i v_i$. Then, $ z^T x = z^T (sum_(i = 1)^k lambda_i v_i) = sum_(i = 1)^k lambda_i underbrace(z^T v_i, <= 1) <= sum_(i = 1)^k lambda_i = 1. $ Thus, $z in P$.]

#lemma[If $bold(0)$ is in the interior of $S$, then $S^circ$ is bounded.]<polar-bounded>
#proof[ By assumption, there exists $epsilon > 0$ such that for all $x in RR^n$ satisfying $norm(x) <= epsilon$, we have $x in S$. Let's fix some $z in S^circ \\ {bold(0)}$ and we claim that $norm(z) <= 1/epsilon$. \ Let $x = epsilon/norm(z) z$. Since $norm(x) = epsilon$, we have $x in S$. Since $z^T x <= 1$, we have $ z^T x = z^T (epsilon/norm(z) z) = epsilon norm(z) <= 1. $ Thus, $norm(z) <= 1/epsilon$ and $S^circ$ is bounded. \ ]

== Polytopes $subset.eq$ Bounded Polyhedra
\

We start by showing that all polytopes are bounded. 

#lemma[Any polytope is closed and bounded (equiv. compact).]
#proof[
  // Let $P = #conv($v_1, dots, v_k$)$. Note then that $x |-> norm(x)$ is convex. We may write any $x in P$ as the convex combination $x = sum_(i = 1)^k lambda_i v_i$. Then, $ norm(x) <= norm(sum_(i = 1)^k lambda_i v_i) <= sum_(i = 1)^k lambda_i norm(v_i) <= max_(i in [k]) norm(v_i). $
  First, define the simplex $ Delta_n = {lambda in RR^k bar lambda>= bold(0), sum_(i = 1)^k lambda_i = 1}. $ Note that this is closed, being the intersection of the nonnegative orthant $RR_+^n$ and the hyperplane $H = {lambda in RR^k bar sum_(i = 1)^k lambda_i = 1}$, both of which are closed. Furthermore, $Delta_n$ is bounded as it is a subset of $[0, 1]^n$.

  Next, the map $f: Delta_n -> RR^n$ defined by $lambda |-> sum_(i = 1)^k lambda_i v_i$ is continuous. Thus, the polytope $P = #conv($v_1, dots, v_k$)$ is the continuous image $g(Delta_n)$ of $Delta_n$. So, $P$ must be compact too. 
\ ]

We shall prove the following result in this lecture.

#prop[Any polytope that contains $bold(0)$ in its interior is a bounded polyhedron.]<polytope-zero-polyhedron>

#proof[Let $P$ be our polytope. It is enough, by @polar-involution, to show that $P^(circ circ)$ is a bounded polyhedron. By @polar-polytope, we note that $P^circ$ is a polyhedron. Since $P$ contains $bold(0)$, $P^circ$ is a bounded polyhedron. Thus, $P^circ$ is a polytope and $P = P^(circ^circ)$ is a polyhedron. Finally, $P$ is bounded by the convexity of the Euclidean norm. \ ]

#pagebreak()
= Farkas' Lemma and Infeasibility 

== Farkas' Lemma 

We are interested in certifying the feasibility of LP problems. This naturally leads us to Farkas' Lemma. Before that, we introduce a new construction that will be useful for us.  

#definition("cone")[For a set of vectors ${v_1, dots, v_k}$, we define their _cone_ to be $ "cone"({v_1, dots, v_k}) = {sum_(i = 1)^k lambda_i v_i bar lambda_i >= 0}. $]

#lemma[For any $v_1, dots, v_k in RR^n$, the $#cone($v_1, dots, v_k$)$ is convex.]
#proof[ Suppose $p, p' in Q$ and $theta in [0, 1]$. Then, $p = sum_(i = 1)^k lambda_i v_i$ and $q = sum_(i = 1)^k lambda_i' v_i$ for $lambda_i, lambda_i' >= 0$. The following then proves the convexity of $Q$, $ theta p + (1 - theta) q = sum_(i = 1)^k underbrace([theta lambda_i + (1 - theta) lambda'_i], >= 0) dot.c v_i in Q. $  ]

#lemma[For any $v_1, dots, v_k in RR^n$, the $#cone($v_1, dots, v_k$)$ is closed.]
#proof[At some point, do Exercise 4.37 in BT97.]

Now, we move to the main result. 

#prop("Farkas' Lemma I")[\ Let $A in RR^(m times n), b in RR^m$. Exactly one of the following holds 
+ $exists x in RR^n. #h(4pt) A x = b, x >= bold(0)$;
+ $exists y in RR^m. #h(4pt) A^T y >= bold(0), b^T y < 0.$]
#proof[ 

  - $(a)$ and $(b)$ cannot both hold. \ For contradiction, suppose we have such an $x$ and $y$. Consider the following linear programs that are duals of one another, $ "(P)" #h(10pt) max #h(10pt) &bold(0)^T x #h(40pt) "(D)" #h(10pt) min #h(10pt) b^T y \ "s.t." #h(10pt) &A x = b #h(55pt) "s.t." #h(10pt) A^T y >= bold(0) \ &x >= bold(0) $ Then $x$ is a feasible solution of $(P)$ with value $0$ and $y$ is a feasible solution of $D$ with value $b^T y < 0$. This contradicts weak duality. 

  - $not (a) => (b)$. \ Suppose $(a)$ doesn't hold. Then, we define $ A = mat(bar, "", bar; v_1, dots.c, v_n; bar, "", bar) #h(20pt) "and" #h(20pt) Q = #cone($v_1, dots, v_n$). $ By assumption, note that $b in.not Q$. Furthermore, $Q$ is nonempty, convex and closed. Now, the Separating Hyperplane Theorem yields $alpha in RR^n, beta in RR$ such that $ alpha^T b > beta > alpha^T p. #h(20pt) forall p in Q $ with $alpha != bold(0).$ Furthermore,  $beta > 0$ as $bold(0) in Q$. Note that for $y = -alpha$, we have $ b^T y = -b^T alpha = -alpha^T b < 0. $ Now, we show that $A^T y >= bold(0)$. That is, for all $i in [n]$, we want to show that $v_i^T y >= 0$ (equiv. $v_i^T alpha <= 0)$. Fix some $i in [n]$. Then $lambda v_i in Q$ for all $lambda >= 0$. Thus, for all $lambda >= 0$, we also have $ alpha^T (lambda v_i) < beta. $ Assume for contradiction that $v_i^T alpha > 0$. We choose $lambda = beta/(v_i^T alpha)$, then $ beta = lambda v_i^T alpha < beta. $ This is a contradiction! Thus, $v_i^T alpha <= 0$. ]

The following variant of Farkas' Lemma will turn out to be useful.

#prop("Farkas' Lemma II")[\ Let $A in RR^(m times n)$, $b in RR^m$. Then exactly one of the following holds, 
#set enum(numbering: "a'.")
+ $exists x in RR^n. #h(4pt) A x <= b$,
+ $exists y in RR^m. #h(4pt) A^T y = bold(0). #h(4pt) y >= bold(0), b^T y < 0$.

Furthermore, $(b')$ is equivalent to $(b'')$, 
#set enum(numbering: "a''.", start: 2)
+ $exists y in RR^n. #h(4pt) A^T y = bold(0), y >= bold(0), b^T y = -1$.]
#proof[ - $(b') <==> (b'')$ \ Note that $(b'') => (b')$ as $b^T y = -1 < 0$. \ For $(b') => (b'')$, let $y in RR^m$ such that $A^T y = bold(0), y >= bold(0), b^T y < 0$. Then, define $ y' = -1/(b^T y) y. $ Indeed, $ A^T y' = -1/(b^T y) A^T y = bold(0), \ y' = -1/(b^T y) y >= bold(0), \ b^T y' = -1/(b^T y) b^T y = -1. $
- $(a')$ and $(b')$ cannot both hold. \ For contradiction, suppose we have such an $x$ and $y$. Consdier the following linear programs that are duals of one another, $ "(P)" #h(10pt) max #h(10pt) &bold(0)^T x #h(40pt) "(D)" #h(10pt) min #h(10pt) b^T y \ "s.t." #h(10pt) &A x <= b #h(55pt) "s.t." #h(10pt) A^T y = bold(0) \ & #h(110pt)y >= bold(0) $ Then $x$ is a feasible solution to $(P)$ with value $0$ whereas $y$ is a feasible solution to $(D)$ with value $b^T y <0$. This contradicts weak duality.
- $not (b') => (a')$. \ Suppose $not (b')$ so that the following is infeasible, $ mat(A^T; b^T) y &= mat(0; dots.v; 0; -1) \ y &>= bold(0). $ By Farkas' Lemma, there exists $z in RR^(n + 1)$ such that $ mat(A, b) #h(2pt) z &>= bold(0), #h(14pt) mat(0; dots.v; 0; -1)^T z &< 0. $ Let $mat(x; lambda) = z$ be such that $ A x + b lambda >= bold(0). $ Furthermore, $-lambda < 0$ implies that $lambda > 0$. So, we define $x' = - x/lambda$. Then, $ A x' = -1/lambda A x <= -1/lambda (-lambda b) = b. $ Thus, $(a')$ is true.]

== Infeasibility

#definition[Let $f(x)$ be a function and consider the mathematical program, $ max& #h(10pt) f(x) \ "s.t."& #h(10pt) x in X. $ Then, the _optimal value_ of this program is $ sup {f(x) bar x in X}. $]

#remark[A few notes on this definition, 
- If $X = nothing$, the program is infeasible and the optimal value is $sup nothing = -oo$.
- If the program is unbounded, its optimal value is $oo$.
- If a mathematical program has finite optimal value, then it may or may not be an optimal soluton. For example, $sup_(x in RR) e^(-x) = 0$ but no feasible solution acquires this value.]

What can we  say about the feasibility of linear programming problems then? 

$ "(P)" #h(10pt) max #h(10pt) &c^T x #h(40pt) "(D)" #h(10pt) min #h(10pt) b^T y \ "s.t." #h(10pt) &A x <= b #h(55pt) "s.t." #h(10pt) A^T y = bold(0) \ & #h(110pt)y >= bold(0) $ 

Let $v_p$ be the optimal value of $(P)$ and $v_d$ the optimal value of $(D)$. By weak duality, $v_p <= v_d$. Consider the following table that considers all possibilities for $v_p, v_d$. We cross out all the combinations eliminated by #text(fill: blue, "weak duality"). 

#let colred(x) = text(fill: red, $#x$)
#let colblue(x) = text(fill: blue, $#x$)

#align(center)[
#table(
  columns: (auto, 1fr),
  stroke: 0pt,
  [], [$v_d$],
  table.cell(rowspan: 1, align: horizon, inset: 0pt, rotate(-90deg, reflow: true)[$v_p$]), [#table( columns: (auto, auto, auto, auto, auto), stroke: 0.2pt, inset: 5pt, align: horizon, [], [
    $oo$ \
  (infeasible)], [
    $in RR$ \ (no opt. solution)], [
      $in RR$ \ (with opt. solution)
    ], [
      $-oo$ \ (unbounded)
    ],
    [$-oo$\ (infeasible)],[],[],[],[], 
    [$in RR$\ (no opt. solution)], [],[],[], $colblue(times.big)$,
    [$in RR$\ (with opt. solution)], [],[],[], $colblue(times.big)$,
    [$oo$\ (unbounded)], [],[$colblue(times.big)$],[$colblue(times.big)$], $colblue(times.big)$
  )]
)]

#pagebreak()
= Strong Duality I

The central aim is to prove the following,

#prop("Strong Duality")[
  For the following primal and dual linear programs, 

$ "(P)" #h(10pt) max #h(10pt) &c^T x #h(40pt) "(D)" #h(10pt) min #h(10pt) b^T y \ "s.t." #h(10pt) &A x <= b #h(55pt) "s.t." #h(10pt) A^T y = c \ &#h(110pt) y >= bold(0), $

exactly one of the following holds 

+ The primal is unbounded and the dual is infeasible
+ The primal is infeasible and the dual is unbounded
+ Both primal and dual are infeasible
+ Both primal and dual have optimal feasible solutions with equal value 

]

#proof[
  We proceed by casework on the optimal value of the dual, $v_d$
  - $v_d = -oo$ \ Then, by weak duality, the primal is infeasible. 
  - $v_d = oo$ \ Here, the dual is infeasible. That is, $A^T y = c$ with $y >= bold(0)$ is infeasible. By Farkas' Lemma, we know that there exists $z in RR^n$ with $A z >= 0$ and $c^T z < 0$. Now, we claim that if there exists any primal feasible solution, the primal is unbounded. Suppose $x in RR^n$ is primal feasible. Then consider $x - lambda z$ for any $lambda >= 0$. This is feasible as, $ A(x - lambda z) &= A x - lambda A z <= b + bold(0) = b. $ Next, consider the objective, $ c^T (x - lambda z) = c^T x - lambda c^T z. $ Note that as $- c^T z > 0$, the primal objective becomes unbounded as $lambda -> oo$.  
  - $v_d in RR$ \ We want to find a primal feasible solution with value at least $v_d$ as that would imply that we have found an optimal solution too. This is equivalent to asking whether the following inequalities have a solution $ A x <= b \ -c^T x <= -v_d $ By Farkas' Lemma, we have two cases
    - there exists $x in RR^n$ with $A x <= b, -c^T x <= -v_d$. \ In this case, we have found a feasible solution with value at least $v_d$ and by weak duality, this is an optimal feasible solution. 
    - there exists $z in RR^(m + 1)$ with $(A^T #h(10pt) -c) #h(2pt) z = bold(0), z >= bold(0), (b #h(10pt) -v_d)^T y < 0$. \ Let $z = vec(y, lambda)$ such that $y >= bold(0), lambda >= 0$ and #numbered_eq($ A^T y - c lambda = 0 \ b^T y - v_d lambda < 0. $) Now, we show that $lambda > 0$. Suppose for contradiction, $lambda = 0$. Then, $A^T y = bold(0), b^T y  < 0$, and $y >= bold(0)$. Let $hat(y)$ be a feasible solution of the dual. Consider $hat(y) + lambda' y$ for all $lambda' >= 0$. This is feasible as $hat(y) + lambda' y >= bold(0)$ (all terms are nonnegative) and $ A^T (hat(y) + lambda' y) = A^T hat(y) + lambda' A^T y = c + bold(0) = c. $ Consider the dual objective, $ b^T (hat(y) + lambda' y) = b^T hat(y) + lambda' b^T y. $ As $lambda -> oo$, since $b^T y < 0$, the above expression goes to $-oo$. Therefore, the dual is unbounded. However, this contradicts the fact that $v_d in RR$! \ Hence, $lambda > 0$. We may then rewrite $(4)$ as $ A^T (y/lambda) = c, $ with $y\/lambda >= bold(0)$ and $b^T (y\/lambda) < v_d$. This contradicts the assumption that the optimal value of the dual is $v_d$. Thus, this case cannot occur!
    We have shown that whenever $v_d in RR$, the primal has an optimal feasible solution and $v_p = v_d$. Note that the dual of the dual is the primal. So, symmetrically, we also have that whenever $v_p in RR$, the dual also has an optimal feasible solution with $v_d = v_p$.
]

We finally completely fill up the table that considers all the possibilities for $v_p, v_d$.
We cross out all the combinations eliminated by #text(fill: blue, "weak duality") and #text(fill: maroon, "strong duality"). 

#let colred(x) = text(fill: maroon, $#x$)
#let colblue(x) = text(fill: blue, $#x$)

#align(center)[
#table(
  columns: (auto, 1fr),
  stroke: 0pt,
  [], [$v_d$],
  table.cell(rowspan: 1, align: horizon, inset: 0pt, rotate(-90deg, reflow: true)[$v_p$]), [#table( columns: (auto, auto, auto, auto, auto), stroke: 0.2pt, inset: 5pt, align: horizon, [], [
    $oo$ \
  (infeasible)], [
    $in RR$ \ (no opt. solution)], [
      $in RR$ \ (with opt. solution)
    ], [
      $-oo$ \ (unbounded)
    ],
    [$-oo$\ (infeasible)],[],[$colred(times.big)$],[$colred(times.big)$],[], 
    [$in RR$\ (no opt. solution)], [$colred(times.big)$],[$colred(times.big)$],[$colred(times.big)$], $colblue(times.big)$,
    [$in RR$\ (with opt. solution)], [$colred(times.big)$],[$colred(times.big)$],[], $colblue(times.big)$,
    [$oo$\ (unbounded)], [],[$colblue(times.big)$],[$colblue(times.big)$], $colblue(times.big)$
  )]
)]

#pagebreak()
= Strong Duality II

== A Retrospective and Alternative Proof

We present an alternative proof for the following result that we chalked up to the idempotence of taking duals. In fact, the proof we recover is pretty much a more rigorous look at the _intuitively-motivated_ proof of strong duality we gave in Chapter 2. 

#lemma[ If $x^star$ is an optimal feasible solution to the primal $max (c^T x bar A x <= b)$, there is an optimal feasible solution to the dual with matching value.]

The following lemma was "physically-motivated" in Chapter 2. Now, equipped with all the appropriate tools, we provide a mathematical proof for it!

#lemma[If $x^star$ is an optimal feasible solution to the primal, there exists $y in RR^m$, such that $ y &>= bold(0) \ sum_(i = 1)^m y_i (-a_i^T) + c &= 0 \ y_i (b_i - a_i x^star) &= 0, #h(5pt) forall i in [m]. $]
#proof[
  Fix $x^star$. Consider $A_=$. WIthout loss of generality, let $A_=$ just be the first $m'$ rows of $A$. \ Consider the following linear ineqaulities $ exists d in RR^n. A_= d <= bold(0), c^T d >= 1. $ We apply Farkas' Lemma to get two cases
  - such a $d$ exists.  \ Then, $x^star + epsilon d$, for sufficiently small $epsilon > 0$, is feasible in the primal and whose objective value is $ c^T (x^star + epsilon d) = c^T x^star + epsilon c^T d > c^T x ^star. $ This contradicts the optimality of $x^star$. 
  - such a $d$ does not exist. \ Then there exists $z in RR^m', lambda in RR$ such that $ A_=^T z - lambda c = bold(0) $ for $lambda > 0$ and $z >= bold(0)$. Thus, $ A^T_= (z/lambda) - c = bold(0) \ implies -A_=^T z/lambda + c = bold(0) \ implies sum_(j = 1)^(m') (z_j/lambda) (-a_j^T) + c = 0 $ Define $ y_j = cases(z_i/lambda #h(20pt) &"if" j <= m'\,, 0 &"otherwise".) $ Note that $y >= 0$. By our prior computation, $ sum_(j = 1)^m y_j (-a_j^T) + c = 0. $  Finally, for all $j in [m]$, we also have $y_j (b_j - a_j lambda^star) = 0.$ First, note that for all $j <= m'$, the constraint is binding at $x^star$, i.e. $b_j = a_j x^star$. Second, for all $m' < j <= m$, $y_j = 0$ by definition. 
]

== Covering and Packing

#definition[ We have a collection of entities $[n] = {1, dots, n}$ and subsets $S_1, dots, S_m subset.eq [n]$. In the _covering problem_, we want to choose $X subset.eq [n]$ such that 
+ $X sect S_j != nothing$ for every $j in [m]$,
+ $|X|$ is minimized.]

We can represent this problem as an integer program 

$ min #h(20pt) &sum_(i in [n]) x_i \ "s.t." #h(20pt) &sum_(i in S_j) x_i >= 1, forall j in [m], \ &x_i in {0, 1}, forall i in [n]. $

We relax this into the following linear program

$ min #h(20pt) &sum_(i in [n]) x_i \ "s.t." #h(20pt) &sum_(i in S_j) x_i >= 1, forall j in [m], \ &x_i >= 0, forall i in [n]. $

#remark[Note that, as this is a minimization problem, the constraint $x_i <= 1$ would be redundant. ]

This is known as the _fractional covering_ LP.

The dual of the fractional covering LP is known as the _fractional packing_ LP, 

$ max #h(20pt) &sum_(j in [m]) y_j \ "s.t." #h(20pt) &sum_(j in [m],\ i in S_j) y_i <= 1, forall i in [n], \ &y_j >= 0, forall j in [m]. $

When we restrict ourselves to $y_i in {0, 1}$, the problem is known as _packing_. For _packing_, we are interested in selecting the largest cardinality collection of disjoint subsets. 

Furthermore, note that 
$ min "integer covering" >= min "fractional covering" = "max fractional packing" >= max "integer packing." $

There are two things we will investigate
+ bounds on optimal values can be useful for finding approximately optimal solutions to our problem.
+ are there some specific covering/packing problems where teh inequalities are equalities?

We introduce $(a)$, by consider a greedy algorithm for minimum cover. 

#algorithm(caption: [`COVERING-GREEDY`], pseudocode-list[
  + $X = emptyset$
  + $U = [m]$
  + *while* $U != nothing$ *do*
    + *choose* some $i in [n]$ maximizing $abs({j in U bar i in S}) $
    + *define* $t = abs({j in U bar i in S})$ 
    + $X = X union {i}$
    + *for* $j in U$ such that $i in S_j$ *do*
      + $"price"(S_j) = 1/t$
    + *end*
    + $U = U \\ {j bar i in S_j}$
  + *end*
  + *return* $X$
])

Note that $abs(X) = sum_(j) "price"(S_j)$. If $y_j := "price"(S_j)$ were a fractional packing then that would imply that $X$ is optimal. 

#lemma[For all $i in [n]$, $ sum_(j in [m] \ i in S_j) "price"(S_j) <= H_m $ where $H_t = sum_(t' = 1)^t 1/t'$ is the $t$-th harmonic number.]

#proof[
  Fix some $i$, and let $k$ be the number of sets that contain $i$. Without loss of generality, let these sets be $S_1, dots, S_k$ and let them be ordered in the order in which they were hit by the greedy algorithm.

  Consider some $S_j$, with $j in [k]$ and the iteration of the algorithm in which $j$ ends up removed from $U$. At this point, there must be $abs({j in U bar i in S_j}) >= k - j + 1$. That is to say $i$ woud hit at least these many $k - j + 1$ new sets. So, the $i$-th element chosen by the algorithm must hit at least as many sets to. So, $t >= k - j + 1$ which implies $"price"(S_j) <= 1/(k - j + 1)$. Then, $ sum_(j in [m] \ i in S_j) "price" (S_j) &= sum_(j = 1)^k "price"(S_j) \ &= 1/k + 1/(k - 1) + 1/(k - 2) + dots + 1/2 + 1 \ &= H_k <= H_m $
]

#lemma[ $H_m <= ln m + 1$ ]

The prior lemma then implies that $y_j = "price"(S_j)\/H_m$ defines a fractional packing. Thus, the maximum fractional packing has size at least $ (sum_j "price"(S_j))/H_m = abs(X)/H_m. $
So, the minimum integer cover has size $>= abs(X)/H_m$. Thus, the integer covering produced by our algorithm is at most a factor $H_m$ larger than the minimum integer covering. 

