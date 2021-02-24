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
   (cons "let" 'font-lock-keyword-face)
   (cons "var" 'font-lock-keyword-face)
   (cons "prefix" 'font-lock-keyword-face)
   (cons "map" 'font-lock-keyword-face)
   (cons "drop" 'font-lock-keyword-face)

   ;; intrinsics
   (cons "assert" 'font-lock-builtin-face)
   (cons "error" 'font-lock-builtin-face)
   (cons "file" 'font-lock-builtin-face)
   (cons "source" 'font-lock-builtin-face)
   (cons "escape" 'font-lock-builtin-face)
   (cons "eval" 'font-lock-builtin-face)
   (cons "run" 'font-lock-builtin-face)
   (cons "pipe" 'font-lock-builtin-face)
   (cons "slice" 'font-lock-builtin-face)
   (cons "find" 'font-lock-builtin-face)
   (cons "length" 'font-lock-builtin-face)
   (cons "log" 'font-lock-builtin-face)))

(defconst wpp-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?\[ "!<]" table)
    (modify-syntax-entry ?\] "!<[" table)
    (modify-syntax-entry ?\, "." table)
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
