(major-mode-hydra-define fundamental-mode
    (:title "Major mode picker")
    ("Programming"
     (("e" emacs-lisp-mode (s-concat "elisp " (nerd-icons-icon-for-mode 'emacs-lisp-mode :v-adjust 0.1)))
      ("p" python-ts-mode (s-concat "python " (nerd-icons-icon-for-mode 'python-mode :v-adjust 0.1))))
     "Data"
     (("J" js-json-mode (s-concat "JSON " (nerd-icons-mdicon "nf-md-code_json")))
      ("C" csv-mode "CSV")
      ("c" literate-calc-mode (s-concat "Calculator " (nerd-icons-mdicon "nf-md-calculator_variant"))))
     "Markup"
     (("w" web-mode "web"))
     "Text"
     (("t" text-mode (s-concat "Text " (nerd-icons-mdicon "nf-md-format_text"))))))
