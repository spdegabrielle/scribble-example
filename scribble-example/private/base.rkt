#lang sweet-exp racket/base

provide define-examples-form
        define-persistent-examples-form

require scribble/eval
        racket/splicing


(define-syntax-rule (define-examples-form id require-spec ...)
  (begin
    (define (eval-factory)
      (define base-eval (make-base-eval))
      (base-eval '(require require-spec)) ...
      base-eval)
    (define-syntax-rule (id datum (... ...))
      (examples #:eval (eval-factory) datum (... ...)))))

(define-syntax-rule (define-persistent-examples-form id require-spec ...)
  (begin
    (define (eval-factory)
      (define base-eval (make-base-eval))
      (base-eval '(require require-spec)) ...
      base-eval)
    (define-syntax-rule (id examples-id)
      (begin
        (splicing-let ([the-eval (eval-factory)])
          (define-syntax-rule (examples-id datum (... (... ...)))
            (examples #:eval the-eval datum (... (... ...)))))))))
