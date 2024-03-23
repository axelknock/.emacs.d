(major-mode-hydra-define
    (list python-mode
          python-ts-mode)
    nil
    ("Mode Change"
     (("`" fundamental-mode "Fundamental mode"))
     "Control Shell"
     (("z" python-shell-switch-to-shell
       "Switch to Python process")
      ("p" run-python "Run Python"))
     "Send to Shell"
     (("l" python-shell-send-file "File")
      ("c" python-shell-send-buffer
       "Buffer")
      ("r" python-shell-send-region
       "Region")
      ("e" python-shell-send-statement
       "Statement at point")
      ("s" python-shell-send-string "String"))
     "Docs"
     (("d" python-describe-at-point "Describe point")
      ("f" python-eldoc-at-point "Eldoc point"))
     "Syntax"
     (("v" python-check "Check file."))
     "Insert"
     (("i" python-add-import "Import statement")
      ("t" python-skeleton-class "Class statement"))))
