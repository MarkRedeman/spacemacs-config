;;; packages.el --- mr-js layer packages file for Spacemacs.
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
;; added to `mr-js-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mr-js/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mr-js/pre-init-PACKAGE' and/or
;;   `mr-js/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mr-js-packages
  '(
    js2-mode
    js
    web-mode
    )
  )
;; for some inspiration:
;; https://github.com/chrisbarrett/spacemacs-layers/blob/master/cb-js/packages.el
(defun mr-js/post-init-web-mode ()

    ;; Use react mode for all js based files
    (add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode))

    (setq-default
     ;; JS
     js2-basic-offset 2
     js-indent-level 2
     ;; web-mode
     css-indent-offset 2
     web-mode-markup-indent-offset 2
     web-mode-css-indent-offset 2
     web-mode-code-indent-offset 2
     web-mode-attr-indent-offset 2
     )
    )

;;; packages.el ends here
