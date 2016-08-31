(defvar org-s5-html-preamble-header nil)
(defvar org-s5-html-preamble-footer nil)

(defun org-s5-string-or-call (v)
  (or
   (and org-s5-html-preamble-footer
        (or (and (functionp v)
                 (funcall v))
            (and (stringp v) v)))
   ""))

(defun org-s5-html-preamble-function (&rest ignore)
  (when (and (boundp 'html-pre-real-contents)
             (null html-pre-real-contents))
    (setq html-pre-real-contents ""))
  (insert (format "<div class='layout'>
<div id='controls'></div>
<div id='currentSlide'></div>
<div id='header'>%s</div>
<div id='footer'>%s</div>
</div>
<div class='presentation'>
<div class='slide front'>
  <div id='front-logo'></div>
<h1 class='front'>%s</h1><h3>%s</h3></div>"
                  (org-s5-string-or-call org-s5-html-preamble-header)
                  (org-s5-string-or-call org-s5-html-preamble-footer)
                  title author)))

(defun org-s5-html-postamble-function (&rest ignore)
  (insert "</div>"))

(provide 'org-s5)
