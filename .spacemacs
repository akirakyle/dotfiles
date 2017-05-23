;; -*- mode: emacs-lisp; lexical-binding: t; -*-
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
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     typescript
     javascript
     ; javascript
     sml
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
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
     exwm
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ;(company-simple-complete :location local)
     (cuda-mode)
     (latex-preview-pane)
     (ob-ipython)
     (company-math)
   )
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(persp-mode)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
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
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("MesloLGS"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "s-SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
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

  (set-variable 'ycmd-server-command
                '("python" "/home/akyle/aur/ycmd/ycmd/"))
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
    ;(setq-default evil-escape-key-sequence "oe")
    ;(setq-default evil-escape-unordered-key-sequence t)
    (setq-default evil-move-cursor-back nil)
    (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

    ;(spacemacs/toggle-fill-column-indicator-on)
    (spacemacs/toggle-mode-line-battery-on)

    (setq dired-listing-switches "-alh")

    (with-eval-after-load 'helm
      (dolist (keymap (list helm-find-files-map helm-read-file-map))
        (define-key keymap (kbd "C-.") 'helm-find-files-up-one-level)
        (define-key keymap (kbd "M-c") 'helm-ff-run-copy-file)
        (define-key keymap (kbd "M-r") 'helm-ff-run-rename-file)
        (define-key keymap (kbd "M-d") 'helm-ff-run-delete-file)
        )
      (define-key helm-buffer-map (kbd "M-d") 'helm-buffer-run-kill-buffers)
      )
    (setq org-agenda-files (list "~/org/class.org"
                                 "~/org/todo.org"
                                 "~/org/hl.org"
                                 "~/org/ignite.org"
                                 "~/org/internship.org"))
    (setq org-mobile-directory "/ssh:spot:org/")

    (with-eval-after-load 'org
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "o" 'org-toggle-latex-fragment))



    (with-eval-after-load 'exwm
      (remove-hook 'focus-out-hook 'powerline-unset-selected-window)
      (setq exwm-layout-show-all-buffers t
            exwm-workspace-show-all-buffers t)

      (setq lexical-binding t)
      ;https://www.gnu.org/software/emacs/manual/html_node/elisp/Variable-Scoping.html
      (defun interactive-start-process (cmd &rest args)
        (lambda () (interactive)
          (apply 'start-process (funcall 'string-join (cons cmd args) " ")
                 nil cmd args) ))

      (setq bright-notify "notify-send -i audio-volume-medium -hint int:value: "Brightness"")
      (setq volumecmd "pulseaudio-ctl")
      (setq brightnesscmd "/home/akyle/dotfiles/brightness-ctl")
      (setq mediacmd "/home/akyle/koel/mediakeys-daemon/src/mkd.py")

      (exwm-input-set-key (kbd "<XF86AudioMute>")
                          (interactive-start-process volumecmd "mute"))
      (exwm-input-set-key (kbd "<XF86AudioLowerVolume>")
                          (interactive-start-process volumecmd "down"))
      (exwm-input-set-key (kbd "<XF86AudioRaiseVolume>")
                          (interactive-start-process volumecmd "up"))
      (exwm-input-set-key (kbd "<XF86MonBrightnessDown>")
                          (interactive-start-process brightnesscmd "down"))
      (exwm-input-set-key (kbd "<XF86MonBrightnessUp>")
                          (interactive-start-process brightnesscmd "up"))
      (exwm-input-set-key (kbd "<XF86AudioPlay>")
                          (interactive-start-process mediacmd "-p"))
      (exwm-input-set-key (kbd "<XF86AudioNext>")
                          (interactive-start-process mediacmd "-n"))
      (exwm-input-set-key (kbd "<XF86AudioPrev>")
                          (interactive-start-process mediacmd "-b"))
      (exwm-input-set-key (kbd "<XF86AudioStop>")
                          (interactive-start-process mediacmd "-s"))

      ;(setq mediafns '((play . "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
      ;                 (next . "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
      ;                 (prev . "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
      ;                 (stop . "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop")))
      ;(start-process "spotify-ctl" nil mediacmd (alist-get 'play mediafns) )))
      ;(exwm-input-set-key (kbd "<XF86AudioMute>")
      ;                    (lambda () (interactive)
      ;                      (start-process "volume" nil "pulseaudio-ctl" "mute")))
      ;(exwm-input-set-key (kbd "<XF86AudioLowerVolume>")
      ;                    (lambda () (interactive)
      ;                      (start-process "volume" nil "pulseaudio-ctl" "down")))
      ;(exwm-input-set-key (kbd "<XF86AudioRaiseVolume>")
      ;                    (lambda () (interactive)
      ;                      (start-process "volume" nil "pulseaudio-ctl" "up")))
      ;(exwm-input-set-key (kbd "<XF86MonBrightnessDown>")
      ;                    (lambda () (interactive)
      ;                    (start-process "backlight" nil "xbacklight" "-dec" "5")))
      ;(exwm-input-set-key (kbd "<XF86MonBrightnessUp>")
      ;                    (lambda () (interactive)
      ;                    (start-process "backlight" nil "xbacklight" "-inc" "5")))
      ;(exwm-input-set-key (kbd "<XF86AudioPlay>")
      ;                    (lambda () (interactive)
      ;                      (start-process "spotify-ctl" nil mediacmd "-p" )))
      ;(exwm-input-set-key (kbd "<XF86AudioNext>")
      ;                    (lambda () (interactive)
      ;                      (start-process "spotify-ctl" nil mediacmd "-n" )))
      ;(exwm-input-set-key (kbd "<XF86AudioPrev>")
      ;                    (lambda () (interactive)
      ;                      (start-process "spotify-ctl" nil mediacmd "-b" )))
      ;(exwm-input-set-key (kbd "<XF86AudioStop>")
      ;                    (lambda () (interactive)
      ;                      (start-process "spotify-ctl" nil mediacmd "-s" )))
      )

    (require 'exwm-randr)
    (setq exwm-randr-workspace-output-plist '(0 "HDMI1" 1 "HDMI1" 2 "HDMI1"))
    (add-hook 'exwm-randr-screen-change-hook
              (lambda ()
                (start-process-shell-command
                 "xrandr" nil "xrandr --output HDMI1 --left-of eDP1 --auto")))
    (exwm-randr-enable)

    (require 'exwm-systemtray)
    (exwm-systemtray-enable)

    ;(require 'desktop)
    ;(setq desktop-save 1
    ;      desktop-restore-frames nil
    ;      ;; Don't save remote files and/or *gpg files.
    ;      desktop-files-not-to-save "\\(^/[^/:]*:\\|(ftp)$\\)\\|\\(\\.gpg$\\)")
    ;(setq desktop-save-mode 1)

    (require 'ob-ipython)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '(
       (python . t)
       (ipython . t)
       (emacs-lisp . t)
       ))
    ;;don't prompt me to confirm everytime I want to evaluate a block
    (setq org-confirm-babel-evaluate nil)

    ;(spacemacs|use-package-add-hook ob
     ; :post-init
    (with-eval-after-load 'org
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "vp" 'org-babel-previous-src-block
        "vn" 'org-babel-next-src-block
        "ve" 'org-babel-execute-maybe
        "vo" 'org-babel-open-src-block-result
        "vv" 'org-babel-expand-src-block
        "vu" 'org-babel-goto-src-block-head
        "vg" 'org-babel-goto-named-src-block
        "vr" 'org-babel-goto-named-result
        "vb" 'org-babel-execute-buffer
        "vs" 'org-babel-execute-subtree
        "vd" 'org-babel-demarcate-block
        "vt" 'org-babel-tangle
        "vf" 'org-babel-tangle-file
        "vc" 'org-babel-check-src-block
        "vj" 'org-babel-insert-header-arg
        "vl" 'org-babel-load-in-session
        "vi" 'org-babel-lob-ingest
        "vI" 'org-babel-view-src-block-info
        "vz" 'org-babel-switch-to-session-with-code
        "va" 'org-babel-sha1-hash
        "vh" 'org-babel-describe-bindings
        "vx" 'org-babel-do-key-sequence-in-edit-buffer
        "vk" 'org-babel-remove-result-one-or-many
        "vm" 'org-babel-mark-block)
      )

    (setq org-startup-with-inline-images nil)
    ;; display/update images in the buffer after I evaluate
    ;(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

    (require 'ox-latex)
    ;(require 'ox-beamer)
    ;(setq org-export-allow-bind-keywords t)
    ;(add-to-list 'org-latex-packages-alist '("" "minted")) added by custom instead
    ;(ox-extras-activate '(ignore-headlines))
    (setq org-latex-listings 'minted)

    (add-to-list 'org-latex-minted-langs '(ipython "python"))

    (setq org-latex-packages-alist '(("" "minted" t)
                                     ("" "svg" nil)
                                     ;("margin=1in,headsep=0.4in,headheight=14pt" "geometry" nil)
                                     ("" "geometry" nil)
                                     ("" "fancyhdr" nil)
                                     ("" "parskip" nil)))


    (with-eval-after-load 'company
      ;(require 'company-simple-complete)

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

      (push (apply-partially #'cl-remove-if
                             (lambda (c)
                               (or (string-match-p "[^\x00-\x7F]+" c)
                                   (string-match-p "[0-9]+" c)
                                   (if (equal major-mode "org")
                                       (>= (length c) 20)))))
            company-transformers)

      (defun my-org-mode-hook ()
        (spacemacs/toggle-smartparens-on)
        (spacemacs/toggle-auto-fill-mode-on)
        (add-hook 'completion-at-point-functions 'pcomplete-completions-at-point nil t))
      (add-hook 'org-mode-hook #'my-org-mode-hook)

    ;(global-ycmd-mode)
    ;(ycmd-toggle-force-semantic-completion)
    ;(company-ycmd-setup)
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

    (setq python-shell-prompt-detect-failure-warning nil)

    (setq TeX-view-program-selection '((output-pdf "pdf-tools")))
    (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
    (add-hook 'TeX-after-compilation-finished-functions
              #'TeX-revert-document-buffer)

    ;(require 'fill-column-indicator)
    ;(add-hook 'prog-mode-hook 'turn-on-fci-mode)
    ;(add-hook 'text-mode-hook 'turn-on-fci-mode)
    (add-hook 'prog-mode-hook 'column-enforce-mode)
    (add-hook 'text-mode-hook 'column-enforce-mode)

    (defun my-startup-processes ()
      ;(start-process "volumeicon" nil "volumeicon")
      (start-process "connman-gtk" nil "connman-gtk")
      (start-process "cbatticon" nil
                     "/usr/bin/cbatticon" "-l" "8" "-r" "3" "-i" "symbolic"
                     "-u" "20" "-c" "\"halt\"")
      ;(start-process "gnome-keyring-daemon" nil
      ;               "/usr/bin/gnome-keyring-daemon --start --components=secrets")
      (start-process "evolution-alarm-notify" nil
                     "/usr/lib/evolution/evolution-alarm-notify")
      (start-process "mkd.py" nil
                     "/home/akyle/koel/mediakeys-daemon/src/mkd.py" "-d")
      ;(start-process "/usr/lib/notification-daemon-1.0/notification-daemon" nil
      ;               "/usr/lib/notification-daemon-1.0/notification-daemon")
      (start-process "firefox" nil "firefox")
      (start-process "calendar" nil "gnome-calendar")
      ;(start-process "xbindkeys" nil "xbindkeys")
      )

    (defun my-startup-layout ()
      (interactive)
      (switch-to-buffer "Firefox")
      (exwm-workspace-move-window 9)
      (switch-to-buffer "Gnome-calendar")
      (exwm-workspace-move-window 8)
      (exwm-workspace-switch 0)
      (split-window-right)
      (setq current-prefix-arg '(4))
      (call-interactively 'spacemacs/default-pop-shell)
      (evil-normal-state)
      (evil-emacs-state)
      (other-window 1)
      (org-agenda-list))

    (add-hook 'exwm-init-hook 'my-startup-processes)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-extra-options "\"-shell-escape\"")
 '(alert-default-style (quote libnotify))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(company-math-allow-latex-symbols-in-faces t)
 '(company-show-numbers t)
 '(compilation-message-face (quote default))
 '(confirm-kill-emacs (quote yes-or-no-p))
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
 '(org-agenda-window-setup (quote current-window))
 '(org-edit-src-content-indentation 0)
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)
     ("\\.png\\'" . "eog -w \"%s\"")
     ("\\.svg\\'" . "eog -w \"%s\""))))
 '(org-latex-caption-above nil)
 '(org-latex-pdf-process
   (quote
    ("%latex -interaction nonstopmode -shell-escape -output-directory %o %f" "%latex -interaction nonstopmode -shell-escape -output-directory %o %f" "%latex -interaction nonstopmode -shell-escape -output-directory %o %f")))
 '(org-latex-table-scientific-notation "$%s\\times10^{%s}$")
 '(org-preview-latex-default-process (quote imagemagick))
 '(org-src-tab-acts-natively t)
 '(org-src-window-setup (quote other-window))
 '(package-selected-packages
   (quote
    (diminish tide typescript-mode unfill fuzzy web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode winum helm-purpose auctex-latexmk ob-sml sml-mode spray jade-mode exwm evil-indent-textobject evil-leader company-math math-symbol-lists web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data ob-ipython dash-functional org pcache undo-tree hide-comnt disaster company-c-headers cmake-mode clang-format csv-mode latex-preview-pane pdf-tools tablist yapfify uuidgen py-isort org-projectile org-download mwim live-py-mode link-hint git-link flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump column-enforce-mode cuda-mode flycheck-ycmd company-ycmd ycmd request-deferred deferred zenburn-theme monokai-theme solarized-theme ein websocket xterm-color toc-org smeargle shell-pop pyvenv pytest pyenv-mode py-yapf pip-requirements orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets multi-term mmm-mode markdown-toc markdown-mode magit-gitflow hy-mode htmlize helm-pydoc helm-gitignore request helm-flyspell helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flycheck-pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-prompt-extras esh-help diff-hl cython-mode company-statistics company-quickhelp pos-tip company-auctex company-anaconda company auto-yasnippet yasnippet auto-dictionary auctex anaconda-mode pythonic f ac-ispell auto-complete ws-butler window-numbering volatile-highlights vi-tilde-fringe spaceline s powerline smooth-scrolling restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox hydra spinner page-break-lines open-junk-file neotree move-text macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight elisp-slime-nav define-word clean-aindent-mode buffer-move bracketed-paste auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build use-package which-key bind-key bind-map evil spacemacs-theme)))
 '(pdf-misc-print-programm "/home/akyle/dotfiles/print.py")
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(python-shell-completion-native-disabled-interpreters (quote ("jupyter" "pypy")))
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
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(term-color-black ((t (:foreground "dim gray")))))
