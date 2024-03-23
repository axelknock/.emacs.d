;; https://emacs.stackexchange.com/questions/54809/rename-org-buffers-to-orgs-title-instead-of-filename
;; (defun org+-buffer-name-to-title (&optional end)
;;   "Rename buffer to value of #+TITLE:.
;; If END is non-nil search for #+TITLE: at `point' and
;; delimit it to END.
;; Start an unlimited search at `point-min' otherwise."
;;   (interactive)
;;   (let ((beg (or (and end (point))
;;                  (point-min))))
;;     (save-excursion
;;       (when end
;;         (goto-char end)
;;         (setq end (line-end-position)))
;;       (goto-char beg)
;;       (when (re-search-forward "(?i)^[[:space:]]*#\\+title:[[:space:]]*\\(.*?\\)[[:space:]]*$" end t)
;;         (rename-buffer (match-string 1)))))
;;   nil)
(defun org-title-to-buffer-name ()
  "Rename buffer to value of #+TITLE: (case-insensitive)."
  (interactive)
  (let ((title (org-get-title)))
    (when title
        (rename-buffer title))))

(add-hook 'org-mode-hook 'org-title-to-buffer-name)
