;;; wotpp.el --- Major mode for the Wot++ programming language -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Jacob Lagares Pozo
;;
;; Author: Jacob Lagares Pozo <https://github.com/moonsheep>
;; Maintainer: Jacob Lagares Pozo <jlagarespo@iebesalu.cat>
;; Created: February 6, 2021
;; Version: 1.0.0
;; Keywords: wot++ w++ wotpp wpp
;; Homepage: https://github.com/jlagarespo/wotpp-mode
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;; Major mode for the Wot++ programming language.
;; More info at https://github.com/Jackojc/wotpp
;;
;;; Code:

(require 'flycheck-wotpp)

;; wot++ font lock
(defconst wpp-font-lock-keywords
  (list
   ;; keywords
   (cons "\\blet\\b" 'font-lock-keyword-face)
   (cons "\\bdrop\\b" 'font-lock-keyword-face)
   (cons "\\bmap\\b" 'font-lock-keyword-face)
   (cons "\\buse\\b" 'font-lock-keyword-face)
   (cons "\\bpush\\b" 'font-lock-keyword-face)
   (cons "\\bpop\\b" 'font-lock-keyword-face)

   ;; intrinsics
   (cons "\\brun\\b" 'font-lock-builtin-face)
   (cons "\\bfile\\b" 'font-lock-builtin-face)
   (cons "\\bassert\\b" 'font-lock-builtin-face)
   (cons "\\bpipe\\b" 'font-lock-builtin-face)
   (cons "\\berror\\b" 'font-lock-builtin-face)
   (cons "\\bslice\\b" 'font-lock-builtin-face)
   (cons "\\bfind\\b" 'font-lock-builtin-face)
   (cons "\\blength\\b" 'font-lock-builtin-face)
   (cons "\\bescape\\b" 'font-lock-builtin-face)
   (cons "\\blog\\b" 'font-lock-builtin-face)))

(defconst wpp-syntax-table
  (let ((table (make-syntax-table text-mode-syntax-table)))
	;; whitespace chars
	(modify-syntax-entry ?\s " " table)
	(modify-syntax-entry ?\t " " table)

	;; strings
	(modify-syntax-entry ?\" "\"\"" table)
	(modify-syntax-entry ?' "\"'" table)
	
	table))

(define-derived-mode wotpp-mode prog-mode "wot++"
  "Major mode for the Wot++ programming language."
  :group 'wotpp
  :syntax-table wpp-syntax-table
  (setq-local font-lock-defaults `(wpp-font-lock-keywords
                                   nil nil nil nil)))

(add-to-list 'auto-mode-alist '("\\.wpp\\'" . wotpp-mode))

(provide 'wotpp)
;;; wotpp.el ends here
