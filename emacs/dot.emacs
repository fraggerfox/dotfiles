;; Define the load-path for the various custom modules that does not
;; have any specific configuration sections

(add-to-list 'load-path "~/.emacs_custom/")
(add-to-list 'load-path "~/.emacs_custom/popup/")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Prevent creation of backup Files
(setq make-backup-files nil)

;; ================================
;; Remove trailing whitespaces
;; ================================

(defun saving-clean-up-hook ()
  ; We do not want whitespace changes when editing diffs/patches
  (when (not (eq major-mode 'diff-mode))
    (delete-trailing-whitespace)))

(defun enable-clean-up-hook ()
  (interactive)
  (message "Whitespace clean up ON.")
  (add-hook 'before-save-hook #'saving-clean-up-hook))

(defun disable-clean-up-hook ()
  (interactive)
  (message "Whitespace clean up OFF.")
  (remove-hook 'before-save-hook #'saving-clean-up-hook))

(global-set-key [f5] #'enable-clean-up-hook)
(global-set-key [f6] #'disable-clean-up-hook)

;(add-hook 'before-save-hook #'saving-clean-up-hook)

;; ================================
;; Enable Line and Column Numbering
;; ================================

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; Show Line numbers in emacs :) like in vi
(require 'setnu)

;; Font Lock Mode for Syntax Highlighting
(font-lock-mode 1)

;; Enable visual feedback for 80 column
(require 'fill-column-indicator)

(setq fci-rule-width 1)
(setq fci-rule-color "blue")
(setq fci-rule-use-dashes 1)
(setq fci-dash-pattern 0.5)

;; Set the 72 column limit
(setq set-fill-column 72)

;; ================================
;; Enable rename of current file and buffer
;; ================================

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(global-set-key (kbd "C-c r")  'rename-file-and-buffer)

;; ============================
;; Key mappings
;; ============================

;; Set Key to Exit Emacs
;;(global-set-key [f5] 'kill-emacs)

;; Set Key to Open file in read only mode
(global-set-key [f3] 'find-file-read-only)

;; Set Key to Put file in read only mode
(global-set-key [f2] 'read-only-mode)

;; Set Key C-x p to go to the previous window
;; Opposite of C-x o
(defun select-previous-window ()
  "Switch to the previous window"
  (interactive)
  (select-window (previous-window)))

(global-set-key (kbd "C-x p") 'select-previous-window)

;; highlight matches from searches
(setq isearch-highlight t)
(setq search-highlight t)
(setq-default transient-mark-mode t)

;; ================================
;; Auto Complete for emacs
;; ================================

(add-to-list 'load-path "~/.emacs_custom/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs_custom/auto-complete/dict")
(ac-config-default)

;; ================================
;; C Programming Settings
;; ================================

;;; User spaces for tabs
;(setq-default indent-tabs-mode nil)
;(setq-default tab-width 4)
;(setq indent-line-function 'insert-tab)

;;; Set the default style to bsd mode
;;; Set Normal offset to 4 spaces
;(defun my-c-mode-hook ()
;  (setq c-basic-offset 4
;        c-default-style "bsd"))
;(add-hook 'c-mode-common-hook 'my-c-mode-hook)

;; Associate c-mode with the .ec extension
(setq auto-mode-alist (append '(("\\.ec$" . c-mode)) auto-mode-alist))

;; OpenBSD KNF for C/C++
(add-to-list 'load-path "~/.emacs_custom/netbsd/")
(load-library "netbsd-knf-style")
(c-add-style "NetBSD" netbsd-knf-style)
(setq c-default-style '((c-mode . "NetBSD")))

;(require 'flex-mode)
(require 'xcscope)
(cscope-setup)

(defun insert-space-or-newline-and-indent ()
  (interactive)
  (if (>= (current-column) fill-column)
      (newline-and-indent)
    (insert-char ? )))

;(global-set-key (kbd "SPC") 'insert-space-or-newline-and-indent)

;; ================================
;; diff / patch editing settings
;; ================================

(add-hook 'diff-mode-hook 'whitespace-mode)

(add-to-list 'auto-mode-alist '("\\.patch\\'" . diff-mode))
(add-to-list 'auto-mode-alist '("\\.diff\\'" . diff-mode))
(add-to-list 'auto-mode-alist '("patch-" . diff-mode))

;; ================================
;; Conflict / Merge settings
;; ================================

(defun smerge-try-smerge ()
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward "^<<<<<<< " nil t)
      (require 'smerge-mode)
      (smerge-mode 1))))

(add-hook 'find-file-hook 'smerge-try-smerge t)
(add-hook 'after-revert-hook 'smerge-try-smerge t)

;; ================================
;; PHP Programming Settings
;; ================================
(add-hook 'web-mode
      (lambda ()
        (setq tab-width 4)))

(add-hook 'php-mode
      (lambda ()
        (setq tab-width 4)))

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'multi-web-mode)
(setq mweb-default-major-mode 'web-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script[^>]*>" "</script>")
                  (css-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;;(add-to-list 'load-path "~/.emacs_custom/php/")
;;(add-to-list 'load-path "~/.emacs_custom/drupal-mode/")
;;
;;(require 'drupal-mode)
;; (defun drupal-mode ()
;;   "Drupal php-mode."
;;   (interactive)
;;   (php-mode)
;;   (message "Drupal mode activated.")
;;   (set 'tab-width 2)
;;   (set 'c-basic-offset 2)
;;   (set 'indent-tabs-mode nil)
;;   (c-set-offset 'case-label '+)
;;   (c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
;;   (c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values
;;   ; More Drupal-specific customizations here
;; )
;;
;;(defun setup-php-drupal ()
;;  ; Drupal
;;  (add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\)$" . drupal-mode))
;;  (add-to-list 'auto-mode-alist '("/drupal.*\\.\\(php\\|inc\\)$" . drupal-mode))
;;  (add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))
;;)
;;
;;(setup-php-drupal)

;; ================================
;; nasm support for emacs
;; ================================

(require 'nasm-mode)
;(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))

;; ================================
;; Golang for emacs
;; ================================

(add-to-list 'load-path "~/.emacs_custom/go-mode/")
(require 'go-mode-autoloads)

;; ================================
;; Erlang for emacs
;; ================================

(add-to-list 'load-path "~/.emacs_custom/distel/elisp/")
(add-to-list 'load-path "~/.emacs_custom/distel-completion/")
(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
;(setq load-path (cons  "/cygdrive/d/dev/tools/erl/lib/tools-2.11.2/emacs" load-path))
(setq load-path (cons  "~/.emacs_custom/erl-mode/" load-path))
(require 'erlang-start)
(setq erlang-root-dir "/cygdrive/d/dev/tools/erl")
(setq exec-path (cons "/cygdrive/d/dev/tools/erl/bin" exec-path))
(setq erlang-man-root-dir "/cygdrive/d/dev/tools/erl/man")

(require 'distel)
(distel-setup)

;; prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)
;; default node name to emacs@localhost
(setq inferior-erlang-machine-options '("-sname" "emacs"))
;; tell distel to default to that node
(setq erl-nodename-cache
      (make-symbol
       (concat
        "emacs@"
	(car (split-string (shell-command-to-string "hostname"))))))

(add-hook 'after-init-hook 'global-company-mode)

;(add-hook 'after-init-hook 'global-auto-complete-mode)

(require 'company-distel)

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
     (define-key company-active-map (kbd "<backtab>") 'company-select-previous)))

(setq company-distel-popup-help t)
(setq company-distel-popup-height 30)
(setq company-auto-complete t)

;(require 'auto-complete-distel)
;(add-to-list 'ac-sources 'auto-complete-distel)

;; ================================
;; org-mode settings
;; ================================

;; Collapse all the headings
(setq org-cycle-include-plain-lists 'integrate)

;; Get notes and completion time on TODO completions
(setq org-log-done 'note)
(setq org-log-done 'time)

;; ================================
;; Try to define the Scheme program set up for emacs
;; ================================

(defvar mzscheme-program  "/cygdrive/d/dev/tools/mzscheme/mzscheme.exe")
(setq scheme-program-name "/cygdrive/d/dev/tools/mzscheme/mzscheme.exe")

;; Start up Scheme
(global-set-key [(f12)]
		'(lambda ()
		   (interactive)
		   (require 'quack)
		   (run-scheme mzscheme-program)))

;; ================================
;; Enable the cool multi-cursor mode
;; ================================

;(add-to-list 'load-path "~/.emacs_custom/multiple-cursors/")
;(require 'multiple-cursors)
;(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-line)
;(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ================================
;; Node.js / Javascript Programming Settings
;; ================================

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 3)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; ================================
;; Markdown Settings
;; ================================

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; ================================
;; Custom Variables section
;; Do NOT edit by hand unless you know you are doing
;; ================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(fill-column 80)
 '(inhibit-startup-screen t)
 '(org-agenda-files "~/.agenda_files")
 '(org-replace-disputed-keys nil)
 '(org-support-shift-select nil)
 '(org-treat-S-cursor-todo-selection-as-state-change nil)
 '(package-selected-packages (quote (company ## web-mode php-mode magit ac-js2 ac-html)))
 '(show-paren-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'erase-buffer 'disabled nil)
