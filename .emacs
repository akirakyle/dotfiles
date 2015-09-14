(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
  (package-initialize)

(xclip-mode 1)

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

(global-linum-mode t)
(unless window-system
    (add-hook 'linum-before-numbering-hook
        (lambda ()
            (setq-local linum-format
                (let ((w (length (number-to-string
                                 (count-lines (point-min) (point-max))))))
                (concat " %" (number-to-string w) "d " ))))))

;(setq TeX-PDF-mode t)
;(TeX-global-PDF-mode t)
(setq latex-run-command "pdflatex")

(global-hl-line-mode 1)
;;(set-face-attribute hl-line-face nil :underline t)
;;(set-face-background 'highlight "#222")
(set-face-background 'highlight (face-attribute 'default :background))
(set-face-foreground 'highlight nil)
(set-face-underline-p 'highlight t)
(set-face-foreground 'font-lock-string-face "red")
(set-face-foreground 'font-lock-comment-face "gray30")
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
(set-face-foreground 'font-lock-constant-face "brown")
(set-face-foreground 'font-lock-function-name-face "turquoise2")

(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-show-menu    0)
(setq ac-delay             0)
(setq ac-show-menu-immediately-on-auto-complete t)

(evil-select-search-module 'evil-search-module 'evil-search)

(menu-bar-mode -1)

(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

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

(setq x-select-enable-clipboard t)

(defun exec-python()
  (interactive)
  ;;(python-shell-switch-to-shell)
  (python-shell-get-or-create-process "/usr/bin/python -i" nil t)
  ;;(other-window 1)
  (python-shell-send-buffer) )

(defun exec-latex()
  (interactive)
  (save-buffer)
  (tex-file)
  (message nil)
  (other-window 1)
  (delete-window) )

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
(evil-leader/set-key-for-mode 'sml-mode "e" 'sml-prog-proc-load-file)

(evil-leader/set-key "r" 'halve-other-window-height)

(setq backup-directory-alist `(("." . "~/.emacs_saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Setup for c0-mode
;;(setq c0-root "/afs/andrew/course/15/122/")
;;(load (concat c0-root "c0-mode/c0.el"))
(setq c0-root "/usr/local/cc0/")
(load (concat c0-root "c0-mode/c0.el"))
(require 'cl) ;; require comomn lisp

;; Other configuration options that are useful for C0/122
(show-paren-mode) ;; Highlights the matching paren.
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; No trailing spaces
(setq require-final-newline t) ;; Good practice.
(setq-default indent-tabs-mode nil) ;; Don't indent with tabs.
