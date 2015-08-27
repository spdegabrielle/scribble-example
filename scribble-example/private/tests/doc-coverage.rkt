#lang racket/base

(module+ test
  (require doc-coverage
           scribble-example)

  (check-all-documented 'scribble-example))
