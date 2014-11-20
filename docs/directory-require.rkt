#lang racket

(require racket/date pollen/decode txexpr hyphenate)

;;; Use for generating a 
(define (items . items)
  `(ul ,@items))

(define (item . text)
  `(li ,@text))

(define (link url text) `(a [[href ,url]] ,text))

(define (timestamp) (date->string (current-date)))

;;; the markdown parser used by pollen doesn't handle tables (as of
;;; 2014-11-18). For now, I send table formatting to pandoc to get the
;;; job done
(define (table . text)
  (with-output-to-string
    (let ((mytext (apply string-append text)))
      (lambda ()
	(system
	 (string-append "echo \"" mytext "\" | pandoc -f markdown -t html"))))))

;;; A convenient wrapper for making hanging indented bibliographic
;;; references. 
(define (reference . text) `(p [[class "bibreference"]] ,@text))

(define (root . items)
  (decode (make-txexpr 'root '() items)
          #:txexpr-elements-proc detect-paragraphs
          #:block-txexpr-proc (compose1 hyphenate wrap-hanging-quotes)
          #:string-proc (compose1 smart-quotes smart-dashes)
          #:exclude-tags '(style script pre code)))

(provide items item link timestamp root reference table)
