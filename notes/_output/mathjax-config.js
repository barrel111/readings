window.MathJax = {
  tex: {
    tags: "all",
    inlineMath: [['$','$'], ['\\(','\\)']],
    displayMath: [['$$','$$'], ['\\[','\\]']],
    processEscapes: true,
    processEnvironments: true,
    macros: {
      RR: "\\mathbb{R}",
      CC: "\\mathbb{C}",
      NN: "\\mathbb{N}",
      Pr: "\\mathbb{P}",
      E: "\\mathbb{E}",
      e: "\\mu",
      var: "\\sigma^2",
      Var: "\\mathbf{Var}",
      Cov: "\\mathbf{Var}",
      set: ["\\left\\{ #1 \\right\\}", 1],
      // vec: ["\\boldsymbol{#1}", 1],
      ind: "\\Bbb{1}",
      bits: "\\{0, 1\\}",
      sbits: "\\{\\pm 1\\}"
    }
  }
};
