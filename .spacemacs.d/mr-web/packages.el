;;; packages.el --- mr-web layer packages file for Spacemacs.
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
;; added to `mr-web-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mr-web/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mr-web/pre-init-PACKAGE' and/or
;;   `mr-web/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

;; At the current state this layer is basically an improved php layer based on:
;; https://github.com/syl20bnr/spacemacs/pull/3943
(defconst mr-web-packages
  '(
    ac-php
    company
    eldoc
    flycheck
    ggtags
    helm-gtags
    php-auto-yasnippets
    (ede-php-autoload :location (recipe :fetcher github :repo "stevenremot/ede-php-autoload"))
    (semantic-php :location (recipe :fetcher github :repo "jorissteyn/semantic-php"))
    (php-extras :location (recipe :fetcher github :repo "arnested/php-extras"))
    php-mode
    phpcbf
    feature-mode
    phpunit
    )
  )

(when (configuration-layer/layer-usedp 'auto-completion)
  (defun mr-web/post-init-company ()
    (spacemacs|add-company-hook php-mode))

  (defun mr-web/post-init-php-extras ()
    (push 'php-extras-company company-backends-php-mode))

  (defun mr-web/post-init-ac-php ()
    (push 'company-ac-php-backend company-backends-php-mode)))

(defun mr-web/init-feature-mode ()
  "Initialize feature mode for Behat"
  (use-package feature-mode
    :mode (("\\.feature\\'" . feature-mode))))

(defun mr-web/init-ac-php ()
  (use-package ac-php
    :defer t
    :init (progn
            (use-package ac-php-company
              :defer t)
            )))

(defun mr-web/init-semantic-php ()
  (use-package semantic-php
    ;; :init (load "~/src/jorissteyn-semantic-php/loaddefs.el")
    :config (add-hook 'php-mode-hook #'semantic-mode)))

(defun mr-web/init-ede-php-autoload-mode ()
  (use-package ede-php-autoload-mode
    :init (progn
            (add-hook 'php-mode-hook #'ede-php-autoload-mode))))


(defun mr-web/post-init-php-mode ()
  (add-hook 'php-mode-hook
            (lambda ()
              (spacemacs/set-leader-keys-for-major-mode `php-mode
                "t" `phpunit-current-test
                "T" `phpunit-current-project)

              ;; Navigate camelCase as separate words
              (subword-mode 1)
              ;;                            (flycheck-select-checker 'php)
              ;;                            (setq php-mode-coding-style 'PSR-2)
              ;;                            (setq c-default-style "psr2")

              ;;              ;; (add-to-list 'company-backends 'company-ac-php-backend )
              ;;              (php-enable-psr2-coding-style)
              ))

  ;; (add-to-list 'auto-mode-alist '("\\.blade.php\\'" . web-mode))
  (setq web-mode-engines-alist
        '(("blade"  . "\\.blade\\."))
        )

  ;; Not sure about this, was mentioned in php-mode
  (eval-after-load 'php-mode
    '(require 'php-ext))
  )

(defun mr-web/init-web ()
  )

;;; packages.el ends here
