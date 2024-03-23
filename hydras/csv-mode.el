(major-mode-hydra-define csv-mode (:quit-key "q")
    ("Mode Change"
     (("`" fundamental-mode "Fundamental mode"))
     "Sort"
     (("s" csv-sort-fields
       "Sort lines lexicographically")
      ("n" csv-sort-numeric-fields
       "Sort lines numerically")
      ("r" csv-reverse-region "Reverse region")
      ("d" csv-toggle-descending "Toggle ‘csv-descending’"))
     "Copy"
     (("k" csv-kill-fields "Kill specified fields in region")
      ("y" csv-yank-fields
       "Yank fields as the ARGth field IN region")
      ("z" csv-yank-as-new-table "Yank as new table at point")
      ("t" csv-transpose
       "Rewrite rows as columns"))
     "Display"
     (("a" csv-align-fields "Align fields in region")
      ("u" csv-unalign-fields
       "Undo soft alignment")
      ("v" csv-toggle-invisibility "Toggle ‘buffer-invisibility-spec’")
      ("c" csv-set-comment-start
       "Set comment start for buffer"))))
