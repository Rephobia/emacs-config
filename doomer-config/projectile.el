(use-package projectile
  
  ;; https://github.com/bbatsov/projectile
  
  :ensure t
  :delight
  
  :bind
  (:map projectile-mode-map
	("C-c" . projectile-command-map)
	("C-f" . projectile-find-file)
	("C-c C-s" . projectile-save-project-buffers)
	("C-b" . projectile-switch-to-buffer)

	("C-c C-p" . projectile-switch-project)

	("C-c s s" . counsel-git-grep)
	("C-c s g" . projectile-grep)
	("C-c x x" . doomer/run-wezterm)
	("C-t" . doomer/run-vterm-toggle)
	("M-{" . projectile-previous-project-buffer)
	("M-}" . projectile-next-project-buffer)
	)
  :init
  
  (use-package counsel-projectile
    
    ;; https://github.com/ericdanan/counsel-projectile
    
    :ensure t)
  
  (projectile-mode +1)

  (defun doomer/run-st ()
    "DEPRECATED Try to run st in (projectile-project-root)
if (projectile-project-rool) is nil, run st in file directory"
    (interactive)
    (doomer/run-external-terminal "st" "-d")
    )

  (defun doomer/run-konsole ()
    "DEPRECATED Try to run konsole in (projectile-project-root)
if (projectile-project-rool) is nil, run konsole in file directory"
    (interactive)
    (doomer/run-external-terminal "konsole" "--workdir")
    )

  (defun doomer/run-wezterm ()
    "Run WezTerm in the project root or current file directory."
    (interactive)
    (doomer/run-external-terminal "wezterm" "start" "--cwd"))

  (defun doomer/run-external-terminal (terminal command &optional option)
    "Run TERMINAL with COMMAND in the project root or current directory.
If Projectile project root exists, use it as cwd."
    (let* ((dir (or (and (fboundp 'projectile-project-root)
			 (projectile-project-root))
                    default-directory))
           (args (if option (list command option dir) (list command dir))))
      (apply #'start-process terminal nil terminal args)))

  (defun doomer/run-vterm ()
    "Try to run vterm in (projectile-project-root)
if (projectile-project-rool) is nil, vterm st in file directory"
    (interactive)
    (if (projectile-project-root)
	(projectile-run-vterm)
      (vterm-toggle)
      )
    )

  (defun doomer/run-vterm-toggle ()
    "Try to run vterm in (projectile-project-root)
if (projectile-project-rool) is nil, vterm st in file directory
if current buffer is already vterm kill it"
    (interactive)
    (if (derived-mode-p 'vterm-mode)
	(quit-window)
      (doomer/run-vterm)
      )
    )
  
  :config
  (setq projectile-completion-system 'ivy)
  )
