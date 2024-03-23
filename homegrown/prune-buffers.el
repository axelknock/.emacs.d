(defun close-old-buffers (minutes)
  "Close all buffers that haven't been opened in the last MINUTES minutes."
  (interactive "nMinutes: ")
  (let ((current-time (float-time))
        (inactive-buffers '()))
    (dolist (buffer (buffer-list))
      (with-current-buffer buffer
        (when (and (buffer-file-name)
                   (> (- current-time (float-time (buffer-local-value 'buffer-display-time (current-buffer)))) (* minutes 60)))
          (push buffer inactive-buffers))))
    (dolist (buffer inactive-buffers)
      (kill-buffer buffer))
    (message "Closed %d old buffers." (length inactive-buffers))))
