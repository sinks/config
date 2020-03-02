;;; private/hlissner/init.el -*- lexical-binding: t; -*-

;; An extra measure to prevent the flash of unstyled mode-line while Emacs is
;; booting up (when Doom is byte-compiled).
(setq-default mode-line-format nil)

(set! :theme 'doom-vibrant)

(set! :font "Hack" :size 16)
(set! :variable-font "Fira Sans" :size 16)
(set! :unicode-font "DejaVu Sans Mono" :size 16)

;; host-specific settings
(pcase (system-name)
  ("lincoln-pc")
  ;; ((or "proteus" "halimede")
   ;; smaller screen, smaller fonts
  ;; ("nereid")
  ;; ("io")
  ;; ("sao")
  )

