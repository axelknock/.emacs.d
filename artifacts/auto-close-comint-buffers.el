;; -*- lexical-binding: t; -*-
;; https://emacs.stackexchange.com/questions/48306/how-to-automatically-kill-a-shell-buffer-when-the-shell-process-exits

(defun my/add-process-sentinel (sentinel &optional process)
  "Add SENTINEL to PROCESS.
PROCESS defaults to the process of the current buffer.
Use this function with care.
If there is already a process sentinel SENTINEL is used as after-advice.
That can fail if the process sentinel is reset by some other function."
  (unless process
    (setq process (get-buffer-process (current-buffer))))
  (let ((old (process-sentinel process)))
    (cond
     ((symbolp old)
      (advice-add old :after sentinel))
     ((null old)
      (set-process-sentinel process sentinel))
     (t (warn "Cannot set sentinel %S for process %S." sentinel process)))))

(defun my/kill-buffer ()
  "Custom `shell-mode' behaviours."
  ;; Kill the buffer when the shell process exits.
  (my/add-process-sentinel
   (lambda (process signal)
     (and (memq (process-status process) '(exit signal))
          (buffer-live-p (process-buffer process))
          (kill-buffer (process-buffer process))))))

(add-hook 'comint-mode-hook 'my/kill-buffer)

;; Alternatively:
;; (defun my-shell-mode-hook ()
;;   "Custom `shell-mode' behaviours."
;;   ;; Kill the buffer when the shell process exits.
;;   (let* ((proc (get-buffer-process (current-buffer)))
;;          (sentinel (process-sentinel proc)))
;;     (set-process-sentinel
;;      proc
;;      `(lambda (process signal)
;;         ;; Call the original process sentinel first.
;;         (funcall #',sentinel process signal)
;;         ;; Kill the buffer on an exit signal.
;;         (and (memq (process-status process) '(exit signal))
;;              (buffer-live-p (process-buffer process))
;;              (kill-buffer (process-buffer process)))))))

;; (add-hook 'shell-mode-hook 'my-shell-mode-hook)
