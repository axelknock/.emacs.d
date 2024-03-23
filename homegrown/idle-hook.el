;;; package --- Simple idle hook

;;; Commentary:
;; After Emacs is idle for a given period, executing some elisp would
;; be desirable.  Especially so for a synchronous process that prevents
;; user input.

;;; Code:
(defvar my/idle-hook )

(provide 'my/idle-hook)
;;; idle-hook.el ends here
