(use-package lsp-mode
  :ensure t
  :commands lsp lsp-deferred
  :hook (go-mode . lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-l")
  :config
  (setq lsp-enable-snippet nil
        lsp-gopls-staticcheck t
        lsp-go-build-flags ["-tags=integration"])
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-webkit nil
        lsp-ui-doc-delay 0.5
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-show-diagnostics t))

(use-package eldoc
  :ensure t
  :hook (lsp-mode . eldoc-mode))

;; Для golang
;; go install golang.org/x/tools/gopls@latest
