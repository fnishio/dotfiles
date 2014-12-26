;;;
;;; KEY BINDINGS
;;;
(define-key global-map "\C-h" 'delete-backward-char)
(define-key global-map "\M-h" 'help-for-help)

;;
;(set-frame-parameter (selected-frame) 'active-alpha 1.0)
(set-frame-parameter (selected-frame) 'inactive-alpha 0.8)


; ruby mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$". ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
				     interpreter-mode-alist))
