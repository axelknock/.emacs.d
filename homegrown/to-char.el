;;; Package --- Summary: Utility point-moving functions                    -*- lexical-binding: t; -*-
;;; Commentary:
;;  Interactive functions that use minibuffer inputs don't work well
;;  with 'multiple-cursors-mode', and so I wrote a couple of utility
;;  functions that use active region as psuedo-input.

;; To use:
;; [Activate 'multiple-cursors-mode'] -> [Type/Region-select Argument] -> [Run 'my/mc/forward-to-string']

;;; Code:
(defun my/forward-to-char (char)
  "Move pointer forward until it is on CHAR."
  (interactive "cChar:")
  (let ((start (point)))
    (while (null (equal char (string-to-char (buffer-substring-no-properties (point) (- (point) 1)))))
      (forward-char)
      (if (equal (point) (buffer-end 1))
	  (progn
	    (goto-char start)
	    (error "Char not found"))))))

(defun my/backward-to-char (char)
  "Move pointer backward until it is on CHAR."
  (interactive "cChar:")
  (let ((start (point)))
    (while (null (equal char (string-to-char (buffer-substring-no-properties (point) (- (point) 1)))))
      (backward-char)
      (if (equal (point) (buffer-end -1))
	  (progn
	    (goto-char start)
	    (error "Char not found")))))
  (backward-char))

(defun my/forward-to-regex (&optional count)
  "Delete selected region and move COUNT instances forward."
  (interactive "P")
  (let ((region (buffer-substring-no-properties (region-beginning) (region-end))))
    (unless (length> region 0) (error "Region must be selected"))
    (delete-region (region-beginning) (region-end))
    (re-search-forward region nil t count)
    (dotimes (i (length region))
      (backward-char))))

(defun my/backward-to-regex (&optional count)
  "Delete selected region and move to last instance."
  (interactive)
  (let ((region (buffer-substring-no-properties (region-beginning) (region-end))))
    (unless (length> region 0) (error "Region must be selected"))
    (delete-region (region-beginning) (region-end))
    (re-search-backward region nil t count)))

(defun my/mc/forward-to-string ()
  "Move each cursor to successive region matches."
  (interactive)
  (dotimes (jumps (mc/num-cursors))
    (my/forward-to-string jumps)))

;;; to-char.el ends here
