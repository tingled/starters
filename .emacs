(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	          '("elpa" . "http://tromey.com/elpa/"))

(package-initialize)

(add-to-list 'load-path py-install-directory)
(require 'python-mode)

(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq indent-tabs-mode nil
                            tab-width 2))))

(add-hook 'nrepl-mode-hook
	  '(lambda ()
	     (paredit-mode +1)
	     (highlight-parentheses-mode) 
	     (highlight-symbol-mode)))

(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)

(require 'clojure-mode)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook '(lambda ()
    (paredit-mode 1)
    (highlight-parentheses-mode)
    (show-paren-mode 1)
    (highlight-symbol-mode)
    (show-paren-mode 1)))

(when (eq system-type 'darwin)
  (eval-after-load 'paredit
    '(progn
       ;; C-left
       (define-key paredit-mode-map (kbd "M-[ 5 d")
                   'paredit-forward-barf-sexp)
       ;; C-right
       (define-key paredit-mode-map (kbd "M-[ 5 c")
                   'paredit-forward-slurp-sexp))))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
