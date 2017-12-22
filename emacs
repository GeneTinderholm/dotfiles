(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/myElisp/")

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "77bddca0879cb3b0ecdf071d9635c818827c57d69164291cb27268ae324efa84" "a4c9e536d86666d4494ef7f43c84807162d9bd29b0dfd39bdf2c3d845dcc7b2e" "73e35ffa5ca98b57a9923954f296c3854ce6d8736b31fdbdda3d27502d4b4d69" "a7e7804313dbf827a441c86a8109ef5b64b03011383322cbdbf646eb02692f76" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (use-package company-ycmd company-ycm avy smartparens ycmd solaire-mode company atom-one-dark-theme helm-descbinds spaceline doom-themes projectile doom handlebars-mode prettier-js web-beautify flycheck evil-nerd-commenter evil-surround all-the-icons neotree general rainbow-delimiters org-evil org-link-minor-mode solarized-theme helm evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(require 'evil)
(evil-mode t)

(require 'helm)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;(require 'doom-themes)
;(load-theme 'doom-vibrant)
;(require 'material-theme)
;(load-theme 'material)
;(load-theme 'atom-one-dark)
(load-theme 'solarized-dark)

(global-linum-mode 1)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'smartparens-config)
(add-hook 'prog-mode-hook 'smartparens-mode)

(require 'neotree)
(setq neo-theme 'icons)

(require 'general)
(setq general-default-keymaps 'evil-normal-state-map)
(setq leader-key "SPC")
(require 'auto-format)
(general-define-key :prefix leader-key
		    "u" 'undo-tree-visualize
		    "d" 'helm-descbinds
		    "t" 'term
		    "p" 'auto-format
		    "ff" 'helm-find-files
		    "bb" 'helm-mini
		    "ft" 'neotree-toggle
		    "wh" 'evil-window-left
		    "wj" 'evil-window-down
		    "wk" 'evil-window-up
		    "wl" 'evil-window-right
		    "ac" 'avy-goto-char
		    "al" 'avy-goto-line
		    "aw" 'avy-goto-word-1
		    "SPC" 'helm-M-x)
		    
;;Resolves neotree/evil-mode keybinding conflicts
 (add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "%") 'neotree-create-node)
              (define-key evil-normal-state-local-map (kbd "C") 'neotree-change-root)
              (define-key evil-normal-state-local-map (kbd "W") 'neotree-rename-node)
              (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)
              (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)))

(require 'evil-surround)
(global-evil-surround-mode 1)

(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history t)
(require 'evil-nerd-commenter)
(define-key evil-normal-state-map (kbd "gc") 'evilnc-comment-operator)
(define-key evil-normal-state-map (kbd "-") 'dired-jump)

(show-paren-mode 1)

(add-hook 'js-mode-hook 'prettier-js-mode)

;;fix motion state
(setq evil-normal-state-modes (append evil-motion-state-modes evil-normal-state-modes))
(setq evil-motion-state-modes nil)

;; dired mode fix
(require 'dired)
(require 'vinegar)
(add-hook 'dired-mode-hook (lambda ()
    (dired-hide-details-mode t)
    (dired-omit-mode t)
    (call-interactively 'vinegar-dotfiles-toggle)))
(evil-define-key 'normal dired-mode-map
  (kbd "-") 'dired-up-directory
  (kbd "~") '(lambda ()(interactive) (find-alternate-file "~/"))
  (kbd "h") 'dired-up-directory
  (kbd "j") 'dired-next-line
  (kbd "k") 'dired-previous-line
  (kbd "l") 'dired-find-alternate-file
  (kbd "H") 'vinegar-dotfiles-toggle
  (kbd "f") 'helm-find-files
  (kbd "%") 'find-file
  (kbd "G") 'vinegar-jump-to-bottom
  (kbd "gg") 'vinegar-back-to-top)
(put 'dired-find-alternate-file 'disabled nil)

(require 'spaceline-config)
(spaceline-spacemacs-theme)
(spaceline-helm-mode 1)

(require 'helm-descbinds)
(require 'doom)

;; (require 'projectile)
;; (projectile-mode)
;; (require 'all-the-icons)
;; (require 'eldoc-eval)
;; (require 'evil-anzu)

;; (require 'shrink-path)
;; (require 'doom-modeline)
(put 'company-mode 'disabled nil)

(add-hook 'after-init-hook 'global-company-mode)
