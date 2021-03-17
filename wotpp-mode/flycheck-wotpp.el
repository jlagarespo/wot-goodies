;;; flycheck-wotpp.el --- Flychecker for the Wot++ programming language -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Jacob Lagares Pozo
;;
;; Author: Jacob Lagares Pozo <https://github.com/moonsheep>
;; Maintainer: Jacob Lagares Pozo <jlagarespo@iebesalu.cat>
;; Created: February 21, 2021
;; Version: 1.0.0
;; Keywords: wot++ w++ wotpp wpp flycheck
;; Homepage: https://github.com/jlagarespo/wotpp-mode
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;; Flycheck checker for the Wot++ programming language.
;; More info at https://github.com/Jackojc/wotpp
;;
;;; Code:

(require 'flycheck)

(flycheck-define-checker wotpp-validator
  "flycheck for wot++"
  :command ("w++" source "-Wall")
  :error-patterns
  ((error line-start "error @ [" (file-name) ":" line ":" column "]: " (message) line-end)
   (warning line-start "warning @ [" (file-name) ":" line ":" column "]: " (message) line-end))
  :modes wotpp-mode)

(add-to-list 'flycheck-checkers 'wotpp-validator)

(provide 'flycheck-wotpp)
;;; flycheck-wotpp.el ends here
