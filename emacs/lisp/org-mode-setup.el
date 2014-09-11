;; -*- mode:emacs-lisp; indent-tabs-mode:nil -*-
;;;
;; My org-mode customizations.
;;;

(require 'org)
(require 'remember)
(org-remember-insinuate)
(setq org-directory "~/notes")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-remember-templates
      '(("Todo" ?t "* TODO %?\n  %i\n  %a" "~/notes/TODO.org" "PDL")
        ("Note" ?n "* %U %?\n  %i\n  %a" "~/notes/Scratch.org" "Random")
        ("Blog" ?b "* %U %?\n\n  %i\n  %a" "~/notes/Blog.org" "Notes")
        ("Idea" ?i "* %^{Title}\n  %i\n  %a" "~/notes/Scrib.org" "Ideas")
        ("Writing" ?w "* %^{Title}\n  %U\n   %i\n  %a" "~/notes/Scrib.org" "Scribbling")
        ("Song" ?s "* %^{Title}\n  %U\n   %i\n  %a" "~/notes/Songs.org" "Songs")
        ("Dogs" ?d "* %U %^{Title}\n" "~/notes/Dogs.org" "Ongoing")))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(require 'org2blog-autoloads)
(require 'netrc)
(setq blog (netrc-machine (netrc-parse "~/.netrc") "thisland" t))
(setq org2blog/wp-blog-alist
      '(("thisland"
         :id "thisland.haqistan.net"
         :url "https://thisland.haqistan.net/xmlrpc.php",
         :username (netrc-get blog "login")
         :password (netrc-get blog "password")
         :default-title "Org-Mode Post")))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cr" 'org-remember)
(global-font-lock-mode 1)
(defun bind-tab-for-org-mode ()
  (local-set-key "\C-i" 'org-cycle))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 'bind-tab-for-org-mode)
