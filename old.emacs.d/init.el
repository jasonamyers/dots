(add-to-list 'load-path "~/elisp/bbdb/lisp")
(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(defvar my-packages '(better-defaults paredit idle-highlight-mode ido-ubiquitous
                                      find-file-in-project magit smex scpaste elpy
                                      rainbow-delimiters smart-mode-line))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(elpy-enable)
(load-theme 'monokai t)
(require 'rainbow-delimiters)
(require 'better-defaults)
(setq column-number-mode 't)
(setq sml/theme 'dark)
(setq sml/shorten-modes 't)
(add-hook 'after-init-hook 'sml/setup)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(defun mkdir-if-not (dir)
  "Make directory if it doesn't exist"
  (unless (file-exists-p dir) (mkdir dir)))

;;; Configure backups
(mkdir-if-not "~/.emacs.d/backups")
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-by-copying t)
(add-hook 'python-mode-hook
          (lambda ()
            (progn
              (setq whitespace-line-column 79)
              (setq whitespace-style '(face lines-tail))
              (whitespace-mode))))

;;; Set default font
(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Hack-15"))

;; Fontify current frame
(fontify-frame nil)
;; Fontify any future frames
(push 'fontify-frame after-make-frame-functions)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   (quote
    ("d9db2602073498bfa3d591e2ce70de3e9c144c30aeacf9e667b0fb9139f38f50" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "9558f71c706fba7b136e75d9c5e73ddd2c9d91e76e2b18f733d4ab2f388f3b72" default)))
 '(inhibit-default-init nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message
   ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

")
 '(ispell-program-name "/usr/local/bin/aspell"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
