; Akira Kyle - akyle@cmu.edu

(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 100))
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq-default cursor-type 'bar)
(setq fill-column 80)
(setq doc-view-continuous t)
(put 'erase-buffer 'disabled nil)

(add-hook 'text-mode-hook 'auto-fill-mode)
(global-visual-line-mode 1)

(setq
  ;; set ~/.emacs.d/saves to be dir for all autosave, recovery, and backup files
  backup-by-copying t      ; don't clobber symlinks
  backup-directory-alist '(("." . "~/.emacs.d/saves/"))
  auto-save-file-name-transforms `((".*" ,"~/.emacs.d/saves/" t))
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(put 'dired-find-alternate-file 'disabled nil)
(setq dired-listing-switches "-alh")

; don't know why this has to be here to work does it even work?
(require 'dired)
(define-key dired-mode-map (kbd ";") 'evil-ex)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; No trailing spaces
(setq require-final-newline t) ;; Good practice.

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-?") 'help)

;(use-package Wrap
;  :diminish wrap)
;(eval-after-load "Wrap" '(diminish 'wrap))
;(use-package simple
;  :diminish visual-line-mode)

(defconst my-package-list
  '(better-defaults
    base16-theme
    exec-path-from-shell
    smooth-scrolling
    magit
    highlight-numbers
    whitespace
    rainbow-delimiters
    evil-leader
    evil
    powerline-evil
    diminish
    key-chord
    helm
    helm-company
    auctex
    yasnippet
    semantic
    ycmd
    company-ycmd
    flycheck-ycmd
    company
    company-auctex
    ;company-c-headers
    ;company-jedi
    company-math
    ;company-flx
    ;flx
    flycheck
    undo-tree
    c0-mode
    sml-mode
    ))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq use-package-always-ensure t)
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)

(diminish 'visual-line-mode)

(use-package tramp
  :init
  (setq
   tramp-default-method "ssh"
   explicit-shell-file-name "bash")
)

(use-package cc-mode
  :init
  (setq
   c-default-style "k&r"
   c-basic-offset 4)
)

(use-package f90
  :init
  (setq
   f90-continuation-indent 2
   f90-do-indent 2
   f90-if-indent 2
   f90-type-indent 2)
)

(use-package org
  :init
  (setq org-log-done t)
  (setq org-agenda-files (list "~/Documents/todo.org"))
)

(use-package undo-tree
  :diminish undo-tree-mode
  :config (unbind-key "C-?" undo-tree-map))

(use-package base16-theme
  :init (load-theme `base16-default-dark t))

(use-package hideshow ;; enable code folding
  :init (add-hook 'prog-mode-hook 'hs-minor-mode))

(use-package better-defaults
  :init (save-place-mode) ;necessary in emacs 25.1
  :config (menu-bar-mode 1))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package highlight-numbers
  :init (add-hook 'prog-mode-hook 'highlight-numbers-mode))

(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook
                  LaTeX-mode-hook
                  text-mode-hook
                  conf-mode-hook))
    (add-hook hook #'whitespace-mode))
  :config
  (setq whitespace-style '(face lines-tail))
  (setq whitespace-line-column nil))
;  :diminish whitespace-mode)

(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package smooth-scrolling
  :init (setq smooth-scroll-margin 2)
  :config (smooth-scrolling-mode 1))

