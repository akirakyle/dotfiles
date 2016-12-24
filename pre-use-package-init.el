(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4 t)
 '(company-dabbrev-downcase nil)
 '(custom-safe-themes
   (quote
    ("b2028956188cf668e27a130c027e7f240c24c705c1517108b98a9645644711d9" "0b6645497e51d80eda1d337d6cabe31814d6c381e69491931a688836c16137ed" default)))
 '(doc-view-continuous t)
 '(evil-shift-width 4)
 '(explicit-shell-file-name "bash")
 '(f90-continuation-indent 2)
 '(f90-do-indent 2)
 '(f90-if-indent 2)
 '(f90-type-indent 2)
 '(fill-column 80)
 '(org-agenda-files (quote ("~/Documents/Ethical Theory/notes.org")))
 '(package-selected-packages
   (quote
    (htmlize tramp-term test-simple smooth-scrolling sml-mode rainbow-delimiters powerline-evil magit loc-changes load-relative list-utils key-chord highlight-numbers highlight helm-company goto-last-change fuzzy flycheck-ycmd exec-path-from-shell evil-leader diminish company-ycmd company-quickhelp company-math company-jedi company-flx company-c-headers company-auctex c0-mode better-defaults base16-theme avy-menu auto-complete)))
 '(tramp-default-method "ssh"))

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
(setq-default cursor-type 'bar)
(setq c-default-style "k&r"
        c-basic-offset 4)

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

(require 'package)  ;; should be first in .emacs file
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)
(setq package-enable-at-startup nil)
(package-initialize)

(defun install-packages ()
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-package-list)
    (unless (package-installed-p package)
      (package-install package)))
  ; initialize in case anything in this file requires something just installed
  (package-initialize))

(install-packages)

