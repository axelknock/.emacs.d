;;; -*- lexical-binding: t; -*-
(defun narrow-to-region-indirect (start end &optional p)
  "Restrict editing in this buffer to the current region, indirectly.

When called with a prefix, prompt for new buffer's name."
  (interactive "r")
  (deactivate-mark)
  (let* ((buffer-name (when current-prefix-arg
                        (read-string "New buffer name: ")))
         (buf (clone-indirect-buffer buffer-name nil)))
    (with-current-buffer buf
      (narrow-to-region start end))
    (switch-to-buffer buf)))

(defun narrow-or-widen-indirect-dwim (p)
  "If region is active, narrow-indirect, else kill-buffer."
  (interactive "P")
  (declare (interactive-only))
  (cond ((region-active-p)
         (narrow-to-region-indirect (region-beginning) (region-end)))
        ((buffer-narrowed-p) (kill-buffer))
        (t (message "Region not selected and not in narrowed buffer"))))

(defun join-buffers (p)
  "Combine buffers using completion. If called with P, delete the original buffers."
  (interactive "P")
  (let* ((buffer-names (let (names)
                         (cl-loop for buffer-name = (read-buffer "Enter buffer name (empty to finish): " nil nil)
                                  until (equal buffer-name "")
                                  do (push buffer-name names))
                         (nreverse names)))
         (combined-buffer-name (mapconcat 'identity buffer-names " + "))
         (combined-contents (with-temp-buffer
                              (dolist (buffer-name buffer-names)
                                (when (get-buffer buffer-name)
                                  (insert-buffer-substring (get-buffer buffer-name))
                                  (when p
                                    (kill-buffer buffer-name))))
                              (buffer-string))))
    ;; Create the new buffer with the combined contents
    (let ((new-buffer (get-buffer-create combined-buffer-name)))
      (with-current-buffer new-buffer
        (insert combined-contents)
        (goto-char (point-min)))
      (switch-to-buffer new-buffer))))
