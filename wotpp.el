;;; wotpp.el --- The Wot++ programming language -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Jacob Lagares Pozo
;;
;; Author: Jacob Lagares Pozo <https://github.com/moonsheep>
;; Maintainer: Jacob Lagares Pozo <jlagarespo@iebesalu.cat>
;; Created: February 21, 2021
;; Modified: April 30, 2021
;; Version: 1.0.0
;; Keywords: wot++ wotpp flycheck
;; Homepage: https://github.com/jlagarespo/wot-goodies
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;; Major mode for the Wot++ programming language, which includes on-the-fly
;; error checking and syntax highlighting.
;;
;;; Code:

(define-derived-mode wotpp-mode prog-mode "wot++"
  "Major mode for the wot++ programming language."
  :group 'wotpp
  :syntax-table wotpp-syntax-table
  (setq-local font-lock-defaults `(wotpp-font-lock-keywords
								   nil nil nil nil)))

(add-to-list 'auto-mode-alist '("\\.wpp\\'" . wotpp-mode))


;;; Flycheck
;;

(require 'flycheck)

(flycheck-define-checker wotpp-validator
  "flycheck for wot++"
  :command ("w++" "-c" "-i" "-Wall,no-func-redefined,no-var-redefined" "-s" (eval (file-name-directory buffer-file-name)) source)
  :error-patterns
  ((error line-start "(" (| "source" "normal") ") " (| "semantic" "lexical" "syntax" "encoding") " error: " (file-name) ":" line ":" column " => " (message) line-end)
   (error line-start "(eval) " (| "semantic" "lexical" "syntax" "encoding") " error: " (file-name) ":" (one-or-more digit) ":" (one-or-more digit) " => " (message) line-end)
   (warning line-start "(" (| "source" "normal") ") " (| "semantic" "lexical" "syntax" "encoding") " warning: " (file-name) ":" line ":" column " => " (message) line-end)
   (warning line-start "(eval) " (| "semantic" "lexical" "syntax" "encoding") " warning: " (file-name) ":" (one-or-more digit) ":" (one-or-more digit) " => " (message) line-end))
  :modes wotpp-mode)

(add-to-list 'flycheck-checkers 'wotpp-validator)


;;; Syntax highlighting:
;;

(defconst wotpp-font-lock-keywords
  (list
   ;; keywords
   (cons "\\blet\\b" 'font-lock-keyword-face)
   (cons "\\bdrop\\b" 'font-lock-keyword-face)
   (cons "\\bmatch\\b" 'font-lock-keyword-face)
   (cons "\\bpop\\b" 'font-lock-keyword-face)

   ;; intrinsics
   (cons "\\brun\\b" 'font-lock-builtin-face)
   (cons "\\bfile\\b" 'font-lock-builtin-face)
   (cons "\\bpipe\\b" 'font-lock-builtin-face)
   (cons "\\buse\\b" 'font-lock-builtin-face)
   (cons "\\berror\\b" 'font-lock-builtin-face)
   (cons "\\blog\\b" 'font-lock-builtin-face)
   (cons "\\bassert\\b" 'font-lock-builtin-face)))

(defconst wotpp-syntax-table
  (let ((table (make-syntax-table)))
	;; expression prefixes
	(modify-syntax-entry ?\ "'" table)
	(modify-syntax-entry ?! "'" table)

	;; strings
	(modify-syntax-entry ?\" "\"" table)
	(modify-syntax-entry ?' "\"" table)

	;; parenthesis and blocks
	(modify-syntax-entry ?\( "()" table)
	(modify-syntax-entry ?\) ")(" table)
	(modify-syntax-entry ?{ "(}" table)
	(modify-syntax-entry ?} "){" table)

	;; comments
	(modify-syntax-entry ?# ". 1b" table)
	(modify-syntax-entry ?\[ ".]2b" table)
	(modify-syntax-entry ?\] ">[b" table)

	table))

(provide 'wotpp)
;;; wotpp.el ends here
