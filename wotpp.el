;;; wotpp.el --- Wot++ for emacs
;;; https://github.com/jlagarespo/wot-goodies/blob/master/wotpp.el
;;; Commentary:
;;; Major mode and flycheck checker for the Wot++ programming language.
;;; https://github.com/Jackojc/wotpp
;;; Author: Jacob Lagares Pozo

;; wot++ font lock
(setq wotpp-highlights
      '(("let" . font-lock-keyword-face)
        ("run\\|eval\\|assert\\|file" . font-lock-function-name-face)
        ("\".*?\"" . font-lock-string-face)
        ("\#\\[ .* \]" . font-lock-comment-face)))

(define-derived-mode wotpp-mode prog-mode "wot++"
  "Major mode for the Wot++ programming language
  https://github.com/Jackojc/wotpp"
  (setq font-lock-defaults '(wotpp-highlights)))

;; wot++ flycheck
(require 'flycheck)

(flycheck-define-checker wotpp-validator
  "flycheck for wot++"
  :command ("w++" source)
  :error-patterns
  ((error line-start "error @ " line ":" column " -> " (message) line-end))
  :modes wotpp-mode)

(add-to-list 'flycheck-checkers 'wotpp-validator)

(provide 'wotpp)
;;; wotpp.el ends here
