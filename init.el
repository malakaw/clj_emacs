

;;--------------package--------------

(require 'package)
(package-initialize)
(add-to-list 'package-archives  '("melpa" . "http://stable.melpa.org/packages/"))
;;(add-to-list 'package-archives  '("melpa" . "http://melpa.org/packages/"))
;;(setq package-archives
;;  '(("melpa" . "http://melpa.milkbox.net/packages/")) )







;;----el-get-----------------
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)



(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))


(load-user-file "~/.emacs.d/my_config/1.el")


;;--------clojure begin-------------
(add-to-list 'exec-path "/usr/local/bin")
(require 'clj-refactor)



(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))


(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)


;;----------paredit------------------------
(paredit-mode 1)

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  1)

(global-set-key (kbd "C-S-<left>") 'paredit-forward-barf-sexp)
(global-set-key (kbd "C-S-<right>") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "M-\"") 'paredit-meta-doublequote)




	

;;----------javascript------------
(add-to-list 'load-path "~/.emacs.d/my_download/tern/")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


;;----------python-----------
(elpy-enable)
;;(elpy-use-ipython)
;;(setq elpy-rpc-backend "jedi")  
;;(add-to-list 'load-path "~/.emacs.d/my_config/python")
;;(require 'flymake-easy)
;;(require 'flymake-python-pyflakes)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fcecf5757b909acbacc4fea2fa6a5fb9a63776be43cbff1dc0dffc9c02674478" default)))
 '(markdown-command "/usr/local/bin/pandoc")
 '(speedbar-show-unknown-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
