#lang racket

(require racket/date)

;;; Use for generating a 
(define (items . items)
  `(ul ,@items))

(define (item . text)
  `(li ,@text))

(define (link url text) `(a [[href ,url]] ,text))

(define (timestamp) (date->string (current-date)))

(provide items item link timestamp)
