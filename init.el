(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doc-view-continuous t)
 '(fill-column 80))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#191919"))))
 '(company-scrollbar-fg ((t (:background "#0c0c0c"))))
 '(company-tooltip ((t (:inherit default :background "#050505"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))

(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 100))
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)

(defconst my-package-list
  '(better-defaults
    base16-theme
    ; other good themes: cyberpunk, monokai, zen-and-art, firecode
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
    company
    company-auctex
    company-c-headers
    company-jedi
    company-math
    ;company-quickhelp
    ;company-flx
    ;auto-complete
    ;flx
    flycheck
    undo-tree
    c0-mode
    sml-mode
    ))

(require 'package)  ;; should be first in .emacs file
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
(package-initialize)
(setq package-enable-at-startup nil)

(defun install-packages ()
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-package-list)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

(load-theme `base16-pop-dark t)

(global-visual-line-mode 1) ;; enable line wrapping at word breaks

;; Horizontal cursor line and customize its appearance
(global-hl-line-mode 1)
(set-face-background 'highlight (face-attribute 'default :background))
(set-face-foreground 'highlight nil)
(set-face-underline 'highlight t)

;; set ~/.emacs_saves to be dir for all autosave, recovery, and backup files
(setq backup-directory-alist `((".*" . "~/.emacs_saves/")))
(setq auto-save-file-name-transforms `((".*" ,"~/.emacs_saves/" t)))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(put 'dired-find-alternate-file 'disabled nil)
(setq dired-listing-switches "-alh")

(show-paren-mode) ;; Highlights the matching paren.
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; No trailing spaces
(setq require-final-newline t) ;; Good practice.
(setq-default indent-tabs-mode nil) ;; Don't indent with tabs.

(add-hook 'prog-mode-hook 'hs-minor-mode) ;; enable code folding

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'highlight-numbers)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

(require 'whitespace)
(setq whitespace-line-column 80) ;; highlight lines over 80 chars
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'LaTeX-mode-hook 'whitespace-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Evil Setup
(require 'evil)
(evil-mode 1)
(setq evil-move-cursor-back nil)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "SPC" 'evil-ex-nohighlight)

(require 'powerline-evil)
;; modified powerline-evil-center-color-theme to get rid of character count
;; that just took up space. ( I just deleted this (powerline-raw '(10 "%i")) )
(my-powerline-evil-vim-color-theme)

;(require 'diminish)
;(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
;(eval-after-load "company" '(diminish 'company-mode))

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jj" 'evil-normal-state)

(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;(evil-define-key 'normal dired-mode-map (kbd ";") 'evil-ex)

(evil-ex-define-cmd "bd[elete]" 'kill-buffer) ;; so bd doesn't close window

;; Fixes bug when using evil seach
(evil-select-search-module 'evil-search-module 'evil-search)

(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; keep some of the emacs navigation commands
(define-key evil-normal-state-map (kbd "C-f") 'evil-forward-char)
(define-key evil-insert-state-map (kbd "C-f") 'evil-forward-char)
(define-key evil-insert-state-map (kbd "C-f") 'evil-forward-char)
(define-key evil-normal-state-map (kbd "C-b") 'evil-backward-char)
(define-key evil-insert-state-map (kbd "C-b") 'evil-backward-char)
(define-key evil-visual-state-map (kbd "C-b") 'evil-backward-char)
(define-key evil-normal-state-map (kbd "C-d") 'evil-delete-char)
(define-key evil-insert-state-map (kbd "C-d") 'evil-delete-char)
(define-key evil-visual-state-map (kbd "C-d") 'evil-delete-char)
(define-key evil-normal-state-map (kbd "C-n") 'evil-next-line)
(define-key evil-insert-state-map (kbd "C-n") 'evil-next-line)
(define-key evil-visual-state-map (kbd "C-n") 'evil-next-line)
(define-key evil-normal-state-map (kbd "C-p") 'evil-previous-line)
(define-key evil-insert-state-map (kbd "C-p") 'evil-previous-line)
(define-key evil-visual-state-map (kbd "C-p") 'evil-previous-line)

(evil-define-key 'normal comint-mode-map (kbd "C-P") 'comint-previous-input
                                         (kbd "C-n") 'comint-next-input)
(evil-define-key 'insert comint-mode-map (kbd "C-P") 'comint-previous-input
                                         (kbd "C-n") 'comint-next-input)

(require 'helm)
(require 'helm-mode)
(require 'helm-config)
(helm-mode 1)
(define-key evil-ex-map "e " 'helm-find-files)
(define-key evil-ex-map "b " 'helm-buffers-list)
(define-key evil-ex-map "mx " 'helm-M-x)
(evil-leader/set-key "x" 'helm-M-x)
(global-set-key (kbd "M-x") 'helm-M-x)
(define-key helm-map (kbd "C-h") 'helm-ff-delete-char-backward)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)
(setq helm-split-window-in-side-p t)
(helm-autoresize-mode t)
(setq helm-autoresize-max-height 35)
(setq helm-autoresize-min-height 35)

(require 'helm-company)
(define-key company-mode-map (kbd "C--") 'helm-company)
(define-key company-active-map (kbd "C--") 'helm-company)

(require 'yasnippet)
(yas-global-mode 1)

(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)
(semantic-mode 1)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(define-key company-active-map (kbd "C-h") nil)
(define-key company-active-map (kbd "C-?") 'company-show-doc-buffer)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
;(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
(setq company-selection-wrap-around t)
(setq company-idle-delay 0)
(setq company-echo-delay 0)
(setq company-show-numbers t)
(setq company-minimum-prefix-length 2)

; disable company mode in shells
(add-hook 'comint-mode-hook (lambda () (company-mode 0)))

;(require 'company-flx)
;(company-flx-mode 1) ; if slow set company-flx-limit lower

; don't know why this has to be here to work
(evil-define-key 'normal dired-mode-map (kbd ";") 'evil-ex)


(defvar my-backends
      '(company-capf
        company-files
        company-keywords
        company-yasnippet))

(setq company-backends (list my-backends 'company-dabbrev))

(require 'company-c-headers)
(add-hook 'c-mode-hook
          (lambda ()
            (setq-local company-backends
                        (list (cons 'company-semantic
                                    (cons 'company-c-headers my-backends))
                              'company-dabbrev))))
(add-hook 'c++-mode-hook
          (lambda ()
            (setq-local company-backends
                        (list (cons 'company-semantic
                                    (cons 'company-c-headers my-backends))
                              'company-dabbrev))))

(require 'company-jedi)
(add-hook 'python-mode-hook
          (lambda ()
            (add-to-list (make-local-variable 'company-backends)
                         'company-jedi)))

(require 'sml-mode)
(add-hook 'sml-mode-hook
          (lambda ()
            (setq-local company-backends
                        (list 'company-dabbrev my-backends))))

(require 'company-math)
(setq company-tooltip-align-annotations t)

(require 'company-auctex)
;(company-auctex-init) ; we manually add backends below instead
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (make-local-variable 'company-backends)
            (add-to-list 'company-backends 'company-latex-commands)
            (add-to-list 'company-backends 'company-math-symbols-latex)
            (add-to-list 'company-backends 'company-auctex-labels)
            (add-to-list 'company-backends 'company-auctex-bibs)
            (add-to-list 'company-backends '(company-auctex-macros
                                             company-auctex-symbols
                                             company-auctex-environments))))

;(require 'company-quickhelp)
;(company-quickhelp-mode 1)
;(define-key company-quickhelp-mode-map (kbd "C-n") 'company-select-next)
;(define-key company-quickhelp-mode-map (kbd "C-p") 'company-select-previous)
;(setq pos-tip-foreground-color "#839496")
;(setq pos-tip-background-color "#050505")

(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)
(evil-leader/set-key "n" 'flycheck-next-error)
(evil-leader/set-key "p" 'flycheck-previous-error)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; AucTex config
(require 'latex)
(setq TeX-PDF-mode t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

; temporary  until next AucTex package version released
(setq LaTeX-math-list '(
    (nil "impliedby" ("AMS" "Arrows") 10232) ;; #X27F8
    (nil "implies" ("AMS" "Arrows") 10233) ;; #X27F9
    (nil "iff" ("AMS" "Arrows") 10234) ;; #X27FA
    ))

(add-hook 'prog-mode-hook (lambda ()
                            (evil-leader/set-key "e" (lambda ()
                                                       (interactive)
                                                       (save-buffer)
                                                       (recompile)))))

(evil-leader/set-key-for-mode 'latex-mode "e" (lambda ()
                                                (interactive)
                                                (save-buffer)
                                                (TeX-command-master)) )