;; Evil Setup
(use-package evil
  :bind
  (:map evil-normal-state-map
        ("C-f" . evil-forward-char)
        ("C-b" . evil-backward-char)
        ("C-d" . evil-delete-char)
        ("C-n" . evil-next-line)
        ("C-p" . evil-previous-line)

        (";" . evil-ex)
        ("j" . evil-next-visual-line)
        ("k" . evil-previous-visual-line)
   :map evil-insert-state-map
        ("C-f" . evil-forward-char)
        ("C-b" . evil-backward-char)
        ("C-d" . evil-delete-char)
        ("C-n" . evil-next-line)
        ("C-p" . evil-previous-line)

        ("C-g" . evil-normal-state)
   :map evil-visual-state-map
        ("C-f" . evil-forward-char)
        ("C-b" . evil-backward-char)
        ("C-d" . evil-delete-char)
        ("C-n" . evil-next-line)
        ("C-p" . evil-previous-line)
        )
  :init
  (use-package evil-leader
    :init
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "SPC" 'evil-ex-nohighlight
      "c" 'calc-dispatch
      "a" 'org-agenda
      "h" 'help
      "x" 'helm-M-x
      "b" 'helm-mini ;helm-buffers-list
      "f" 'helm-find-files
;(evil-leader/set-key "k" 'kill-this-buffer)
;(evil-leader/set-key "m" 'helm-mini)
      "s" 'ycmd-toggle-force-semantic-completion
      "n" 'flycheck-next-error
      "p" 'flycheck-previous-error
      "e" '(lambda () (interactive)(save-buffer)(recompile)))
    (evil-leader/set-key-for-mode 'latex-mode
      "e" '(lambda () (interactive)(save-buffer)(TeX-command-master)))
    )
  (setq
   evil-move-cursor-back nil
   evil-auto-indent nil)
  :config
  (evil-mode 1)
  (evil-set-initial-state 'compilation-mode 'normal)
  ;(evil-ex-define-cmd "bd[elete]" 'kill-buffer) ;; so bd doesn't close window
  (evil-ex-define-cmd "bd[elete]" 'kill-this-buffer)
  (evil-ex-define-cmd "e " 'helm-find-files)
  (evil-ex-define-cmd "b " 'helm-buffers-list)
  ;; Fixes bug when using evil seach
  (evil-select-search-module 'evil-search-module 'evil-search)
  (evil-define-key 'normal comint-mode-map (kbd "C-p") 'comint-previous-input
                                           (kbd "C-n") 'comint-next-input)
  (evil-define-key 'insert comint-mode-map (kbd "C-p") 'comint-previous-input
                                           (kbd "C-n") 'comint-next-input)
)


(use-package powerline-evil
;; modified powerline-evil-center-color-theme to get rid of character count
;; that just took up space. ( I just deleted this (powerline-raw '(10 "%i")) )
;; I also removed the git remote name from git status line
  :config (my-powerline-evil-vim-color-theme))

(use-package key-chord
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map  "hh" 'evil-normal-state))

(use-package compile
  :bind (:map compilation-mode-map
              ("h" . evil-backward-char)))
;(define-key compilation-mode-map (kbd "h") 'evil-backward-char)

(use-package helm
  :bind
  (("M-x" . helm-M-x)
   :map helm-map
        ("C-h" . helm-ff-delete-char-backward)
        ("C-z" . helm-select-action)
        ("<tab>" . helm-execute-persistent-action)
   :map helm-find-files-map
        ("M-c" . helm-ff-run-copy-file)
        ("M-r" . helm-ff-run-rename-file)
        ("M-d" . helm-ff-run-delete-file)
  :map helm-buffer-map
        ("M-d" . helm-buffer-run-kill-buffers)
  )
  :init
  (setq
   helm-mode-fuzzy-match t
   helm-completion-in-region-fuzzy-match t
   helm-split-window-in-side-p t
   helm-autoresize-max-height 40
   helm-autoresize-min-height 40
   helm-ff-tramp-not-fancy nil) ;make helm display remote files in color
  :config
  (helm-mode 1)
  (helm-autoresize-mode t)
)

;(require 'helm-company)
;(define-key company-mode-map (kbd "C--") 'helm-company)
;(define-key company-active-map (kbd "C--") 'helm-company)

(use-package yasnippet
  :config (yas-global-mode 1))

;(require 'semantic)
;(global-semanticdb-minor-mode 1)
;(global-semantic-idle-scheduler-mode 1)
;(global-semantic-stickyfunc-mode 1)
;(semantic-mode 1)

(use-package ycmd
  :init
  (add-hook 'after-init-hook #'global-ycmd-mode)
  (set-variable 'ycmd-server-command
                '("python" "/Users/akyle/Developer/git-repos/ycmd/ycmd"))
  (set-variable 'ycmd-global-config
                "/Users/akyle/Developer/.ycm_extra_conf.py")
  :config
  (ycmd-toggle-force-semantic-completion)
)

;(require 'ycmd-eldoc)
;(add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)

(require 'company)
(use-package company
  :bind
  (:map company-active-map
        ("C-h" . nil)
        ("C-?" . company-show-doc-buffer)
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("<tab>" . company-complete-selection)
        ("TAB" . company-complete-selection)
   :map yas-minor-mode-map
        ("<tab>" . nil)
        ("TAB" . nil)
;(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
  )
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (setq
   company-require-match 'never
   company-selection-wrap-around t
   company-idle-delay 0
   company-minimum-prefix-length 2
   company-tooltip-align-annotations t
   company-dabbrev-downcase nil)
  ;(setq company-auto-complete t)
  ;(setq company-show-numbers t)
  (setq company-frontends
        '(company-pseudo-tooltip-unless-just-one-frontend
          company-preview-frontend
          company-echo-metadata-frontend))
  (require 'color)
  (let ((bg (face-attribute 'default :background)))
    (custom-set-faces
     `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
     `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
     `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
     `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
     `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

  ; disable company mode in shells
  (add-hook 'comint-mode-hook (lambda () (company-mode 0)))

  (defvar global-backends
        '(company-math-symbols-unicode
          company-files
          company-capf
          company-dabbrev))
  (setq company-backends global-backends)
;(setq company-backends '(company-capf))
  :config
  (unbind-key "<return>" company-active-map)
  (unbind-key "RET" company-active-map)
)

;(require 'company-flx)
;(company-flx-mode 1) ; if slow set company-flx-limit lower
;(add-to-list 'completion-styles-alist
;                     '(fuzzy
;                       company-flx-try-completion
;                       company-flx-all-completions
;                       "An intelligent fuzzy matching completion style."))
;(setq completion-styles '(fuzzy))
;(setq completion-category-overrides '((buffer (styles fuzzy))))
;(setq completion-category-overrides nil)
;
;(add-to-list 'company-transformers #'company-flx-transformer t)
;(add-hook 'c-mode-hook (lambda ()
;          (setq-local completion-at-point-functions '(semantic-completion-at-point-function t))))

(use-package company-ycmd
  :init
  (add-hook 'prog-mode-hook
            (lambda () (make-local-variable 'company-backends)
              (add-to-list 'company-backends
                           '(:sorted company-ycmd :with company-yasnippet))))
  :config
;(company-ycmd-setup) ; we manually add backends below instead
)

;(defun set-prog-backends ()
;  (make-local-variable 'company-backends)
;  (add-to-list 'company-backends '(:sorted company-ycmd :with company-yasnippet)))
;    (setqlocal company-backends '((company-semantic company-yasnippet))))

;(require 'company-c-headers)
;(add-hook 'c-mode-hook 'set-prog-backends)
;(add-hook 'c++-mode-hook 'set-prog-backends)
;(add-hook 'python-mode-hook 'set-prog-backends)
;(add-to-list 'ycmd-file-type-map '(f90-mode "generic"))
;(add-hook 'f90-mode-hook 'set-prog-backends)

(use-package sml-mode)
;(add-to-list 'ycmd-file-type-map '(sml-mode "generic"))
;(add-hook 'sml-mode-hook 'set-prog-backends)
;(add-hook 'sml-mode-hook
;          (lambda ()
;            (add-to-list (make-local-variable 'company-backends)
;                         'company-dabbrev-code)))

(use-package company-math)

(use-package company-auctex
  :init
  (add-to-list 'ycmd-file-type-map '(latex-mode "latex"))
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (make-local-variable 'company-backends)
              (set-prog-backends)
              (add-to-list 'company-backends 'company-latex-commands)
              (add-to-list 'company-backends 'company-math-symbols-latex)
              (add-to-list 'company-backends 'company-auctex-labels)
              (add-to-list 'company-backends 'company-auctex-bibs)
              (add-to-list 'company-backends '(company-auctex-macros
                                               company-auctex-symbols
                                               company-auctex-environments))))
  :config
;(company-auctex-init) ; we manually add backends below instead
)

(use-package flycheck
  :init (add-hook 'after-init-hook 'global-flycheck-mode))

(use-package flycheck-ycmd
  :init (flycheck-ycmd-setup))

(use-package latex
  :ensure auctex
  :init
  (setq TeX-PDF-mode t
        TeX-parse-self t)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode))

(use-package flyspell
  :init
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
)
