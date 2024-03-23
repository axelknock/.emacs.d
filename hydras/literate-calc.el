(major-mode-hydra-define literate-calc-mode (:quit-key "q")
  ("Mode Change"
     (("`" fundamental-mode "Fundamental mode"))
   "Evaluate"
   (("b" literate-calc-eval-buffer "All expressions in order")
    ("l" literate-calc-eval-line "Current line"))
   "Overlays"
   (("o" literate-calc-clear-overlays "Remove overlays"))
   "Results"
   (("i" literate-calc-insert-results "Insert results")
    ("r" literate-calc-remove-results "Remove inserted results in region"))))
