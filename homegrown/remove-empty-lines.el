(defun my/remove-blank-lines ()
  "Remove all blank lines in the buffer."
  (interactive)
  (flush-lines "^\\s-*$"))
