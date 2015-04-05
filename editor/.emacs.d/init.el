;; Emacs directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; Package management
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defun package-install-with-refresh (package)
  (unless (assq package package-alist)
    (package-refresh-contents))
  (unless (package-installed-p package)
    (package-install package)))

;; Install evil
(package-install-with-refresh 'evil)

;; Enable evil
(require 'evil)
(evil-mode 1)

;; language
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)

;; design
;;;; theme
(load-theme 'deeper-blue t)

;; line and column
(require 'linum)
(global-linum-mode)
(line-number-mode t)
(column-number-mode t)

;; backup
(setq backup-directory-alist
  (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
        backup-directory-alist))

;; autosave
(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/.emacs.d/backup/") t)))
