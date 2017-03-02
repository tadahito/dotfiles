;;; git 操作
;;; magit
;;; m-x magit-status
(global-set-key (kbd "C-x v d") 'magit-status)
(global-set-key (kbd "C-x v L") 'magit-key-mode-popup-logging)
(global-set-key (kbd "C-x v z") 'magit-stash)
;;; リボジトリ新規作成
;;; C-u C-x v d
;; ==== *magit-key*
;; Switches
;;  -m: Only merge commits (--merges       -f: First parent (--first-parent
;;  -i: Case insensitive patterns (-i      -pr: Pickaxe regex (--pickaxe-regex
;;  -n: Name only (--name-only             -am: All match (--all-match
;;  -al: All (--all
;; Args
;;  =r: Relative (--relative=)
;;  =c: Committer (--committer=)
;; => magit-stash
;;  =<: Before (--before=)
;;  =s: Pickaxe search (-S)
;;  =a: Author (--author=)
;;  =g: Grep (--grep=)
;; Actions
;;  l: Short             L: Long              h: Reflog            rl: Ranged short
;;  rL: Ranged long      rh: Ranged reflog
