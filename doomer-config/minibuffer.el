;; https://github.com/abo-abo/swiper

(use-package ivy
  :ensure t
  :bind
  (:map doomer/keymap
	("C-s" . doomer/swiper-toggle)
	("C-x b" . ivy-switch-buffer)
	)
  (:map ivy-minibuffer-map
	("RET" . ivy-alt-done)
	("TAB" . ivy-partial)
	([remap doomer/scroll-half-page-down] . ivy-scroll-down-command)
	([remap doomer/scroll-half-page-up] . ivy-scroll-up-command)
	)
  
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (setq ivy-height 20
	ivy-use-virtual-buffers t)
  (setq ivy-ignore-buffers '("\\` " "\\`\\*"))
  (setq minibuffer-follows-selected-frame nil)

  (defun sudo-find-file (file-name)
    "Like find file, but opens the file as root."
    (interactive "FSudo Find File: ")
    (let ((tramp-file-name (concat "/sudo::" (expand-file-name file-name))))
      (find-file tramp-file-name)))

  (defun sudo-reopen-current-file ()
    "Reopen the current file as root, replacing the current buffer."
    (interactive)
    (if buffer-file-name
	(let ((tramp-file-name (concat "/sudo::" buffer-file-name)))
          ;; Открываем файл как root в текущем буфере
          (find-alternate-file tramp-file-name))
      (message "Current buffer is not visiting a file!")))

  (defun doomer/swiper-toggle ()
    "Toggle swiper: quit if swiper/ivy is active, otherwise start swiper."
    (interactive)
    (if (minibufferp (window-buffer (selected-window)))
        (abort-recursive-edit)
      (swiper)))
  )


(use-package smex
  :ensure t)


(use-package counsel
  :ensure t
  :after (smex)
  
  :bind
  (:map doomer/keymap
	("C-x C-f" . counsel-find-file)
	("M-x" . counsel-M-x)
	("C-x C-v" . counsel-yank-pop)
	("C-x C-b" . counsel-switch-buffer)
	("C-h f" . counsel-describe-function)
	("C-h v" . counsel-describe-variable)
	("C-h l" . counsel-find-library)
	("C-h s" . counsel-info-lookup-symbol)
	("C-h c" . counsel-unicode-char)
	)
  :config
  (setq counsel-yank-pop-separator "\n\n----------------------------------------\n\n")
  
  )

(use-package shell
  :bind
  (:map minibuffer-local-shell-command-map
	([remap previous-line] . previous-history-element)
	([remap next-line] . next-history-element)
	)
  (:map shell-mode-map
	([remap previous-line] . comint-previous-input)
	([remap next-line] . comint-next-input)	       
	)
  :init
  (push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)
  
  )
