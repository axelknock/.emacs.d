(defun index-to-string (index)
  "Convert positive integers less than 27 to corresponding letters."
  (when (< index 27)
    (char-to-string (+ index 96))))

(defun c-bindings (keymap)
  "List of binding letters prepended with C-c and their functions from KEYMAP."
  (delq nil (mapcar (lambda (binding)
                      (when (eq 3 (aref (car binding) 0))
                        (list (index-to-string (aref (car binding) 1))
                              (cdr binding))))
                    (embark--all-bindings keymap))))

(defun flat-hydra-commands (keymap)
  "Insert c-prefixed bindings of KEYMAP into buffer."
  (interactive (list (which-key--read-keymap)))
  (cl-prettyprint
   (cl-remove-duplicates
    (mapcar (lambda (binding)
              (append binding (list (car (s-lines (documentation (car (cdr binding))))))))
            (c-bindings (symbol-value keymap)))
    :test (lambda (x y) (equal (car x) (car y))))))
