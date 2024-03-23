;; Source: https://emacs.stackexchange.com/questions/18504/gnus-how-to-strip-all-html-tags-from-incoming-mails

(defun strip-html ()
  "Remove HTML tags from the current buffer."
  (interactive "*")
  (save-excursion
    (save-restriction
      (goto-char (point-min))
      (while (re-search-forward "<[^<]*>" (point-max) t)
	(replace-match "\\1"))
      (goto-char (point-min))
      (replace-string "&copy;" "©")
      (goto-char (point-min))
      (replace-string "&amp;" "&")
      (goto-char (point-min))
      (replace-string "&lt;" "<")
      (goto-char (point-min))
      (replace-string "&gt;" ">")
      (goto-char (point-min)))))
