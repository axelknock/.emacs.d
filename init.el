;; -*- lexical-binding: t; no-byte-compile: t -*-
;; Straight bootstrap
(setq straight-repository-branch "develop")
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq native-comp-async-report-warnings-errors nil)
(setq straight-use-package-by-default t)
(straight-use-package 'project)
(straight-use-package 'package)
(straight-use-package 'org)
;; Elpaca bootstrap
(defvar elpaca-installer-version 0.7)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                 ,@(when-let ((depth (plist-get order :depth)))
                                                     (list (format "--depth=%d" depth) "--no-single-branch"))
                                                 ,(plist-get order :repo) ,repo))))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))
(load-file "./.person.el")
(set-face-attribute 'default nil :family my-selected-font :height 120)
(set-face-attribute 'variable-pitch nil :family my-selected-font :height 120)
(org-babel-load-file (expand-file-name "README.org" my-emacs-path))
(global-auto-revert-mode)
(put 'scroll-left 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(markdown-asymmetric-header t)
 '(markdown-command "pandoc --wrap=preserve")
 '(safe-local-variable-values
   '((denote-toml-front-matter . "+++\12title      = %s\12date       = %s\12tags       = %s\12identifier = %S\12test       = %$(string \"hello\")\12+++\12\12")
     (denote-prompts subdirectory title keywords)
     (denote-directory . "/home/lucian/Nextcloud/H/hugo/lucianknock.com/content/")
     (denote-templates
      ("retro" org-file-contents "./retro-template.md"))
     (denote-prompts title subdirectory template)
     (denote-file-type . markdown-toml)
     (denote-file-type quote markdown-toml)
     (denote-filetype quote markdown-toml)
     (denote-directory . "/home/lucian/Nextcloud/W/websites/lucianknock.com/content/")
     (eval progn
           (org-babel-next-src-block)
           (org-babel-execute-src-block))))
 '(timu-macos-flavour "light")
 '(warning-suppress-types '((use-package)))
 '(web-mode-markup-comment-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
