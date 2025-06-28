#import "@local/preamble:0.1.0": *
#import "@preview/lovelace:0.3.0": *

#show: project.with(
  course: "Algorithms",
  sem: "Winter",
  title: "Computational Learning",
  subtitle: "",
  // authors: ("Shaleen Baral",),
)

#let algo(title, body) = {
  // Use the robust table-based layout for guaranteed full-width.
  block(
    width: 100%,
  )[
    #pseudocode-list(
      booktabs: true,
      booktabs-stroke: 1pt + black,
      title: block(width: 100%)[#title], body
    )
  ]
}

= PAC Model

= Occam's Razor

= Vapnik-Chervonenkis Dimension
