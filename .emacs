(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(doc-view-continuous t)
 '(evil-shift-width 2)
 '(shell-file-name "/usr/local/bin/bash"))
(setq ring-bell-function 'ignore)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(require 'package)  ;; should be first in .emacs file
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
(package-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(load-theme `base16-pop-dark t)

(add-hook 'prog-mode-hook 'highlight-numbers-mode)

(global-visual-line-mode 1)

;; Line numbers
;(global-linum-mode t)
;(unless window-system
    ;(add-hook 'linum-before-numbering-hook
        ;(lambda ()
            ;(setq-local linum-format
                ;(let ((w (length (number-to-string
                                 ;(count-lines (point-min) (point-max))))))
                ;(concat " %" (number-to-string w) "d " ))))))

;; Horizontal cursor line and customize its appearance (to be like vim's cursor line)
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
(setq inhibit-splash-screen t); Disable splash screen


(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
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

;; Fixes 'Invalid function: evil-without-input-method-hooks' error when using evil search
(evil-select-search-module 'evil-search-module 'evil-search)

(xclip-mode 1) ;; copy and paste to system clipboard

;; use ido to open files
(define-key evil-ex-map "e " 'ido-find-file)
(define-key evil-ex-map "b " 'ido-switch-buffer)

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

;; auto-complete config
(require 'auto-complete)
(require 'ac-math)
(setq ac-disable-faces nil) ; auto-complete inside stuff like comments and strings
(add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-modes 'sml-mode)
(add-to-list 'ac-modes 'c0-mode)
(add-to-list 'ac-modes 'c-mode)
(add-to-list 'ac-modes 'c++-mode)
(add-to-list 'ac-modes 'makefile-mode)
(add-to-list 'ac-modes 'makefile-bsdmake-mode)

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
               ac-sources)))

(add-hook 'TeX-mode-hook 'ac-latex-mode-setup)
(add-hook 'doc-view-mode-hook 'auto-revert-mode) ; so I can use docview and auctex together!

(ac-flyspell-workaround) ; fixes a known bug of delay due to flyspell (if it is there)
;(require 'auto-complete-config) ; should be after add-to-list 'ac-modes and hooks
(ac-config-default)
(setq ac-auto-show-menu    t)
(setq ac-delay             0)
(setq ac-show-menu-immediately-on-auto-complete t)
(global-auto-complete-mode t)

;; AucTex config
(setq TeX-PDF-mode t)
;(setq TeX-auto-save t)
(setq TeX-parse-self t)
;(setq-default TeX-master nil) ; relevant to multifile tex projects
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
  ;(interactive)
  ;(save-buffer)
  ;(tex-file)
  ;(message nil)
  ;(other-window 1)
  ;(delete-window) )

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
;;(setq c0-root "/afs/andrew/course/15/122/")
;;(load (concat c0-root "c0-mode/c0.el"))
(setq c0-root "/usr/local/cc0/")
(load (concat c0-root "c0-mode/c0.el"))
(require 'cl) ;; require comomn lisp

;(defun copy-from-osx ()
;  "Handle copy/paste intelligently on osx."
;  (let ((pbpaste (purecopy "/usr/bin/pbpaste")))
;    (if (and (eq system-type 'darwin)
;             (file-exists-p pbpaste))
;        (let ((tramp-mode nil)
;              (default-directory "~"))
;          (shell-command-to-string pbpaste)))))
;
;(defun paste-to-osx (text &optional push)
;  (let ((process-connection-type nil))
;    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;      (process-send-string proc text)
;      (process-send-eof proc))))

;(setq interprogram-cut-function 'paste-to-osx)
;(setq interprogram-paste-function 'copy-from-osx)

(put 'dired-find-alternate-file 'disabled nil)

;(setenv "PATH" (shell-command-to-string "bash -l -c 'echo -n $PATH'"))
