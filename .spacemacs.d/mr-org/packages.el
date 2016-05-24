;;; packages.el --- mr-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Mark <mark@of-wel-of-niet>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `mr-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mr-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mr-org/pre-init-PACKAGE' and/or
;;   `mr-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mr-org-packages
  '(org :location built-in)
  )


(defun mr-org/post-init-org ()
  ;; Org-mode
  ;; https://thraxys.wordpress.com/2016/01/14/pimp-up-your-org-agenda/
  ;; (setq org-bullets-bullet-list
  ;;   '("◉" "◎" "⚫" "○" "►" "◇"))
  ;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "✔ DONE(d)")
                            (sequence "⚑ WAITING(w)" "|")
                            (sequence "|" "✘ CANCELED(c)")))
  )
;;; packages.el ends here
