(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doc-view-continuous t)
 '(evil-shift-width 2)
 '(shell-file-name "/usr/local/bin/bash"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 100))
(setq ring-bell-function 'ignore)
(put 'dired-find-alternate-file 'disabled nil)

(require 'package)  ;; should be first in .emacs file
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
(package-initialize)

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'sml-mode)
(require 'c0-mode)
(require 'magit)
(require 'smooth-scrolling)
(require 'better-defaults)

;; other good themes:
;; cyberpunk-theme, monokai-theme, zen-and-art-theme, firecode-theme
(load-theme `base16-pop-dark t)

(require 'highlight-numbers)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

(global-visual-line-mode 1) ;; enable line wrapping at word breaks

;; Horizontal cursor line and customize its appearance
(global-hl-line-mode 1)
(set-face-background 'highlight (face-attribute 'default :background))
(set-face-foreground 'highlight nil)
(set-face-underline-p 'highlight t)

;; set ~/.emacs_saves to be dir for all autosave, recovery, and backup files
(setq backup-directory-alist `((".*" . "~/.emacs_saves/")))
(setq auto-save-file-name-transforms `((".*" ,"~/.emacs_saves/" t)))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(show-paren-mode) ;; Highlights the matching paren.
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; No trailing spaces
(setq require-final-newline t) ;; Good practice.
(setq-default indent-tabs-mode nil) ;; Don't indent with tabs.
(setq inhibit-splash-screen t) ;; Disable splash screen

(require 'whitespace)
(setq whitespace-line-column 80) ;; highlight lines over 80 chars
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; Evil Setup
(require 'evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader ",")

(require 'evil)
  (evil-mode 1)

(require 'powerline-evil)  ;; vim like status bar
(powerline-evil-vim-color-theme)
(display-time-mode t)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jj" 'evil-normal-state)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; Fixes bug when using evil seach
(evil-select-search-module 'evil-search-module 'evil-search)

(require 'xclip)
(xclip-mode 1) ;; copy and paste to system clipboard

;; use ido to open files
(define-key evil-ex-map "e " 'ido-find-file)
(define-key evil-ex-map "b " 'ido-switch-buffer)

(evil-ex-define-cmd "bd[elete]" 'kill-buffer) ;; so bd doesn't close window

(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; keep some of the emacs navigation commands
(define-key evil-normal-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
(define-key evil-normal-state-map "\C-d" 'evil-delete-char)
(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
(define-key evil-visual-state-map "\C-d" 'evil-delete-char)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;(require 'ycmd)
;(add-hook 'after-init-hook #'global-ycmd-mode)
;(add-to-list 'load-path "~/.emacs.d/ac-ycmd/")
;(require 'auto-complete-ycmd)
;(ac-ycmd-setup)

(require 'helm)
;(require 'ac-helm)
;(global-set-key (kbd "C-:") 'ac-complete-with-helm)
;j(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)

;; auto-complete config
(require 'auto-complete)
(require 'ac-math)
(setq ac-disable-faces nil) ;; ac inside stuff like comments and strings
(add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-modes 'sml-mode)
(add-to-list 'ac-modes 'c0-mode)
(add-to-list 'ac-modes 'c-mode)
(add-to-list 'ac-modes 'c++-mode)
(add-to-list 'ac-modes 'makefile-mode)
(add-to-list 'ac-modes 'makefile-bsdmake-mode)

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
        (append '(ac-source-math-unicode
                  ac-source-math-latex
                  ac-source-latex-commands) ac-sources)))

(add-hook 'TeX-mode-hook 'ac-latex-mode-setup)
;; use auctex and docview together (docview updates itself)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

(ac-flyspell-workaround) ; fixes a known bug of delay due to flyspell (if it is there)
;(require 'auto-complete-config) ; should be after add-to-list 'ac-modes and hooks
(ac-config-default)
(setq ac-auto-show-menu    t)
(setq ac-delay             0)
(setq ac-show-menu-immediately-on-auto-complete t)
(global-auto-complete-mode t)

;; AucTex config
(setq TeX-PDF-mode t)
(setq TeX-parse-self t)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'lisp-mode (lambda () (flyspell-prog-mode)))
(add-hook 'c++-mode-hook (lambda () (flyspell-prog-mode)))
(add-hook 'c-mode (lambda () (flyspell-prog-mode)))
(add-hook 'python-mode (lambda () (flyspell-prog-mode)))
(add-hook 'sml-mode (lambda () (flyspell-prog-mode)))
(add-hook 'c0-mode (lambda () (flyspell-prog-mode)))

(defun exec-python()
  (interactive)
  (when (get-process "Python")
      (delete-process "Python"))
  (when (get-buffer "*Python*")
    (switch-to-buffer "*Python*")
    (erase-buffer)
    (switch-to-buffer (other-buffer)) )
  (python-shell-get-or-create-process "/usr/bin/python -i" nil t)
  (python-shell-send-file (buffer-file-name))
  (other-window 1) )

(defun exec-sml()
  (interactive)
  (when (get-process "sml")
      (delete-process "sml"))
  (when (get-buffer "*sml*")
    (switch-to-buffer "*sml*")
    (erase-buffer)
    (switch-to-buffer (other-buffer)) )
  (sml-prog-proc-load-file (buffer-name))
  ;(call-interactively (global-key-binding "RET"))
  ;(choose-completion)
  ;(exit-minibuffer)
  (other-window 1) )
  ;(when (> (count-windows) 1)
  ;  (other-window 1) ) )


(defun exec-latex()
  (interactive)
  (save-buffer)
  (TeX-command-master) )

(defun save-and-recompile()
  (interactive)
  (save-buffer)
  (recompile) )

(defun halve-other-window-height ()
  "Expand current window to use half of the other window's lines."
  (interactive)
  (enlarge-window (/ (window-height (next-window)) 2)))

(evil-leader/set-key-for-mode 'python-mode "e" 'exec-python)
(evil-leader/set-key-for-mode 'latex-mode "e" 'exec-latex)
(evil-leader/set-key-for-mode 'c0-mode "e" 'save-and-recompile)
(evil-leader/set-key-for-mode 'c-mode "e" 'save-and-recompile)
(evil-leader/set-key-for-mode 'c++-mode "e" 'save-and-recompile)
(evil-leader/set-key-for-mode 'sml-mode "e" 'exec-sml)

(evil-leader/set-key "r" 'halve-other-window-height)
(evil-leader/set-key "SPC" 'evil-ex-nohighlight)

;; Setup for c0-mode
(setq c0-root "/usr/local/cc0/")
(load (concat c0-root "c0-mode/c0.el"))
(require 'cl) ;; require comomn lisp
