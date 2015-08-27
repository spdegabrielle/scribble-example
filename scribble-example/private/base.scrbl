#lang scribble/manual

@(require "util/doc.rkt")

@defform[(define-examples-form id require-spec ...)]{
  Binds @racket[id] as a syntactic form similar to @racket[examples],
  but with an evaluator auto constructed for each example set. The
  evaluator uses @racket[racket/base] as it's language and requires
  each @racket[require-spec] prior to evaluating the examples.
  @scribble-example-examples[
    (define-examples-form racket-list-examples racket/list)
    (racket-list-examples
      (first '(1 2 3))
      (rest '(1 2 3)))
]}

@defform[(define-persistent-examples-form id require-spec ...)]{
  Like @racket[define-examples-form], but instead of binding
  @racket[id] as an example rendering form, it binds it as a syntactic
  rule that @italic{creates} an example rendering form.
  @scribble-example-examples[
    (define-persistent-examples-form racket-list-persistent-examples racket/list)
    (racket-list-persistent-examples a-racket-list-example-evaluator)
    (a-racket-list-example-evaluator (define foo (first '(1 2 3))))
    (a-racket-list-example-evaluator foo)
  ]

  This defines example evaluators that persist state and definitions,
  allowing for a complex example to be split up into multiple examples
  seperated by prose.
}
