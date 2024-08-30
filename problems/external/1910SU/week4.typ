#import "@local/preamble:0.1.0": *
#import "@preview/cetz:0.2.2": canvas, plot, draw

#show: project.with(
  course: "1910SU",
  sem: "Summer",
  title: "Group Discussion: Trigonometry",
  subtitle: "Solutions",
  contents: false,
)

= Composition of Trigonometric and Inverse Trigonometric Functions.

\

== $tan (sec^(-1)(x))$
\

Let $theta = sec^(-1)(x) in [0, pi/2) union (pi/2, pi]$. Consider the right-angled triangle with unit hypotenuse and adjacent side of length $1/x$. One of the angles in this right-angled triangle must be $theta$. Pictorally,  

\
#align(center)[
#canvas({
  import draw: *
  let (a, b, c) = ((0, 0), (0, 3), (5, 0))
  line(a, b, c, close: true, name: "line")
  content(
    (2.5, 2),
    angle: -30deg, 
    [$1$]
  )
  content(
    (2, -1/2),
    [$1 slash x$]
  )
  arc((5, 0), start: 150deg, delta: 30deg, mode: "PIE", anchor: "origin")
  content((3.75, 0.35), [$theta$])
  rect(a,(rel: (1/2, 1/2)))
})]

The perpendicular side is then given by,
$ sin theta = sqrt(1 - 1/x^2) $

Then, 
$ tan (sec^(-1)(x)) = tan(theta) = (sin theta)/(cos theta) = x dot sqrt(1 - 1/x^2) = x/abs(x) dot sqrt(x^2 - 1). $

== $csc (cot^(-1)(x))$
\ 

Let $theta = cot^(-1)(x) in [0, pi]$. Consider the right-angled triangle with adjacent side of length $x$ and perpendicular side of unit length. One of the angles in this right-angled triangle must be $theta$. Pictorally, 

\

#align(center)[
#canvas({
  import draw: *
  let (a, b, c) = ((0, 0), (0, 3), (5, 0))
  line(a, b, c, close: true, name: "line")
  content(
    (-0.5, 1.5),
    [$1$]
  )
  content(
    (2, -1/2),
    [$x$]
  )
  arc((5, 0), start: 150deg, delta: 30deg, mode: "PIE", anchor: "origin")
  content((3.75, 0.35), [$theta$])
  rect(a,(rel: (1/2, 1/2)))
})]

Then the hypotenuse has length $sqrt(1 + x^2)$. Finally, 

$ sin(cot^(-1)(x)) = 1/sin(theta) = sqrt(1 + x^2). $

== $sin (cos^(-1)(x))$
\ 

Let $theta = cos^(-1)(x) in [0, pi]$. Consider the right-angled triangle with unit length hypotenuse and adjacent side of length $x$. One of the angles in this right-angled triangle must be $theta$. Pictorally, 

\

#align(center)[
#canvas({
  import draw: *
  let (a, b, c) = ((0, 0), (0, 3), (5, 0))
  line(a, b, c, close: true, name: "line")
  content(
    (2.5, 2),
    angle: -30deg, 
    [$1$]
  )
  content(
    (2, -1/2),
    [$x$]
  )
  arc((5, 0), start: 150deg, delta: 30deg, mode: "PIE", anchor: "origin")
  content((3.75, 0.35), [$theta$])
  rect(a,(rel: (1/2, 1/2)))
})]

Then, 

$ sin (cos^(-1)(x)) = sin theta = sqrt(1 - x^2). $

= Sum and Difference Formulas. 
\

Label the points on the provided diagram as follows. 

#align(center)[
#canvas({
  import draw: *
  rect((0, 0),(rel: (6, 4)))
  let (a, b, c) = ((0, 0), (2, 4), (6, 1.5))
  line(a, b, c, close: true)
  content((-0.25, -0.25), [$A$])
  content((2, 4.25), [$C$])
  content((0, 4.25), $B$)
  content((6, 4.25), $D$)
  content((6.25, 1.5), $E$)
  content((6.25, 0), $F$)
})]

In $triangle.t A B C$, we have

$ A B = cos beta cos alpha, $
$ B C = sin beta cos alpha. $

In $triangle.t C D E$, we have 
$ C D = cos beta sin alpha, $
$ D E = sin beta sin alpha. $

In $triangle.t A E F$, we have
$ E F = cos(alpha + beta), $ 
$ A F = sin (alpha + beta). $ 

Note further that, 

$ E F = A B - D E ==> cos(alpha + beta) = cos alpha cos beta - sin beta sin alpha, $
$ A F = B C + C D implies sin (alpha + beta) = sin alpha cos beta + cos alpha sin beta. $