(load-theme `base16-default-dark t)

(global-visual-line-mode 1) ;; enable line wrapping at word breaks

;; Horizontal cursor line and customize its appearance
;(global-hl-line-mode 1)
;(set-face-background 'highlight (face-attribute 'default :background))
;(set-face-foreground 'highlight nil)
;(set-face-underline 'highlight t)
;(add-hook 'comint-mode-hook (lambda () (hl-line-mode 0)))

;(defun remote-shell (remote-name)
;    (interactive "sRemote Name: ")
;    (let ((default-directory (concat "/" remote-name ":")))
;      (shell (concat "*" remote-name "*"))))

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

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))

(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; No trailing spaces
(setq require-final-newline t) ;; Good practice.

(add-hook 'prog-mode-hook 'hs-minor-mode) ;; enable code folding

(require 'better-defaults)
(save-place-mode) ; necessary in emacs 25.1
(menu-bar-mode 1)

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

(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 2)

;; Evil Setup
(require 'evil)
(evil-mode 1)
(setq evil-move-cursor-back nil)
(setq evil-auto-indent nil)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "SPC" 'evil-ex-nohighlight)
(evil-leader/set-key "c" 'calc-dispatch)
(evil-leader/set-key "h" 'help)

(require 'powerline-evil)
;; modified powerline-evil-center-color-theme to get rid of character count
;; that just took up space. ( I just deleted this (powerline-raw '(10 "%i")) )
;; I also removed the git remote name from git status line
(my-powerline-evil-vim-color-theme)

(require 'diminish)
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "Wrap" '(diminish 'wrap))

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "hh" 'evil-normal-state)

(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(evil-ex-define-cmd "bd[elete]" 'kill-buffer) ;; so bd doesn't close window

;; Fixes bug when using evil seach
(evil-select-search-module 'evil-search-module 'evil-search)

;; keep some of the emacs navigation commands
(define-key evil-normal-state-map (kbd "C-f") 'evil-forward-char)
(define-key evil-insert-state-map (kbd "C-f") 'evil-forward-char)
(define-key evil-visual-state-map (kbd "C-f") 'evil-forward-char)
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
(global-set-key (kbd "C-h") 'delete-backward-char)
(define-key evil-normal-state-map (kbd "C-w C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-w C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-w C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-w C-l") 'evil-window-right)

(evil-define-key 'normal comint-mode-map (kbd "C-p") 'comint-previous-input
                                         (kbd "C-n") 'comint-next-input)
(evil-define-key 'insert comint-mode-map (kbd "C-p") 'comint-previous-input
                                         (kbd "C-n") 'comint-next-input)
; don't know why this has to be here to work
(require 'dired)
(evil-define-key 'normal dired-mode-map (kbd ";") 'evil-ex)
(define-key dired-mode-map (kbd ";") 'evil-ex)

(require 'compile)
(evil-set-initial-state 'compilation-mode 'normal)
(define-key compilation-mode-map (kbd "h") 'evil-backward-char)

(require 'helm)
(require 'helm-mode)
(require 'helm-config)
(helm-mode 1)
(define-key evil-ex-map "e " 'helm-find-files)
(define-key evil-ex-map "b " 'helm-buffers-list)
(evil-ex-define-cmd "bd" 'kill-this-buffer)
(evil-leader/set-key "x" 'helm-M-x)
(evil-leader/set-key "b" 'helm-mini) ;helm-buffers-list)
(evil-leader/set-key "f" 'helm-find-files)
;(evil-leader/set-key "k" 'kill-this-buffer)
(evil-leader/set-key "k" nil)
;(evil-leader/set-key "m" 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(define-key helm-map (kbd "C-h") 'helm-ff-delete-char-backward)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)
;(setq helm-mode-fuzzy-match t)
;(setq helm-completion-in-region-fuzzy-match t)
(setq helm-split-window-in-side-p t)
(helm-autoresize-mode t)
(setq helm-autoresize-max-height 40)
(setq helm-autoresize-min-height 40)
(setq helm-ff-tramp-not-fancy nil) ;make helm display remote files in color

;(require 'helm-company)
;(define-key company-mode-map (kbd "C--") 'helm-company)
;(define-key company-active-map (kbd "C--") 'helm-company)

(require 'yasnippet)
(yas-global-mode 1)

;(require 'semantic)
;(global-semanticdb-minor-mode 1)
;(global-semantic-idle-scheduler-mode 1)
;(global-semantic-stickyfunc-mode 1)
;(semantic-mode 1)

(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)
(set-variable 'ycmd-server-command '("python" "/Users/akyle/Developer/ycmd/ycmd"))
(set-variable 'ycmd-global-config "/Users/akyle/Developer/.ycm_extra_conf.py")

;(require 'ycmd-eldoc)
;(add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(define-key company-active-map (kbd "C-h") nil)
(define-key company-active-map (kbd "C-?") 'company-show-doc-buffer)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
;(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)
(define-key company-active-map (kbd "TAB") 'company-complete-selection)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key company-active-map (kbd "<return>") nil)
(define-key company-active-map (kbd "RET") nil)
(setq company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend
        company-preview-frontend
        company-echo-metadata-frontend))
(setq company-require-match 'never)
;(setq company-auto-complete t)
(setq company-selection-wrap-around t)
(setq company-idle-delay 0)
;(setq company-show-numbers t)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-align-annotations t)

; disable company mode in shells
(add-hook 'comint-mode-hook (lambda () (company-mode 0)))

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

(defvar global-backends
      '(company-math-symbols-unicode
        company-files
        company-capf
        company-dabbrev))

(setq company-backends global-backends)
;(setq company-backends '(company-capf))

(require 'company-ycmd)
;(company-ycmd-setup) ; we manually add backends below instead
(ycmd-toggle-force-semantic-completion)
(evil-leader/set-key "s" 'ycmd-toggle-force-semantic-completion)

(defun set-prog-backends ()
  (make-local-variable 'company-backends)
  (add-to-list 'company-backends '(:sorted company-ycmd :with company-yasnippet)))
;    (setq-local company-backends '((company-semantic company-yasnippet))))

;(require 'company-c-headers)
(add-hook 'c-mode-hook 'set-prog-backends)
(add-hook 'c++-mode-hook 'set-prog-backends)
(add-hook 'python-mode-hook 'set-prog-backends)
(add-to-list 'ycmd-file-type-map '(f90-mode "generic"))
(add-hook 'f90-mode-hook 'set-prog-backends)

;(require 'company-jedi)
;(add-hook 'python-mode-hook
;          (lambda ()
;            (add-to-list (make-local-variable 'company-backends)
;                         'company-jedi)))

(require 'sml-mode)
(add-to-list 'ycmd-file-type-map '(sml-mode "generic"))
(add-hook 'sml-mode-hook 'set-prog-backends)
;(add-hook 'sml-mode-hook
;          (lambda ()
;            (add-to-list (make-local-variable 'company-backends)
;                         'company-dabbrev-code)))

(require 'company-math)
(require 'company-auctex)
;(company-auctex-init) ; we manually add backends below instead
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

(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)
(evil-leader/set-key "n" 'flycheck-next-error)
(evil-leader/set-key "p" 'flycheck-previous-error)

(require 'flycheck-ycmd)
(flycheck-ycmd-setup)

;; AucTex config
(require 'latex)
(setq TeX-PDF-mode t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

; temporary  until next AucTex package version released
;(setq LaTeX-math-list '(
;    (nil "impliedby" ("AMS" "Arrows") 10232) ;; #X27F8
;    (nil "implies" ("AMS" "Arrows") 10233) ;; #X27F9
;    (nil "iff" ("AMS" "Arrows") 10234) ;; #X27FA
;    ))

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'whitespace-mode)


(add-hook 'prog-mode-hook (lambda ()
                            (evil-leader/set-key "e" (lambda ()
                                                       (interactive)
                                                       (save-buffer)
                                                       (recompile)))))

(evil-leader/set-key-for-mode 'latex-mode "e" (lambda ()
                                                (interactive)
                                                (save-buffer)
                                                (TeX-command-master)) )
(put 'erase-buffer 'disabled nil)
