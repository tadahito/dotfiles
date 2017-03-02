;;;; cmdline-stack.el --- Implement zsh M-q (command line stack)
;; Time-stamp: <2011-02-26 17:06:44 rubikitch>

;; Copyright (C) 2011  rubikitch

;; Author: rubikitch <rubikitch@ruby-lang.org>
;; Keywords: shell, eshell, convenience
;; URL: http://www.emacswiki.org/cgi-bin/wiki/download/cmdline-stack.el

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; 

;;; Commands:
;;
;; Below are complete command list:
;;
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;

;;; Installation:
;;
;; Put cmdline-stack.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'cmdline-stack)
;;
;; No need more.

;;; Customize:
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET cmdline-stack RET
;;


;;; History:

;; See http://www.rubyist.net/~rubikitch/gitlog/eshell-dx.txt

;;; Code:

(defvar cmdline-stack-version "$Id: 50autoinsert.el,v 1.19 2009/09/15 10:29:59 rubikitch Exp rubikitch $")
(eval-when-compile (require 'cl))
(require 'eshell)
(defgroup cmdline-stack nil
  "cmdline-stack"
  :group 'shell)

(defvar eshell-cmdline-stack-stack nil)
(make-variable-buffer-local 'eshell-cmdline-stack-stack)

(defun eshell-cmdline-stack-push ()
  (interactive)
  (push (let ((bol eshell-last-output-end))
          (prog1
              (cons (buffer-substring bol (point-max))
                    (- (point-max) (point)))
            (delete-region bol (point-max))))
        eshell-cmdline-stack-stack))

(defun eshell-cmdline-stack-pop ()
  (interactive)
  (eshell-send-input)
  (eshell-cmdline-stack-pop0))

(defun eshell-cmdline-stack-pop0 ()
  (ignore-errors
    (destructuring-bind ((str . diff) . rest) eshell-cmdline-stack-stack
      (insert str)
      (backward-char diff)
      (setq eshell-cmdline-stack-stack rest))))
(defun eshell-cmdline-stack-setup ()
  (define-key eshell-mode-map "\M-q" 'eshell-cmdline-stack-push)
  (define-key eshell-mode-map [remap eshell-send-input] 'eshell-cmdline-stack-pop))
(add-hook 'eshell-mode-hook 'eshell-cmdline-stack-setup)

(provide 'esh-cmdline-stack)

;; How to save (DO NOT REMOVE!!)
;; (progn (git-log-upload) (emacswiki-post "cmdline-stack.el"))
;;; cmdline-stack.el ends here
