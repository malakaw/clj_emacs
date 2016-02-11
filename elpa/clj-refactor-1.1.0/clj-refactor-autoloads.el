;;; clj-refactor-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (clj-refactor-mode cljr-create-fn-from-example
;;;;;;  cljr-toggle-debug-mode cljr-version cljr-reload-config cljr-inline-symbol
;;;;;;  cljr-add-stubs cljr-extract-function cljr-hotload-dependency
;;;;;;  cljr-add-missing-libspec cljr-clean-ns cljr-rename-symbol
;;;;;;  cljr-find-usages cljr-promote-function cljr-update-project-dependencies
;;;;;;  cljr-update-project-dependency cljr-add-project-dependency
;;;;;;  cljr-sort-project-dependencies cljr-project-clean cljr-slash
;;;;;;  cljr-splice-sexp-killing-forward cljr-splice-sexp-killing-backward
;;;;;;  cljr-raise-sexp cljr-cycle-if cljr-cycle-coll cljr-cycle-stringlike
;;;;;;  cljr-cycle-privacy cljr-destructure-keys cljr-move-to-let
;;;;;;  cljr-expand-let cljr-introduce-let cljr-thread-last-all cljr-thread-first-all
;;;;;;  cljr-thread cljr-unwind-all cljr-unwind cljr-cycle-thread
;;;;;;  cljr-add-declaration cljr-move-form cljr-stop-referring cljr-replace-use
;;;;;;  cljr-add-import-to-ns cljr-add-use-to-ns cljr-add-require-to-ns
;;;;;;  cljr-remove-unused-requires cljr-sort-ns cljr-rename-file-or-dir
;;;;;;  cljr-add-keybindings-with-modifier cljr-add-keybindings-with-prefix)
;;;;;;  "clj-refactor" "clj-refactor.el" (21938 3784 0 0))
;;; Generated autoloads from clj-refactor.el

(autoload 'cljr-add-keybindings-with-prefix "clj-refactor" "\


\(fn PREFIX)" nil nil)

(autoload 'cljr-add-keybindings-with-modifier "clj-refactor" "\


\(fn MODIFIER)" nil nil)

(autoload 'cljr-rename-file-or-dir "clj-refactor" "\
Rename a file or directory of files.

\(fn OLD-PATH)" t nil)

(autoload 'cljr-sort-ns "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-remove-unused-requires "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-add-require-to-ns "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-add-use-to-ns "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-add-import-to-ns "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-replace-use "clj-refactor" "\
Replace any :use clause with the equivalent :require clause.

Presently, there's no support for :use clauses containing :exclude.

\(fn)" t nil)

(autoload 'cljr-stop-referring "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-move-form "clj-refactor" "\
Move the form containing POINT to a new namespace.

If REGION is active, move all forms contained by region. 

\(fn)" t nil)

(autoload 'cljr-add-declaration "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-cycle-thread "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-unwind "clj-refactor" "\
Unwind thread at point or above point by one level.
Return nil if there are no more levels to unwind.

\(fn)" t nil)

(autoload 'cljr-unwind-all "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-thread "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-thread-first-all "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-thread-last-all "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-introduce-let "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-expand-let "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-move-to-let "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-destructure-keys "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-cycle-privacy "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-cycle-stringlike "clj-refactor" "\
Removed, use `clojure-toggle-keyword-string'

\(fn)" t nil)

(autoload 'cljr-cycle-coll "clj-refactor" "\
Convert the coll at (point) from (x) -> {x} -> [x] -> -> #{x} -> (x) recur

\(fn)" t nil)

(autoload 'cljr-cycle-if "clj-refactor" "\
Cycle surrounding if or if-not, to if-not or if

\(fn)" t nil)

(autoload 'cljr-raise-sexp "clj-refactor" "\
Like paredit-raise-sexp, but removes # in front of function literals and sets.

\(fn &optional ARGUMENT)" t nil)

(autoload 'cljr-splice-sexp-killing-backward "clj-refactor" "\
Like paredit-splice-sexp-killing-backward, but removes # in
front of function literals and sets.

\(fn &optional ARGUMENT)" t nil)

(autoload 'cljr-splice-sexp-killing-forward "clj-refactor" "\
Like paredit-splice-sexp-killing-backward, but removes # in
front of function literals and sets.

\(fn &optional ARGUMENT)" t nil)

(autoload 'cljr-slash "clj-refactor" "\
Inserts / as normal, but also checks for common namespace shorthands to require.

\(fn)" t nil)

(autoload 'cljr-project-clean "clj-refactor" "\
Runs `cljr-project-clean-functions' on every clojure file, then
sorts the project's dependency vectors.

\(fn)" t nil)

(autoload 'cljr-sort-project-dependencies "clj-refactor" "\
Sorts all dependency vectors in project.clj

\(fn)" t nil)

(autoload 'cljr-add-project-dependency "clj-refactor" "\


\(fn FORCE)" t nil)

(autoload 'cljr-update-project-dependency "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-update-project-dependencies "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-promote-function "clj-refactor" "\


\(fn PROMOTE-TO-DEFN)" t nil)

(autoload 'cljr-find-usages "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-rename-symbol "clj-refactor" "\


\(fn NEW-NAME)" t nil)

(autoload 'cljr-clean-ns "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-add-missing-libspec "clj-refactor" "\
Requires or imports the symbol at point.

If the symbol at point is of the form str/join then the ns
containing join will be aliased to str.

\(fn)" t nil)

(autoload 'cljr-hotload-dependency "clj-refactor" "\
Download a dependency (if needed) and hotload it into the current repl session.

Defaults to the dependency vector at point, but prompts if none is found.

\(fn)" t nil)

(autoload 'cljr-extract-function "clj-refactor" "\
Extract the form at point, or the nearest enclosing form, into
  a toplevel defn. 

\(fn)" t nil)

(autoload 'cljr-add-stubs "clj-refactor" "\
Adds implementation stubs for the interface or protocol at point.

\(fn)" t nil)

(autoload 'cljr-inline-symbol "clj-refactor" "\
Inline the symbol at point.

\(fn)" t nil)

(autoload 'cljr-reload-config "clj-refactor" "\
Resend configuration settings to the middleware.

This can be used to avoid restarting the repl session after
changing settings.

\(fn)" t nil)

(autoload 'cljr-version "clj-refactor" "\
Returns the version of the middleware as well as this package.

\(fn)" t nil)

(autoload 'cljr-toggle-debug-mode "clj-refactor" "\


\(fn)" t nil)

(autoload 'cljr-create-fn-from-example "clj-refactor" "\


\(fn)" t nil)

(autoload 'clj-refactor-mode "clj-refactor" "\
A mode to keep the clj-refactor keybindings.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("clj-refactor-pkg.el") (21938 3784 789191
;;;;;;  0))

;;;***

(provide 'clj-refactor-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; clj-refactor-autoloads.el ends here
