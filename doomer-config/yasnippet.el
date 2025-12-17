
(use-package yasnippet
  
  ;; https://github.com/joaotavora/yasnippet
  
  :ensure t
  :delight yas-minor-mode

  :bind
  (:map yas-minor-mode-map
  	("M-y" . yas-expand)
  	)
  
  :init

  (use-package yasnippet-snippets
    :ensure t)

  (add-hook 'prog-mode-hook #'yas-minor-mode)
  (add-hook 'yaml-mode-hook #'yas-minor-mode)

  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/doomer-config/snippets/") ;; always before (yas-reload-all)
  (yas-reload-all)
  (define-key yas-minor-mode-map [(tab)] nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  
  )
