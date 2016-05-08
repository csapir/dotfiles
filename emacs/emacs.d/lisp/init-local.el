;; set window switching shortcuts

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)


;; set backup directory
(setq backup-directory-alist `(("." . "~/.saves")))

;; more backups.
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(provide 'init-local)

(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))
