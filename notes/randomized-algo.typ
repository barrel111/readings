#import "@local/preamble:0.1.0": *
#import "@preview/lovelace:0.2.0": *

#show: setup-lovelace

#show: project.with(
  course: "",
  sem: "",
  title: "randomized algorithms",
  subtitle: "wow its different",
  authors: ("shaleen baral",),
  authors_label: "author:",
)

= Introduction

#algorithm(caption: [`KN-GREEDY`], pseudocode-list[
  + $O = emptyset$
  + $s = 0$
  + *sort* such that $w_1>= w_2>= dots.c >= w_n$.
  + *while* $i < n$ and $s + w_(i + 1)<= W$ *do*
    + $O = O union w_(i + 1)$
    + $s = s + w_(i + 1)$
    + $i = i + 1$
  + *end*
  + *return* $O$
])

== A Min-Cut Algorithm

== Las Vegas and Monte Carlo

== Binary Planar Partitions

== A Probabilistic Recurrence

== Computation Model and Complexity Classes

= Game-Theoretic Techniques

== Game Tree Evaluation

== The Minimax Principle

== Randomness and Non-uniformity

= Moments and Deviation

== Occupancy Problems

== The Markov and Chebyshev Inequalities

== Randomized Selection

== Two-Point Sampling

== The Stable Marriage Problem

== The Coupon Collector's Problem

