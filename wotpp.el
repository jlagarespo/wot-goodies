;;; wotpp.el --- Wot++ for emacs
;;; https://github.com/jlagarespo/wot-goodies/blob/master/wotpp.el
;;; Commentary:
;;; Major mode and flycheck checker for the Wot++ programming language.
;;; https://github.com/Jackojc/wotpp
;;; Author: Jacob Lagares Pozo

;; wot++ font lock
(setq wotpp-highlights
      '(("\#\\[.*\]" . font-lock-comment-face)
        ("let\\|prefix\\|map" . font-lock-keyword-face)
        ("let .*\\>" . font-lock-function-name-face)
        ("\\<assert\\>\\|\\<error\\>\\|\\<file\\>\\|\\<source\\>\\|\\<escape\\>\\|\\<eval\\>\\|\\<run\\>\\|\\<pipe\\>\\|\\<slice\\>\\|\\<find\\>\\|\\<length\\>\\|\\<log\\>" . font-lock-function-name-face)))

(define-derived-mode wotpp-mode prog-mode "wot++"
  "Major mode for the Wot++ programming language
  https://github.com/Jackojc/wotpp"
  (setq font-lock-defaults '(wotpp-highlights)))

(add-to-list 'auto-mode-alist '("\\.wpp\\'" . wotpp-mode))

;; wot++ flycheck
(require 'flycheck)

(flycheck-define-checker wotpp-validator
  "flycheck for wot++"
  :command ("w++" source)
  :error-patterns
  (
   (error line-start "error @ " line ":" column ": " (message) line-end)
   (warning line-start "warn @ " line ":" column ": " (message) line-end))
  :modes wotpp-mode)

(add-to-list 'flycheck-checkers 'wotpp-validator)

(provide 'wotpp)
;;; wotpp.el ends here
