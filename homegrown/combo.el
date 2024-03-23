(defvar my-repeat-last-command nil
  "Holds the last non-self-inserting command.")

(defvar my-repeat-key ?z  ;; ASCII code for space is 32 or ?\s
  "The key to use for repeating the last command.")

(defvar my-repeat-in-progress nil
  "Flag to indicate whether a repeat command is in progress.")

(defun my-check-last-command ()
  "Check the last command and save it if it's not a self-inserting command."
  (unless
      (or (eq this-command 'self-insert-command)
          (eq this-command 'my-repeat-command))
    (setq my-repeat-last-command this-command)))

(defun my-repeat-command ()
  "Repeat the last non-self-inserting command."
  (interactive)
  (let ((my-repeat-in-progress t))
    (when my-repeat-last-command
      (call-interactively my-repeat-last-command))))

(defun my-setup-repeat-key ()
  "Set up the repeat key in a transient keymap."
  (unless (or my-repeat-in-progress
              (eq this-command 'self-insert-command))
    (let ((map (make-sparse-keymap)))
      (define-key map (vector my-repeat-key) 'my-repeat-command)
      (set-transient-map map t))))

(define-minor-mode combo-mode
  "A minor mode for repeating the last non-self-inserting command with a single key."
  :lighter " MyRepeat"
  :keymap (let ((map (make-sparse-keymap)))
            map)
  (if combo-mode
      (progn
        (add-hook 'post-command-hook 'my-check-last-command nil t)
        (add-hook 'post-command-hook 'my-setup-repeat-key nil t))
    (remove-hook 'post-command-hook 'my-check-last-command t)
    (remove-hook 'post-command-hook 'my-setup-repeat-key t)))

(provide 'combo-mode)
