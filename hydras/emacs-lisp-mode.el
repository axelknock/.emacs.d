(major-mode-hydra-define emacs-lisp-mode nil
    ("Mode Change"
     (("`" fundamental-mode "Fundamental mode"))
     "Eval"
     (("b" eval-buffer "buffer")
      ("e" eval-defun "defun")
      ("r" eval-region "region"))
     "REPL"
     (("I" ielm "ielm"))
     "Test"
     (("t" ert "prompt")
      ("T" (ert t) "all")
      ("F" (ert :failed) "failed"))
     "Doc"
     (("d" describe-foo-at-point "thing-at-pt")
      ("f" (describe-function (sexp-at-point)) "function")
      ("v" (describe-variable (sexp-at-point)) "variable")
      ("i" (info-lookup-symbol (sexp-at-point)) "info lookup"))))
