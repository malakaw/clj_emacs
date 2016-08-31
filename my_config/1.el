;;--------------basic-----------------------
;;(menu-bar-mode 0)
(tool-bar-mode 0)



;;--------------Theme-----------------------
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/my_config/custom-themes/noctilux-theme-master")
;;(load-theme 'noctilux t)
;;--------------session--------------
(require 'desktop)
(setq desktop-base-lock-name
      (convert-standard-filename (format ".emacs.desktop.lock-%d" (emacs-pid))))
(desktop-save-mode 1)
  
(setq bookmark-save-flag 1)

;;-------------speedbar----------------------------

(custom-set-variables
 '(speedbar-show-unknown-files t)
)
(global-set-key [(f1)] 'speedbar-get-focus)

;;------------window---------------
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))




(window-numbering-mode 1)
;;(require 'window-numbering)




;;(windmove-default-keybindings)

;;Control-Command==> C-s;作用左、右移
(global-set-key (kbd "C-s-<down>") 'enlarge-window)
(global-set-key (kbd "C-s-<up>") 'shrink-window)
(global-set-key (kbd "C-s-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-s-<right>") 'shrink-window-horizontally)

;;-----------replace/edit-----------------


;;multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-.") 'mc/mark-all-like-this)



;;--------------biasic---------------------
(show-paren-mode t)
(ac-config-default)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;(require 'autopair)
;;(autopair-global-mode) ;; 自动补全括号

;;列编辑
(cua-mode 1)


;;--------------restclient---------------------
(require 'restclient)
;;(add-to-list  'company-restclient)

;;--------------ido------------------------
(ido-mode 1)
(ido-everywhere 1)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)






;;---------helm---------------
(add-to-list 'load-path "~/.emacs.d/helm/helm")

(require 'helm-config)
(helm-mode 1)

(require 'helm)
(add-to-list 'load-path "~/.emacs.d/helm/helm_swoop")

(require 'helm-swoop)


;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; When doing evil-search, hand the word over to helm-swoop
;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

(global-set-key (kbd "C-x /") 'helm-find-files)

;;------copy------
(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point)
  )

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end)))
  )

(defun paste-to-mark(&optional arg)
  "Paste things to mark, or to the prompt in shell-mode"
  (let ((pasteMe
     	 (lambda()
     	   (if (string= "shell-mode" major-mode)
               (progn (comint-next-prompt 25535) (yank))
             (progn (goto-char (mark)) (yank) )))))
    (if arg
        (if (= arg 1)
            nil
          (funcall pasteMe))
      (funcall pasteMe))
    ))

(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  ;;(paste-to-mark arg)
  )
(global-set-key (kbd "C-c w")         (quote copy-word))


;;---------line control----------
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))


(global-set-key (kbd "C-<up>") 'move-line-up)
(global-set-key (kbd "C-<down>") 'move-line-down)

(require 'linum)
(global-linum-mode t)

(global-set-key "\M-w"
                (lambda ()
                  (interactive)
                  (if mark-active
                      (kill-ring-save (region-beginning)
                                      (region-end))
                    (progn
                      (kill-ring-save (line-beginning-position)
                                      (line-end-position))
                      (message "copied line")))))



(global-set-key "\C-w"
                (lambda ()
                  (interactive)
                  (if mark-active
                      (kill-region (region-beginning)
                                   (region-end))
                    (progn
                      (kill-region (line-beginning-position)
                                   (line-end-position))
                      (message "killed line")))))



;;-------------org or markdown-------------
 (custom-set-variables
 '(markdown-command "/usr/local/bin/pandoc"))

(add-to-list 'load-path "~/.emacs.d/my_download/markdown/")
(autoload 'markdown-mode "markdown-mode"
 	"Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'". markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'". markdown-mode))


;;----------json-----------------------
(defun json-format ()
(interactive)
(save-excursion
(shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
)
)



;;----------uml/design-------------------------
;;----------plantuml--------------

(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d_all/my_download/plantuml/plantuml.jar"))


;;--------org-plot-------------

(local-set-key "\M-\C-g" 'org-plot/gnuplot)

;;--------org--------------
(load-file "~/.emacs.d/my_download/epresent.el")
;;(load-file "~/.emacs.d/my_download/org-s5.el")



;;-----------remote-tramp-------------
(require 'tramp) 
(setq password-cache-expiry nil)
