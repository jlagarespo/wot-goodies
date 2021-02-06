;;; wotpp.el -*- lexical-binding: t; -*-

;; wot++ font lock
(setq wotpp-highlights
      '(("let" . font-lock-keyword-face)
        ("\".*?\"" . font-lock-string-face)
        ("#\[.*\]" . font-lock-comment-face)))

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
