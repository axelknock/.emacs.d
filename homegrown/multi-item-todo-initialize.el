;; -*- lexical-binding: t; -*-
(defun check-and-add-todo-checkbox ()
  (interactive)
  (when (org-at-heading-p)
    (save-excursion
      (let ((current-level (org-current-level))
            (original-pos (point-marker)))
        (beginning-of-line)
        (unless (or (looking-at "*+ \\[.?/.?\\]")
                    (looking-at "*+ .... \\[.?/.?\\]"))
          (org-next-visible-heading 1)
          (when (and (> (org-current-level) current-level)
                     (looking-at "\\*+ TODO"))
            (org-previous-visible-heading 1)
            (search-forward-regexp "\\*+ ")
            (forward-char 4)
            (when (looking-at " \\[#.\\]")
              (forward-char 5))
            (insert " [/]")
            (goto-char original-pos)))
        (set-marker original-pos nil)))))
