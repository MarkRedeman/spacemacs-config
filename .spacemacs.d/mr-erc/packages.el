;;; packages.el --- mr-erc layer packages file for Spacemacs.
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
;; added to `mr-erc-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mr-erc/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mr-erc/pre-init-PACKAGE' and/or
;;   `mr-erc/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mr-erc-packages
  '(
    erc
    persp-mode
    )
  )

(defun mr-erc/post-init-erc ()
  ;; This local file contains my password
  (load "~/.ercpass")

  (add-hook `erc-mode-hook
            (lambda () (setq-local global-hl-line-mode nil)))

  ;; Enter erc mode in normal mode
  (evil-set-initial-state `erc-mode `normal)

  (setq spaceline-toggle-erc-track-on)
  (setq erc-prompt-for-nickserv-password nil)
  (setq erc-nickserv-passwords
        `((freenode (("MarkRedeman" . , freenode-markredeman-password)))))

  (setq-default
   erc-timestamp-format-left "\n%A %B %e, %Y\n\n"
   erc-timestamp-format-right "%H:%M"
   erc-timestamp-right-column 80
   erc-image-inline-rescale 300
   erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

  )

(defun mr-slack/post-init-persp-mode ()
  ;; In the future I would like spacemacs to get my freenode password from pass, so that I would have to give my master password before opening erc
  (spacemacs|define-custom-layout "@ERC"
    :binding "E"
    :body
    (erc :server "irc.freenode.net"
         :port "6667"
         :nick "MarkRedeman"
         :full-name "Mark Redeman"
         :password freenode-markredeman-password)
    )
  )

(defun mr-erc/pre-init-erc ()
  (setq-default
   ;; IRC
   erc-autojoin-channels-alist
   `(("freenode\\.net" "#script?cie" "#qandidate" "#dev-discussions"))
   )
  )

;;; packages.el ends here
