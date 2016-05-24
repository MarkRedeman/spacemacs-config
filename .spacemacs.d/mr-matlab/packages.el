;;; packages.el --- mr-matlab layer packages file for Spacemacs.
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
;; added to `mr-matlab-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mr-matlab/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mr-matlab/pre-init-PACKAGE' and/or
;;   `mr-matlab/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mr-matlab-packages
  '(matlab-mode)
  )

(defun mr-matlab/init-matlab-mode ()
  (use-package matlab-mode :defer t))

;;; packages.el ends here

(defun mr-matlab/post-inti-matlab-mode ()
  (setq-default
   matlab-auto-fill nil
   matlab-fill-code nil
   matlab-functions-have-end t
   matlab-indent-function-body t
   matlab-verify-on-save-flag t
   matlab-indent-function t
   matlab-shell-command "matlab"
   matlab-shell-command-switches `("-nodesktop -nosplash")
   )
  )
