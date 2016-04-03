;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
;; (setq web-mode-content-types-alist
;;         '(("jsx" . "\\.js[x]?\\'")))
;; (setq web-mode-markup-indent-offset 2)
;; (setq web-mode-css-indent-offset 2)
;; (setq web-mode-code-indent-offset 2)
;;
;; (require 'flycheck)
;;
;; ;; disable jshint since we prefer eslint checking
;; (setq-default flycheck-disabled-checkers
;;                 (append flycheck-disabled-checkers
;;                             '(javascript-jshint)))
;;
;; ;; use eslint with web-mode for jsx files
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;;
;; ;; customize flycheck temp file prefix
;; (setq-default flycheck-temp-prefix ".flycheck")
;;
;; ;; disable json-jsonlist checking for json files
;; (setq-default flycheck-disabled-checkers
;;                 (append flycheck-disabled-checkers
;;                             '(json-jsonlist)))
