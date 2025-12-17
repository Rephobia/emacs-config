;; --- Taskfile.yml support with auto formatting and yamlfmt auto-install ---

(use-package yaml-mode
  :ensure t
  :mode ("\\Taskfile\\.ya?ml\\'" "\\.taskfile\\.ya?ml\\'")
  :hook (yaml-mode . doomer/taskfile-setup))

(defun doomer/taskfile-setup ()
  "Custom setup for editing Taskfile.yml files."
  (setq yaml-indent-offset 2)
  (electric-indent-mode 1)
  (electric-pair-mode 1)
  (font-lock-add-keywords
   nil '(("\\_<\\(version\\|tasks\\|vars\\|includes\\|cmds\\|deps\\|dir\\|sources\\|env\\)\\_>"
          . font-lock-keyword-face)))
  )

;; Визуальные отступы
(use-package highlight-indent-guides
  :ensure t
  :hook (yaml-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-character ?│
        highlight-indent-guides-delay 0))
