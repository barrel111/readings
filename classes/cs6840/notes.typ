#import "@local/preamble:0.1.0": *
#import "@preview/lovelace:0.2.0": *

#show: project.with(
  course: "CS6840",
  sem: "FA24",
  title: "Algorithmic Game Theory",
  subtitle: "Notes",
  authors: (
    "Shaleen Baral",
  ),
)

#show: setup-lovelace

= Introduction

= 

= 

#pagebreak()

= The Multiplicative Weights Algorithm
\

We consider the following model.

#algorithm(
  caption: [Binary Labeling with Expert Advice],
  pseudocode-list[
    - Time proceeds in rounds $(1, 2, dots, T)$
  - There are $K$ experts $(1, dots, K)$
  - There are $2$ labels $(0, 1)$
  - Each round proceeds as follows 
    - Each expert recommends a label
    - Algorithm $ALG$ guesses label after seeing recommendations
    - Correct label revealed
  - *Goal*: Minimize number of mistakes made by $ALG$.
  ]
)

We consider a few candidates for $ALG$.

First, consider the case where there exists a perfect expert. 

#algorithm(
  caption: [`MAJORITY`],
  pseudocode-list[
    - *Initialize* $w_i = 1$ for all $i in [k]$
    - *Set* an expert's weight to $0$ whenever it makes a mistake
    - *Predict* label $0$ or $1$ according to a weighted majority vote of experts. 
  ]
)

#lemma[`MAJORITY` makes $<= floor(log_2(K))$ mistakes. ]

#lemma[Every deterministic algorithm makes $>= floor(log_2(K))$ mistakes on some input.]

#lemma[For any randomized algorithm, $EE(ALG) <= 1/2 floor(log_2(K))$.]

Now, we move on to the case where there is no guarantee that a perfect expert exists. We want to make not-too-many mistakes than the best expert. 

#algorithm(
  caption: [`WEIGHTED MAJORITY`],
  pseudocode-list[
    - *Initialize* $w_i = 1$ for all $i in [k]$
    - *Whenever* an expert makes a mistake, multiply $w_i$ by $1 - epsilon$
    - *Predict* labels by taking a weighted majority vote. 
  ]
)

If $W_(t - 1)$ and $W_t$ are the combined weight after $t -1$ and $t$ rounds, respectively, then $ W_t <= (1 - epsilon/2) W_(t - 1). $ 

If there exists an expert making only $m$ mistakes then, $ (1 - epsilon)^m < W_T < (1 - epsilon/2)^(ALG) dot W_0 = (1 - epsilon/2)^(ALG). $ 

Then, $ m ln(1 - epsilon) < ln K + ALG ln (1 - epsilon/2) \ => - ALG ln (1 - epsilon/2) < ln K - m ln(1 - epsilon) \ => ALG < - (ln K)/(ln(1 - epsilon/2)) + m (ln(1 - epsilon))/(ln (1 - epsilon/2)) $

For $0 < epsilon < 1/2$, $epsilon < - ln (1 - epsilon) < epsilon + epsilon^2$. Thus, $ < (2 ln K)/epsilon + (2 + epsilon) m.  $

This $epsilon$ is also known as the _learning rate_. Note that the factor of $2$ in the term $2m$ is unavoidable for deterministic algorithms. 

#lemma[For every deterministic $ALG$, we have $ALG >= 2m$ on some input.]

= Randomized Multiplicative Weights (Hedge)

In this lecture, we introduce a randomized algorithm that saves the factor of $2$ from the previous lecture. The setting we consider is more general than the binary labelling with expert advice model we workedwith last time. 

#algorithm(
  caption: [`Model`],
  pseudocode-list[
    - $K$ experts 
    - At each time $t$:
      - $ALG$ selects a probability distribution over $[K]$, $p_t$,
      - `ADV` selects loss vector, $ell_t in [0, 1]^K$.
    - $p_t, ell_t$ may depend on ${(p_s, ell_s) bar s = 1, dots, t- 1}$
  ]
)
     Loss of expert $i$ is $ell_t (dot.c)$. Algorithm loss is $ inner(ell_t, p_t) = sum_{i = 1}^K ell_t(i) p_t(i)$. We also define $L_t = sum_( s = 1 )^t ell_s$. Then, our algorithm `HEDGE`$(epsilon)$ is specified by the following scheme for $t = 1, 2, dots, T$:

     $ w_t(i) &= (1- epsilon)^(L_(t- 1)(i)) \ W_t &= sum_{i = 1}^K w_t (i) \ p_t (i) &= (w_t (i))/W_t $

Now, we move on to the analysis of `HEDGE`. Consider, 

$ w_(t + 1) (i) = (1 - epsilon)^(L_t (i)) &= (1 - epsilon)^(L_(t - 1)(i) + ell_t(i)) \ &= (1 - epsilon)^(ell_t (i)) dot w_t (i) $

#lemma[For $x in [0, 1]$, $(1 - epsilon)^x <= 1 - epsilon x$.]

So, $ &<= [1 - epsilon ell_t (i)] dot w_t (i). $

Next, $ W_(t + 1) = sum_(i = 1)^K w_(t + 1) (i) &<= sum_(i = 1)^K [1 - epsilon ell_t (i)] w_t(i) \ &= sum_(i = 1)^K w_t(i) - epsilon sum_( i = 1 ) ell_t (i) p_t (i) W \ &= W_t [1 - epsilon inner(ell_t, p_t)] $

Then, 

$ ln W_(t + 1) &<= ln W_t + ln (1 - epsilon inner(ell_t, p_t)) \ &<= ln W_t - epsilon inner(ell_t, p_t) $

Inductively, 

