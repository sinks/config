(prelude-require-package 'evil)
(prelude-require-package 'evil-leader)
(prelude-require-package 'evil-smartparens)
(prelude-require-package 'evil-nerd-commenter)
(prelude-require-package 'evil-matchit)

(global-evil-leader-mode)
(evil-leader/set-key "/" 'projectile-find-file)
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
)

(global-evil-matchit-mode 1)
