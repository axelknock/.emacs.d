;;; -*- lexical-binding: t; -*-
;;; handleize --- Summary:

;;; Commentary:
;; Some exceedingly simple utility functions to help deal with HTML markup.

;;; Code:
(defun my/handleize-string (s)
  "Handleize S."
  (downcase (s-replace-regexp "[ ’]" "-"
			      (s-replace-regexp "[!?.'`,\"()<>;:]" "" s))))

(defun my/handleize-region ()
  "Handleize currently selected region."
  (interactive)
  (setq selected-region (buffer-substring (mark) (point)))
  (delete-region (region-beginning) (region-end))
  (insert (my/handleize-string selected-region)))

(defun my/add-handleized-headings () ;; TODO make this actually work
  "Search buffer for HTML formatted headings and add handleized forms of their contents as IDs."
  (interactive)
  (while (re-search-forward ">\(.+\)</h2" nil t)
    (replace-match (match-string 1) nil nil)))

;;; handleize.el ends here
