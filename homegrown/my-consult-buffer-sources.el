(defvar my/consult--source-local-buffer
  `(:name "Local Buffers"
          :narrow   ?l
          :category buffer
          :face     consult-buffer
          :history  buffer-name-history
          :state    ,#'consult--buffer-state
          :default  t
          :items ,(lambda () (consult--buffer-query
                         :predicate #'bufferlo-local-buffer-p
                         :sort 'visibility
                         :as #'buffer-name)))
  "Local buffer candidate source for `consult-buffer'.")

(defvar my/consult--source-buffer
  `(:name "All Buffers"
          :narrow   32
          :hidden   t
          :category buffer
          :face     consult-buffer
          :history  buffer-name-history
          :state    ,#'consult--buffer-state
          :items ,(lambda () (consult--buffer-query
                         :sort 'visibility
                         :as #'buffer-name)))
  "All buffer candidate source for `consult-buffer'.")

(defvar my/consult--source-hidden-buffer
  `(:name     "Hidden Buffers"
              :narrow   ?h
              :hidden   t
              :category buffer
              :face     consult-buffer
              :history  buffer-name-history
              :action   ,#'consult--buffer-action
              :items
              ,(lambda () (consult--buffer-query :sort 'visibility
                                            :filter 'invert
                                            :as #'buffer-name)))
  "Hidden buffer candidate source for `consult-buffer'.")

(defvar my/consult--source-modified-buffer
  `(:name     "Modified Buffers"
              :narrow   ?*
              :hidden   t
              :category buffer
              :face     consult-buffer
              :history  buffer-name-history
              :state    ,#'consult--buffer-state
              :items
              ,(lambda () (consult--buffer-query :sort 'visibility
                                            :as #'buffer-name
                                            :predicate
                                            (lambda (buf)
                                              (and (buffer-modified-p buf)
                                                   (buffer-file-name buf))))))
  "Modified buffer candidate source for `consult-buffer'.")

(defvar my/consult--source-recent-file
  `(:name     "Recent Files"
              :narrow   ?f
              :hidden   t
              :category file
              :face     consult-file
              :history  file-name-history
              :state    ,#'consult--file-state
              :new      ,#'consult--file-action
              :enabled  ,(lambda () recentf-mode)
              :items
              ,(lambda ()
                 (let ((ht (consult--buffer-file-hash))
                       items)
                   (dolist (file (bound-and-true-p recentf-list) (nreverse items))
                     ;; Emacs 29 abbreviates file paths by default, see
                     ;; `recentf-filename-handlers'.  I recommend to set
                     ;; `recentf-filename-handlers' to nil to avoid any slow down.
                     (unless (eq (aref file 0) ?/)
                       (let (file-name-handler-alist) ;; No Tramp slowdown please.
                         (setq file (expand-file-name file))))
                     (unless (gethash file ht)
                       (push (consult--fast-abbreviate-file-name file) items))))))
  "Recent file candidate source for `consult-buffer'.")

(defvar my/consult--source-file-register
  `(:name     "File Register"
              :narrow   (?r . "Register")
              :hidden   t
              :category file
              :state    ,#'consult--file-state
              :enabled  ,(lambda () (seq-some #'consult--file-register-p register-alist))
              :items    ,(lambda () (consult-register--candidates #'consult--file-register-p)))
  "File register source.")

(defvar my/consult--source-bookmark
  `(:name     "Bookmarks"
              :narrow   ?m
              :hidden   t
              :category bookmark
              :face     consult-bookmark
              :history  bookmark-history
              :items    ,#'bookmark-all-names
              :state    ,#'consult--bookmark-state)
  "Bookmark candidate source for `consult-buffer'.")

