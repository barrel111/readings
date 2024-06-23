#import "@local/preamble:0.1.0": *
#import "@preview/fletcher:0.5.0" as fletcher: diagram, node, edge

#show: project.with(
  course: "CS",
  sem: "Summer",
  title: "Online Algorithms",
  subtitle: "Problems",
  authors: ("Shaleen Baral",),
)

#set enum(indent: 15pt, numbering: "a.")
#let OPT = `OPT`
#let ALG = `ALG`

= Introduction
== Komm 1.1

No, this does not change the analysis. The analysis for the approximation ratio
comes from showing $ALG >= W/2.$ The proposed changes to the algorithm only
incrases the value of $ALG$ for any instance, so this lower bound is still
effective. Furthermore, the family of instances provided to show that $r = 2$ is
tight for the original algorithm also shows that $r = 2$ is tight for this
algorithm.

== Komm 1.2

Consider the following instance on $K_4$.

#align(center)[
#diagram(
 node-stroke: black + 0.5pt,
 spacing: (14mm, 5mm),
 node((0,0), [1], name: <1>), // double stroke
 node((1,0), [2], name: <2>),
 node((2,0), [3], name: <3>),
 node((3,0), [4], name: <4>),
 edge(<1>, <2>, "<->", label: "1", label-pos: 0.5),
 edge(<2>, <3>, "<->", label: "1", label-pos: 0.5),
 edge(<3>, <4>, "<->", label: "1", label-pos: 0.5),
 edge(<1>, <3>, "<->", bend:40deg, label: "2"),
 edge(<1>, <4>, "<->", bend:50deg, label: $gamma$),
 edge(<2>, <4>, "<->", bend:-40deg, label: "2")
)]

Then the approximation ratio is,

$ ALG/OPT = (3 + gamma)/(6) = 1/2 + gamma/6. $

By making $gamma$ arbitrarily large, we may then make the approximation ratio arbitrarily large.

== Komm 1.3

We prove this by induction. Let $P(k)$ be the statement that all edges added in
the first $k$ rounds are in the minimum spanning tree.
