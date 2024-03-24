(global-set-key (kbd "C-z") 'repeat)
;; God mode
(global-set-key (kbd "<escape>") #'god-mode-all)
(my/bind-key-dwim "C-o" 'ace-window)
;; Kill two lines
(my/bind-key-dwim "C-S-k" 'kill-2-lines)
;; Dirvish
(my/bind-key-dwim "<remap> <dired-jump>" #'dirvish-dwim)
(my/bind-key-dwim "C-s" 'dirvish-narrow 'dirvish-mode-map)
;; Magit
(my/bind-key-dwim "C-x p m" 'project-magit)
(my/bind-key-dwim "C-x g" 'magit-status)
;; Vterm
(my/bind-key-dwim "C-c v" 'vterm)
(my/bind-key-dwim "C-x p t" 'project-vterm)
;; Comment DWIM
(my/bind-key-dwim "M-;" 'comment-dwim-2)
;; Helpful
(my/bind-key-dwim "C-h f" 'helpful-callable)
(my/bind-key-dwim "C-h v" 'helpful-variable)
(my/bind-key-dwim "C-h k" 'helpful-key)
;; Avy
(my/bind-key-dwim "C-'" 'avy-goto-char-2)
(my/bind-key-dwim "C-'" 'avy-goto-char-2 'org-mode-map)
;; mwim
(my/bind-key-dwim "C-a" 'mwim-beginning)
(my/bind-key-dwim "C-e" 'mwim-end)
;; move-dup
(my/bind-key-dwim "M-<up>" 'move-dup-move-lines-up)
(my/bind-key-dwim "M-<down>" 'move-dup-move-lines-down)
(my/bind-key-dwim "M-S-<up>" 'move-dup-duplicate-up)
(my/bind-key-dwim "M-S-<down>" 'move-dup-duplicate-down)
;; embark
(my/bind-key-dwim "C-." 'embark-act)
(my/bind-key-dwim "C->" 'embark-export)
;; consult
(my/bind-key-dwim "C-\"" 'consult-mark)
(my/bind-key-dwim "C-s" 'my/consult-line-dwim)
(my/bind-key-dwim "C-f" 'consult-find 'dired-mode-map)
(my/bind-key-dwim "C-S-s" 'my/consult-ripgrep-dwim)
(my/bind-key-dwim "<remap> <list-buffers>" 'ibuffer)
(my/bind-key-dwim "C-x b" 'consult-buffer)
(my/bind-key-dwim "M-y" 'consult-yank-from-kill-ring)
(my/bind-key-dwim "C-x M-:" 'consult-complex-command)
(my/bind-key-dwim "<remap> <org-goto>" 'consult-org-heading)
(my/bind-key-dwim "<remap> <switch-to-buffer-other-tab>" 'consult-buffer-other-tab)
(my/bind-key-dwim "<remap> <imenu>" 'consult-imenu)
(my/bind-key-dwim "<remap> <eshell-list-history>" 'consult-history)
(my/bind-key-dwim "<remap> <project-switch-to-buffer>" 'consult-project-buffer)
(my/bind-key-dwim "C-x C-S-F" 'affe-find)
(defun my/affe-find-from-home (&optional initial)
  "Run `affe-find' file with ~/users/home/<user> as initial directory"
  (interactive)
  (affe-find gnus-home-directory))
(my/bind-key-dwim "C-c f" 'my/affe-find-from-home)
;; org mode
(my/bind-key-dwim "C-c l" 'org-store-link)
;; denote
(my/bind-key-dwim "C-c n" 'denote-open-or-create)
;; org roam
;; (my/bind-key-dwim "C-S-r" 'org-id-get-create 'org-mode-map)
;; vundo
(my/bind-key-dwim "C-x u" 'vundo)
;; hungry delete
(my/bind-key-dwim "C-<backspace>" 'my/kill-word-and-hungry-delete-backward)
(my/bind-key-dwim "C-<backspace>" 'backward-kill-word 'minibuffer-mode-map)
(my/bind-key-dwim "M-d" 'my/kill-word-and-hungry-delete-forward)
;; expand region
;; (my/bind-key-dwim "C-=" 'er/expand-region)
;; (my/bind-key-dwim "C--" 'er/contract-region)
;; puni
(my/bind-key-dwim "C-=" 'puni-expand-region)
;; multiple cursors
(my/bind-key-dwim "C-;" 'mc/mark-all-like-this-dwim)
(my/bind-key-dwim "C-/" 'mc/edit-beginnings-of-lines)
(my/bind-key-dwim "C-?" 'mc/mark-all-in-region-regexp)
(my/bind-key-dwim "C-:" 'mc/mark-more-like-this-extended)
;; to-char.el
(my/bind-key-dwim "C-}" 'my/forward-to-regex)
(my/bind-key-dwim "C-{" 'my/backward-to-regex)
;; windmove
;; Shift action of normal C-d command (delete-char)
;; Sort lines
(my/bind-key-dwim "C-\\" 'sort-lines)
(my/bind-key-dwim "C-|" 'reverse-region)
;; In conjunction with aggressive-indent, this automatically corrects
;; the indentation of the surrounding area.
(my/bind-key-dwim "M-\\" 'indent-region)
(my/bind-key-dwim "M-Q" 'unfill-paragraph)
(my/bind-key-dwim "C-x h" 'my/set-mark-and-mark-whole-buffer)
;; Quickly switch to last buffer
(my/bind-key-dwim "M-o" 'mode-line-other-buffer)
;; Replace default downcase, upcase, and capitalcase commands with dwim
;; counterparts found in 'simple.el'.
(my/bind-key-dwim "M-c" 'capitalize-dwim)
(my/bind-key-dwim "M-l" 'downcase-dwim)
(my/bind-key-dwim "M-u" 'upcase-dwim)
(my/bind-key-dwim "C-x K" 'my/kill-buffer-immediately)
(my/bind-key-dwim "C-x n n" 'narrow-or-widen-indirect-dwim)
(my/bind-key-dwim "C-x n j" 'join-buffers)
(my/bind-key-dwim "<remap> <zap-to-char>" 'zap-up-to-char)
;; (my/bind-key-dwim "C-o" 'other-window)
;; (my/bind-key-dwim "C-o" 'other-window 'dired-mode-map)
(my/bind-key-dwim "M-s i" 'my/increment-number-decimal)
(my/bind-key-dwim "<backspace>" 'hungry-delete-backward)
;; hydras
(my/bind-key-dwim "M-SPC" 'major-mode-hydra)
;; gptel
(my/bind-key-dwim "C-c c" 'gptel-send)
(my/bind-key-dwim "C-c C" 'gptel-abort)
;; eglot
(my/bind-key-dwim "C-c e" 'eglot)
