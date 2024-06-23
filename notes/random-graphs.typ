#import "@local/preamble:0.1.0": *
#import "@preview/fletcher:0.4.3" as fletcher: diagram, node, edge
#import "@preview/commute:0.2.0": node, arr, commutative-diagram

#show: project.with(
  course: "Mathematics",
  sem: "Summer",
  title: "Random Graphs",
  subtitle: "a first course",
  authors: ("Shaleen Baral",),
)

= Introduction to Asymptotics

#definition(
  "Asymptotic Equivalence",
)[We say that $f(n)$ is _asymptotically equivalent_ to $g(n)$ and write $f(n) tilde g(n)$ if $f(n) slash g(n) arrow 1$ as $n arrow infinity$.]

#definition[We write $f(n) in O(g(n))$ when there is a $C > 0$ such that for all
  sufficiently large $n$, $ abs(f(n)) <= C abs(g(n)). $]

#definition[We write $f(n) = Omega(g(n))$ when there is a $c > 0$ such that for all
  sufficiently large $n$, $ abs(f(n)) >= c abs(g(n)). $]

#lemma[ Equivalently, $f(n) = O(g(n))$ iff $limsup_(n to infinity) abs(f(n)) slash abs(g(n)) < infinity.$ ]

#proof[ For convenionce let $Q(n) = abs(f(n)) slash abs(g(n))$. First, the foward
  direction. We note that we have $0 <= Q(n) <= C$. As $Q(n)$ is bounded $limsup Q(n)$ clearly
  exists and is finite (the sequence ${sup_(n >= k) Q(n)}_(k in N)$ is decreasing
  and as it is bounded by below, must converge).

  Conversely, assume $limsup Q(n) < infinity$. Let $C = max(lim sup Q(n) + 1, 1)$.
  As $C > limsup Q(n)$, it is an eventual upper bound for $Q(n)$. That is to say,
  there exists $N in NN_(>0)$ such that for all $n >= N$ $ abs(f(n)) <= C abs(g(n)). $ ]

#lemma[ Equivalently, $f(n) = Omega(g(n))$ iff $liminf_(n to infinity) abs(f(n)) slash abs(g(n)) < infinity. $ ]

#proof[ Same idea as above. ]

#definition[We write $f(n) = Theta(g(n))$ when there are constants $c, C > 0$ such that $ c abs(g(n)) <= f(n) <= C abs(g(n)). $ Equivalently, $f(n) = Theta(g(n))$ iff $f(n) = Omega(g(n))$ and $f(n) = O(g(n))$.
]

#lemma[If $f_1, f_2 in O(g)$ then $f_1 + f_2 = O(g)$.]

#proof[ There exists $C_1, C_2, N_1, N_2 > 0$ such that for $n > N_1$ and $n > N_2$ $ abs(f_1) &<= C_1 abs(g) \ abs(f_2) &<= C_2 abs(g). $ Then,
  for $N = max(N_1, N_2)$, we can say that if $n > N$ then $ |f_1 + f_2| <= (C_1 + C_2) |g|. $ ]

#lemma[ If $f_1, f_2 in Omega(g)$ then $f_1 + f_2 in Omega(g)$ too. ]

#proof[ Same idea as above. ]

#lemma[ If $f_1, f_2 in Theta(g)$ then $f_1 + f_2 in Theta(g)$ too. ]
#proof[ Follows from prior two lemmas and definition of $Theta$. ]

#definition[We write $f(n) = o(g(n))$ (or $f(n) << g(n)$) if $f(n) slash g(n) arrow 0$ as $n arrow infinity$.
]
#definition[We write $f(n) = omega(g(n))$ (or $f(n) >> g(n)$) if $f(n) slash g(n) arrow infinity$ as $n arrow infinity$.
]
