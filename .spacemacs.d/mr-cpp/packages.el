;;; packages.el --- mr-cpp layer packages file for Spacemacs.
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
;; added to `mr-cpp-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mr-cpp/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mr-cpp/pre-init-PACKAGE' and/or
;;   `mr-cpp/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mr-cpp-packages
  '()
  )

(defun mr-cpp/post-init-cc-mode ()
  (add-hook 'c++-mode-hook
            (lambda ()
              (add-to-list 'company-c-headers-path-system "/usr/include/c++/5/" )
              (setq-default c-basic-offset 4)
              (setq-default c-default-style "bsd")

              (global-set-key (kbd "<spc> o =") 'clang-format-region)
              (setq company-clang-arguments '("-std=c++14"))
              (setq flycheck-clang-language-standard "c++14")
              (setq flycheck-gcc-language-standard "c++14")

              ;; (add-to-list 'company-c-headers-path-system
              ;; "/Library/Developer/CommandLineTools/usr/include/c++/v1")
              ))
  )

;;; packages.el ends here
