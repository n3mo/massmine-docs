(use hyde)
(use lowdown)

;; (define translate-markdown
;;   (make-external-translator
;;    "pandoc"
;;    (lambda () '("-f" "markdown" "-t" "html5" "--toc"))))
;; (translators (cons (list "md" translate-markdown) (translators)))


(translators (cons (list "md" markdown->html) (translators)))




