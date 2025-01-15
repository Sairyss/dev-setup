;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 15 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 15))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
(setq org-directory "/mnt/sdb/Notes/Org"
      org-roam-directory "/mnt/sdb/Notes/Org/roam"
      org-roam-index-file "/mnt/sdb/Notes/Org/roam/index.org")

(setq org-agenda-files '("/mnt/sdb/Notes/Org/Daily"
                         "/mnt/sdb/Notes/Org/agenda/agenda.org" "/mnt/sdb/Notes/Org/agenda/incubate.org"
                         "/mnt/sdb/Notes/Org/agenda/openquestions.org"))
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; Custom config
(setq org-plantuml-jar-path (expand-file-name "/usr/share/java/plantuml/plantuml.jar"))

;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶ ✿
;;; Small
;; ► • ★ ▸
;;(setq org-superstar-headline-bullets-list '("●" "◉" "○" "✸"))

;; Hide org mode marker elements (like / and * etc)
(setq org-hide-emphasis-markers t)

;; Move between windows using shift + left or shift + right
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; enable org-modern to beautify org mode
(with-eval-after-load 'org (global-org-modern-mode))

;; disable some styling of org-modern
(setq org-modern-table nil)
(setq org-modern-todo nil)
(setq org-modern-priority nil)

;; reset symbol remap to default
;;(global-set-key "s" 'self-insert-command)

;; disable evil-snipe to anoble another goto package
(after! evil-snipe
  (evil-snipe-mode -1))

(define-key evil-normal-state-map "s" 'evil-avy-goto-word-1)

(map! :map emacs-lisp-mode
      :nv   "s" #'evil-avy-goto-word-1)

;;Save recent files history every time emacs is closed
;;https://emacs.stackexchange.com/questions/16567/emacs-cant-save-history-of-recent-visited-files-opened-in-current-session-befor
(add-hook 'delete-terminal-functions (lambda (terminal) (recentf-save-list)))

;; org download save image to the directory relative to org file
;; https://emacs.stackexchange.com/questions/71100/pasting-images-from-clipboard-into-orgmode
(after! org-download
  (setq org-download-method 'directory)
  (setq org-download-image-dir (concat (file-name-sans-extension (buffer-file-name)) "-img"))
  (setq org-download-image-org-width 600)
  (setq org-download-link-format "[[file:%s]]\n"
        org-download-abbreviate-filename-function #'file-relative-name)
  (setq org-download-link-format-function #'org-download-link-format-function-default))

;; https://github.com/tefkah/org-roam-timestamps
(use-package! org-roam-timestamps
  :after org-roam
  :config (org-roam-timestamps-mode))

;; https://jethrokuan.github.io/org-roam-guide/
;;  Org-roam capture templates
(setq org-roam-capture-template[[id:bbf709c6-69a1-46eb-ad53-29bf33bc83ac][test]]s
      '(("m" "main" plain
         "%?"
         :if-new (file+head "main/${slug}.org"
                            "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("r" "reference" plain "%?"
         :if-new
         (file+head "reference/${title}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("a" "article" plain "%?"
         :if-new
         (file+head "articles/${title}.org" "#+title: ${title}\n#+filetags: :article:\n")
         :immediate-finish t
         :unnarrowed t)))


;; Improve scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Set frame transparency and maximize windows by default.
(set-frame-parameter (selected-frame) 'alpha '(98. 98))
(add-to-list 'default-frame-alist '(alpha . (98 . 98)))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Increase the size of various headings
(set-face-attribute 'org-document-title nil :font "Iosevka Aile" :weight 'bold :height 1.3)
(dolist (face '((org-level-1 . 1.3)
                (org-level-2 . 1.2)
                (org-level-3 . 1.1)
                (org-level-4 . 1.05)
                (org-level-5 . 1.05)
                (org-level-6 . 1.05)
                (org-level-7 . 1.05)
                (org-level-8 . 1.05)))
  (set-face-attribute (car face) nil :font "Iosevka Aile" :weight 'medium :height (cdr face)))

;; Make sure org-indent face is available
(require 'org-indent)

;; Enable proper Unicode glyph support
(use-package unicode-fonts
  :disabled
  :if (not dw/is-termux)
  :custom
  (unicode-fonts-skip-font-groups '(low-quality-glyphs))
  :config
  ;; Fix the font mappings to use the right emoji font
  (mapcar
   (lambda (block-name)
     (dw/replace-unicode-font-mapping block-name "Apple Color Emoji" "Noto Color Emoji"))
   '("Dingbats"
     "Emoticons"
     "Miscellaneous Symbols and Pictographs"
     "Transport and Map Symbols"))
  (unicode-fonts-setup))

;; Comment lines
(use-package evil-nerd-commenter
  :bind ("C-/" . evilnc-comment-or-uncomment-lines))
