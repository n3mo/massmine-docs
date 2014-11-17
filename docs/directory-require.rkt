#lang racket

(require racket/date pollen/decode txexpr hyphenate)

;;; Use for generating a 
(define (items . items)
  `(ul ,@items))

(define (item . text)
  `(li ,@text))

(define (link url text) `(a [[href ,url]] ,text))

(define (timestamp) (date->string (current-date)))

;;; A convenient wrapper for making hanging indented bibliographic
;;; references. 
(define (reference . text) `(p [[class "bibreference"]] ,@text))

(define (root . items)
  (decode (make-txexpr 'root '() items)
          #:txexpr-elements-proc detect-paragraphs
          #:block-txexpr-proc (compose1 hyphenate wrap-hanging-quotes)
          #:string-proc (compose1 smart-quotes smart-dashes)
          #:exclude-tags '(style script pre code)))

(provide items item link timestamp root reference)
