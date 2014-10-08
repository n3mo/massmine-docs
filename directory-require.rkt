#lang racket

(define (ulist . items)
  `(ul ,@items))

(define (item . text)
  `(li ,@text))

(provide ulist item)
