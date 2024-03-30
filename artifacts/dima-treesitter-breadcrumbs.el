;;; fringe-hide.el --- Function to provide HTML sticky headers to topsy.el -*- lexical-binding: t -*-
(defun dima-treesit-html-breadcrumbs ()
  "Return a string of breadcrumbs."
  (let ((node (treesit-node-at (point) 'html))
        result)
    (while node
      (when (string= "element" (treesit-node-type node))
        (push (treesit-node-text (treesit-node-child
                                  (treesit-node-child node 0) 1))
              result))
      (setq node (treesit-node-parent node)))
    (s-join " > " result)))
