#import "@local/preamble:0.1.0": *

#show: project.with(
  course: "analysis of boolean functions",
  sem: "spring",
  title: "influence for decision trees",
  subtitle: "a precursor to the Aaronson-Ambainis conjecture",
  authors_label: "",
  authors: ("",),
  contents: false,
)

= Introduction

One fundamental questions that frequently arises in varried contexts concerns the reliance of a given function $f$ on its inputs. Furthermore, how does this dependence relate to the perceived complexity or simplicity of the function? Setting aside how we precisely define complexity for the moment, what might we expect? The prototypical ideal for simplicity is the set of constant functions, which correspondingly have no reliance on their input whatsoever. That is, can we extend this idea to show that, in general, simple non-constant functions must still concentrate their reliance on a few inputs?

For Boolean function $f: {0, 1}^n -> {0, 1}$, work by O'Donnell, Saks, Schramm, and Servedio (2005) provides a formal answer when "simplicity" is measured by decision tree depth. Their main result was that the variance $bold("Var")[f]$ (which may be viewed as being proportional to the distance of a Boolean-valued function from being constant) can be bounded by the influences $bold("Inf")_i [f]$ weighted by the query probabilities $delta_i [T]$, where $T$ is any decision tree computing $f$.

= Definitions

#definition[Given $f: FF^n_2 -> RR$, we write $"DT"(f)$ for the least depth of a decision tree computing $f$.]

#prop("Nisan and Szagedy '94")[Any $f: {-1, 1}^n -> {-1, 1}$ is computable by a decision tree of depth at most $"poly"(deg(f))$.]

#prop("Midrijanis '04")[Any $f: {-1, 1}^n -> {-1, 1}$ is computable by a decision tree of depth at most $deg(f)^3$.]

#definition[Given $f: FF^n_2 -> RR$, a _(zero-error) randomized decision tree $cal(T)$_ computing $f$ is formally defined to be a probability distribution over (deterministic) decision trees that compute $f$. Furthermore, for a randomized decision tree $cal(T)$, we define 
$ delta_i (cal(T)) = PP_[ bold(x) ~ {-1, 1}^n, \ bold(T) ~ cal(T) ] (bold(T) "queries" x_i) \
Delta (cal(T)) = EE_(bold(x) ~ {-1, 1}^n, \ bold(T) ~ cal(T)) ["# coordinates queried by" bold(T) "on" bold(x)] $ We also define $Delta(f)$ to be the minimum of $Delta(cal(T))$ over all randomized decisiont trees $cal(T)$ computing $f$.]

#lemma[For any $f: {-1, 1}^n -> {-1, 1}$, we have $Delta (f) <= "DT"(f)$.]

= Every Decision Tree Has An Influential Variable

#prop("OSSS inequality")[Let $cal(T)$ be any randomized decision tree computing $f: {-1, 1}^n -> {-1, 1}$. Then $ "Var"[f] <= sum_( i = 1 )^n delta_i (cal(T)) bold("Inf")_i [f]. $]

#corollary[For any $f:{-1, 1}^n -> {-1, 1}$ we have $ bold("MaxInf")[f] >= "Var"[f]/Delta(f) >= "Var"[f]/"DT"(f) >= "Var"[f]/deg(f)^3. $]

