(defvar my-username           "YOURNAME")
(defvar my-emacs-path         "YOUREMACSPATH")
(defvar my-extra-auth-sources "YOURAUTHSOURCES")
(defvar my-shell              "sh")
(defvar my-denote-directory   nil)
(defvar my-org-directory      "YOURORGDIRECTORY")
(defvar my-latitude           40.001)
(defvar my-longitude          -80.001)
(defvar my-emacs-backups      `(,(cons "." (expand-file-name ".backups/" my-emacs-path))))
(defvar my-save-place         (expand-file-name "data/save-place.el" my-emacs-path))
(defvar my-dirvish-cache-dir  (expand-file-name "data/dirvish/.cache/" my-emacs-path))
(defvar my-selected-font      "Monospace")
(defvar my-symbol-font        nil)
