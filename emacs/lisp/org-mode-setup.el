;; -*- mode:emacs-lisp; indent-tabs-mode:nil -*-

(require 'org)
(require 'remember)
(org-remember-insinuate)
(setq org-directory "~/notes")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-remember-templates
      '(("Todo" ?t "* TODO %?\n  %i\n  %a" "~/notes/Plan.org" "To-do")
        ("Blog" ?b "* %U %?\n\n  %i\n  %a" "~/notes/Blog.org" "Bloggable")
        ("Idea" ?i "* %^{Title}\n  %i\n  %a" "~/notes/Scrib.org" "Ideas")
        ("kWantera" ?k "* %^{Title}\n  %U\n  %i\n  %a" "~/Work/kWantera/notes.org" "Work Notes")
        ("Writing" ?w "* %^{Title}\n  %U\n   %i\n  %a" "~/notes/Scrib.org" "Scribbling")
        ("Dialogue" ?d "* %^{Title}\n  %U\n   %i" "~/notes/Dialogues.org" "Dialogues")))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cr" 'org-remember)
(global-font-lock-mode 1)
(defun bind-tab-for-org-mode ()
  (local-set-key "\C-i" 'org-cycle))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 'bind-tab-for-org-mode)