$ ln W_(T + 1) <= ln W_0 - epsilon sum_(t = 1)^T inner(ell_t, p_t) $

If $i^star$ is the best expert, that is $L_T(i^star) = min_(j in [k]) L_T(i)$, then $ W_(T + 1) = sum_(i = 1)^K (1 - epsilon)^(L_T (i)) > (1 - epsilon)^(L_T (i^star)) \ => ln W_(T + 1) > ln (1 - epsilon) dot L_T (i^star). $

Thus, 

$ ln (1 - epsilon) dot L_T (i^star) &< ln K - epsilon sum_(t = 1)^T inner(ell_t, p_T) \ ==> sum_(t = 1)^T inner(ell_t, p_t) &<= (ln K)/epsilon + (- ln (1 - epsilon))/epsilon dot L_T (i^star) \ &< (ln K)/epsilon + (epsilon + epsilon^2)/epsilon dot L_T (i^star) \ &= (ln K)/epsilon + (1 + epsilon) L_T (i^star). $

How do we choose $epsilon$? One response would be to minimize _regret_. 

#definition[$ cal(R)^ALG (T) = underbrace(sum_(t = 1)^T inner(ell_t, p_T^ALG), ALG "loss") - underbrace(L_T (i^star), "best expert's loss") $]

For `HEDGE`, 

$ R^mono("HEDGE") (T) &< (ln K)/epsilon + epsilon L_T (i^star) \ &<= (ln K)/epsilon + epsilon T $

Optimizing the right hand side, we obtain $epsilon = sqrt((2 ln K)/T)$ which gives us 

$ R^mono("HEDGE")(T) < sqrt(2 (ln K) T). $

Shouldn't hope to do better than $sqrt(T)$. 

Another way of choosing $epsilon$ would be the _doubling trick_.  At time $t$, we don't yet know $L_T (i^star)$ but we do know $ min_(i in [K]) {L_(t - 1) (i)} $ Start by assuming $L_T (i^star)$ will be $<= 1$. 

Run epochs $0, 1, 2, dots$. In epoch $j$, we assume $L_T (i^star)$ will be $<= 2^j$ and set $epsilon$ to minimize $ (ln K)/epsilon + epsilon 2^j ==> epsilon = sqrt((2 ln K)/2^j). $ Then epoch $j$ ends with $min_(i) {L_(t - 1) (i) } > 2^j$. Then re-initialize `HEDGE` and begin epoch $j + 1$. Then, 

$ "Regret"("epoch" j) <= (ln K)/epsilon_j + epsilon_j 2^j = sqrt(2 (ln K) 2^j) $

If we end in epoch $J$, 

$ "Regret" &<= sum_(j = 0)^J sqrt(2 (ln K) 2^j) \ &= sqrt(2 ln K) sum_(j = 0)^J 2^(j \/ 2) = O(sqrt(2 (ln K) 2^J)) = O(sqrt(2 (ln K) L_T (i^star))) $

#remark[In the past two lecture, we considered learning in a setting with $K$ experts with associated loss $ell_t (i)$ at time $t$ for expert $i$. In the context of games, experts correspond to _strategies_ and loss corresponds to _cost_ or _utility_. That is, loss corresponds to the cost you undertake when you choose the given strategy, $ell_t (i) tilde c_i (s_i, s_(-i)^t) = ell_t (s_i)$.]


= Auctions

== Single Item Auctions

Consider a seller with a single item. There are $n$ players or bidders. We assume that each bidder $i$ has a nonnegative _valuation_ $v_i$ that is _private_, meaning it is unknown to the seller and other bidders. The auction proceeds in three steps
+ Ask all players for a bid $b_i$

+ Select winner. For now, we select $"argmax"_i b_i$.

+ Announce required payment. There may be a few choices for what this payment ought to be 
  - _first price_: Set _price_ = $max_i b_i$.

  - _second price_: Suppose $i^star = "argmax"_i b_i$. Then, _price_= $max_(i != i^star) b_i$.
  - _all pay_: Everyone pays their bid.

We adopt a _quasilinear utility model_, wherein $ u(b_i) = cases(0 &"if" b_i "loses,", p - v_i #h(16pt) &"if" b_i "wins at price" p.) $

#definition[A _dominant strategy_ is a strategy that is guaranteed to maximize a bidder's utility no matter what the other bidders do.]

#prop[In second-price auctions, the dominant strategy is to use $b_i = v_i$.]
#proof[ Consider a bidder $b_i$. Let $B = max_(j != i) b_j$. There are two cases to consider 
  - if $B > v_i$ then the maximum utility $b_i$ can receive is $0$, which is acquired by truthfully bidding $b_i = v_i$,
  - if $B < v_i$ then the maximum utility $b_i$ can receive is $v_i - B$ which is acquired by truthfully bidding $b_i = v_i$.]

For first price, analysis depends on the level of knowledge that bidders have. 

All-price auctions are more interesting to consider. Consider the following example. 
#example[There are two players with valuations $v_1 = v_2 = 1$. All players are also aware of this. There is no Pure Strategy Nash Equilibrium here. However, we propose a Mixed Strategy Nash Equilibrium where we pick $b_i in [0, 1]$ uniformly at random. Consider the vaue for player $1$ under the pure strategy $b_i = x$. The utility of this strategy is $-x + x = 0$. However, utility for randomization is also $0$.]

#example[Consider two players with valuations $v_1 = 1, v_2 = 2$ with both players aware of the valuations. Then we have a Mixed Nash Equilibrium at 
 $ b_2 in [0, 1] "uniformly random," $
 $ b_1 = cases(0 "prob 1/2,", [0, 1] "unif. prob 1/2.") $]

 = Learning in 2-Person Games 
