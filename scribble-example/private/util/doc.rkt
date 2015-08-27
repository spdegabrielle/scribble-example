#lang sweet-exp racket/base

require
  scribble/eval
  scribble-example
  "scribble-include-no-subsection.rkt"
  for-label scribble-example
            scribble/eval
            racket/base
            racket/list
            racket/contract

(provide
 scribble-example-examples
 doc-render-examples
 (all-from-out "scribble-include-no-subsection.rkt")
 (for-label
  (all-from-out scribble-example
                scribble/eval
                racket/base
                racket/list
                racket/contract)))


(define-examples-form scribble-example-examples scribble-example)

(define-syntax-rule (doc-render-examples e ...)
  (nested "Renders like:\n"
          (nested #:style 'inset (nested #:style 'inset e ...))))
