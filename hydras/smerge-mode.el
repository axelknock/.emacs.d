(pretty-hydra-define smerge-hydra
  (:foreign-keys warn :color pink :quit-key "q")
  ("Move"
   (("n" smerge-next "next")
    ("p" smerge-prev "prev"))
   "Keep"
   (("b" smerge-keep-base "base")
    ("u" smerge-keep-upper "upper")
    ("l" smerge-keep-lower "lower")
    ("a" smerge-keep-all "all")
    ("RET" smerge-keep-current "current"))
   "Diff"
   (("<" smerge-diff-base-upper "base/upper")
    ("=" smerge-diff-upper-lower "upper/lower")
    (">" smerge-diff-base-lower "Refine")
    ("R" smerge-refine "Refine")
    ("E" smerge-ediff "Ediff"))
   "Other"
   (("C" smerge-combine-with-next "Combine")
    ("r" smerge-resolve "Resolve")
    ("k" smerge-kill-current "kill current")
    ("q" nil "cancel"))))
