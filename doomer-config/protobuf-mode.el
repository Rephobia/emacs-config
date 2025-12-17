(use-package protobuf-mode
  :ensure t
  :mode ("\\.proto\\'" . protobuf-mode)
  :hook
  (protobuf-mode . (lambda ()
                     (setq indent-tabs-mode nil)
                     (setq tab-width 2)
                     (setq c-basic-offset 2))))

(defun doomer/protobuf-format-buffer ()
  "Format the current protobuf file using 'clang-format'."
  (interactive)
  (if (executable-find "clang-format")
      (shell-command-on-region
       (point-min) (point-max)
       "clang-format -style=google"
       (current-buffer) t)

(with-eval-after-load 'protobuf-mode
  (define-key protobuf-mode-map (kbd "C-c C-f") #'doomer/protobuf-format-buffer))
