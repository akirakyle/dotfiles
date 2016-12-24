;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      )
     ycmd
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (shell :variables
            shell-default-height 40
            shell-default-position 'bottom
            shell-default-full-span nil
            ;shell-default-shell 'shell
            )
     spell-checking
     syntax-checking
     version-control
     latex
     c-c++
     python
     ipython-notebook
     pdf-tools
     csv
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     (company-simple-complete :location local)
     (cuda-mode)
     (latex-preview-pane)
     (ob-ipython)
     (company-math)
   )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key "SPC" ;":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
    (define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
    ;(define-key evil-insert-state-map (kbd "C-h") 'backward-delete-char-untabify)
    ;(define-key global-map "\C-h" 'backward-delete-char-untabify)
    (setq-default evil-escape-key-sequence "oe")
    (setq-default evil-escape-unordered-key-sequence t)
    (setq-default evil-move-cursor-back nil)
    (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

    ;(spacemacs/toggle-fill-column-indicator-on)

    (with-eval-after-load 'helm
      (dolist (keymap (list helm-find-files-map helm-read-file-map))
        (define-key keymap (kbd "C-.") 'helm-find-files-up-one-level)
        (define-key keymap (kbd "M-c") 'helm-ff-run-copy-file)
        (define-key keymap (kbd "M-r") 'helm-ff-run-rename-file)
        (define-key keymap (kbd "M-d") 'helm-ff-run-delete-file)
        )
      (define-key helm-buffer-map (kbd "M-d") 'helm-buffer-run-kill-buffers)
      )
    (setq org-agenda-files (list "~/Documents/todo.org"
                                 "~/Documents/class-todo.org"))

    (with-eval-after-load 'org
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "v" 'org-toggle-latex-fragment))

    (require 'ob-ipython)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((ipython . t)
       ;; other languages..
       ))
    ;;don't prompt me to confirm everytime I want to evaluate a block
    (setq org-confirm-babel-evaluate nil)

    ;; display/update images in the buffer after I evaluate
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

    (require 'ox-latex)
    (add-to-list 'org-latex-packages-alist '("" "minted"))
    (setq org-latex-listings 'minted)

    (add-to-list 'org-latex-minted-langs '(ipython "python"))

    (with-eval-after-load 'company
    (require 'company-simple-complete)
    (set-variable 'ycmd-server-command
                  '("python" "/Users/akyle/Developer/git-repos/ycmd/ycmd"))

    (company-ycmd-setup)

    (defun set-my-prog-backends ()
      (interactive)
      (setq-local  company-backends '((company-dabbrev-code
                               company-gtags
                               company-etags
                               company-keywords
                               :with company-yasnippet)
                               (company-files :with company-yasnippet)
                               (company-dabbrev :with company-yasnippet))))

    (setq company-backends-org-mode '((company-math-symbols-latex
                                       company-latex-commands
                                       company-capf
                                       :with company-yasnippet)
                                      (company-dabbrev-code
                                       company-gtags company-etags
                                       company-keywords
                                       :with company-yasnippet)
                                      (company-files :with company-yasnippet)
                                      (company-dabbrev :with company-yasnippet)))

    (setq
    company-dabbrev-downcase nil
    company-idle-delay 0)

    (defun my-org-mode-hook ()
      (spacemacs/toggle-smartparens-on)
      (spacemacs/toggle-auto-fill-mode-on)
      (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))
    (add-hook 'org-mode-hook #'my-org-mode-hook)

    ;(global-ycmd-mode)
    ;(ycmd-toggle-force-semantic-completion)

    )

    ;(defun my-company-visible-and-explicit-action-p ()
    ;  (and (company-tooltip-visible-p)
    ;       (company-explicit-action-p)))

    ;(with-eval-after-load 'company
    ;(defun company-ac-setup ()
    ;  "Sets up `company-mode' to behave similarly to `auto-complete-mode'."
    ;  (setq company-require-match nil)
    ;  (setq company-auto-complete #'my-company-visible-and-explicit-action-p)
    ;  (setq company-frontends '(company-echo-metadata-frontend
    ;                            company-pseudo-tooltip-unless-just-one-frontend-with-delay
    ;                            company-preview-frontend))
    ;  (define-key company-active-map [tab]
    ;    'company-select-next-if-tooltip-visible-or-complete-selection)
    ;  (define-key company-active-map (kbd "TAB")
    ;    'company-select-next-if-tooltip-visible-or-complete-selection))
    ;(company-ac-setup)
    ;)

    ;(define-key evil-insert-state-map (kbd "C-n") 'company-select-next)
    ;(define-key evil-insert-state-map (kbd "C-p") 'company-select-previous)
    ;(set 'company-auto-complete t)
    ;(setq company-frontends
    ;      '(company-pseudo-tooltip-unless-just-one-frontend
    ;        company-preview-frontend
    ;        company-echo-metadata-frontend))

    (with-eval-after-load 'tramp
      (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
    )

    (push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

    ;(add-hook 'shell-mode-hook 'my-shell-mode-hook)
    ;(defun my-shell-mode-hook ()
    ;  (setq comint-input-ring-file-name "~/.bash_history")
    ;  (comint-read-input-ring t))
    ;(defun my-shell-mode-hook ()
    ;  (let ((histfile  "~/.bash_history"))
    ;    (if (tramp-tramp-file-p default-directory)
    ;        (let ((vec (tramp-dissect-file-name default-directory)))
    ;          (setq comint-input-ring-file-name
    ;                (tramp-make-tramp-file-name
    ;                 (tramp-file-name-method vec)
    ;                 (tramp-file-name-user vec)
    ;                 (tramp-file-name-host vec)
    ;                 histfile)))
    ;      (setq comint-input-ring-file-name histfile)))
    ;  (comint-read-input-ring t)
    ;  (let ((process (get-buffer-process (current-buffer))))
    ;    (set-process-sentinel process #'comint-write-input-ring)))

    (evil-define-key 'normal comint-mode-map (kbd "C-p") 'comint-previous-input
      (kbd "C-n") 'comint-next-input)
    (evil-define-key 'insert comint-mode-map (kbd "C-p") 'comint-previous-input
      (kbd "C-n") 'comint-next-input)
    (evil-define-key 'normal term-raw-map (kbd "C-p") 'term-send-up
      (kbd "C-n") 'term-send-down)
    (evil-define-key 'insert term-raw-map (kbd "C-p") 'term-send-up
      (kbd "C-n") 'term-send-down)

    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "--simple-prompt")

    (setq TeX-view-program-selection '((output-pdf "pdf-tools")))
    (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
    (add-hook 'TeX-after-compilation-finished-functions
              #'TeX-revert-document-buffer)

    ;(require 'fill-column-indicator)
    ;(add-hook 'prog-mode-hook 'turn-on-fci-mode)
    ;(add-hook 'text-mode-hook 'turn-on-fci-mode)
    (add-hook 'prog-mode-hook 'column-enforce-mode)
    (add-hook 'text-mode-hook 'column-enforce-mode)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-extra-options "\"-shell-escape\"")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(company-math-allow-latex-symbols-in-faces t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(ein:slice-image nil)
 '(ein:use-auto-complete nil)
 '(ein:use-auto-complete-superpack nil)
 '(fci-rule-color "#383838" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-sexp-background-color "#efebe9")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil))))
 '(org-agenda-span 10)
 '(org-agenda-window-setup (quote other-window))
 '(org-edit-src-content-indentation 0)
 '(org-format-latex-header
   "\\documentclass{article}
\\usepackage[usenames]{color}
[PACKAGES]
[DEFAULT-PACKAGES]
\\pagestyle{empty}             % do not remove
% The settings below are copied from fullpage.sty
\\setlength{\\textwidth}{\\paperwidth}
\\addtolength{\\textwidth}{-3cm}
\\setlength{\\oddsidemargin}{1.5cm}
\\addtolength{\\oddsidemargin}{-2.54cm}
\\setlength{\\evensidemargin}{\\oddsidemargin}
\\setlength{\\textheight}{\\paperheight}
\\addtolength{\\textheight}{-\\headheight}
\\addtolength{\\textheight}{-\\headsep}
\\addtolength{\\textheight}{-\\footskip}
\\addtolength{\\textheight}{-3cm}
\\setlength{\\topmargin}{1.5cm}
\\addtolength{\\topmargin}{-2.54cm}")
 '(org-latex-caption-above nil)
 '(org-latex-packages-alist
(quote
 (("" "minted" t)
  ("" "minted" t)
  ("" "svg" nil)
  ("margin=1in,headsep=0.4in,headheight=14pt" "geometry" nil)
  ("" "parskip" nil))))
'(org-latex-pdf-process
(quote
 ("%latex -interaction nonstopmode -shell-escape -output-directory %o %f" "%latex -interaction nonstopmode -shell-escape -output-directory %o %f" "%latex -interaction nonstopmode -shell-escape -output-directory %o %f")))
 '(org-latex-table-scientific-notation "$%s\\times10^{%s}$")
 '(org-preview-latex-default-process (quote imagemagick))
 '(org-src-tab-acts-natively t)
 '(org-src-window-setup (quote other-window))
'(package-selected-packages
(quote
 (company-math math-symbol-lists web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data ob-ipython dash-functional org pcache undo-tree hide-comnt disaster company-c-headers cmake-mode clang-format csv-mode latex-preview-pane pdf-tools tablist yapfify uuidgen py-isort org-projectile org-download mwim live-py-mode link-hint git-link flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump column-enforce-mode cuda-mode flycheck-ycmd company-ycmd ycmd request-deferred deferred zenburn-theme monokai-theme solarized-theme ein websocket xterm-color toc-org smeargle shell-pop pyvenv pytest pyenv-mode py-yapf pip-requirements orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets multi-term mmm-mode markdown-toc markdown-mode magit-gitflow hy-mode htmlize helm-pydoc helm-gitignore request helm-flyspell helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flycheck-pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-prompt-extras esh-help diff-hl cython-mode company-statistics company-quickhelp pos-tip company-auctex company-anaconda company auto-yasnippet yasnippet auto-dictionary auctex anaconda-mode pythonic f ac-ispell auto-complete ws-butler window-numbering volatile-highlights vi-tilde-fringe spaceline s powerline smooth-scrolling restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox hydra spinner page-break-lines open-junk-file neotree move-text macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight elisp-slime-nav define-word clean-aindent-mode buffer-move bracketed-paste auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build use-package which-key bind-key bind-map evil spacemacs-theme)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(send-mail-function (quote mailclient-send-it))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(split-height-threshold 40)
 '(split-width-threshold 100)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tramp-histfile-override t)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-background-mode nil)
'(vc-annotate-color-map
(quote
 ((20 . "#BC8383")
  (40 . "#CC9393")
  (60 . "#DFAF8F")
  (80 . "#D0BF8F")
  (100 . "#E0CF9F")
  (120 . "#F0DFAF")
  (140 . "#5F7F5F")
  (160 . "#7F9F7F")
  (180 . "#8FB28F")
  (200 . "#9FC59F")
  (220 . "#AFD8AF")
  (240 . "#BFEBBF")
  (260 . "#93E0E3")
  (280 . "#6CA0A3")
  (300 . "#7CB8BB")
  (320 . "#8CD0D3")
  (340 . "#94BFF3")
  (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
'(weechat-color-list
(unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
'(xterm-color-names
["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
'(xterm-color-names-bright
["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
