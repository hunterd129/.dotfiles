;; ===================================================================
;; Doom Emacs Configuration
;; ===================================================================

;; ===================================================================
;; Appearance & UI Settings
;; ===================================================================

    ;; Fullscreen
    (add-to-list 'default-frame-alist '(fullscreen . maximized))

    ;; Colour column
    (setq-default display-fill-column-indicator-column 80)
    (add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
    (setq scroll-margin 10)

    ;; Fonts
    (setq doom-font (font-spec
                     :family "IosevkaTerm Nerd Font Mono"
                     :size 18
                     :weight 'medium)
          doom-variable-pitch-font (font-spec
                                    :family "Iosevka Aile"
                                    :size 19
                                    :weight 'medium)
          doom-big-font (font-spec
                         :family "IosevkaTerm Nerd Font Mono"
                         :size 26
                        :weight 'bold)
          doom-serif-font (font-spec
                           :family "Iosevka Etoile"
                           :size 19
                           :weight 'medium))

    ;; Theme
    (setq doom-theme 'doom-dracula)

    ;; Line numbers
    (setq display-line-numbers-type 'relative)

;;===================================================================
;; Keybinding for esc to normal mode
;;===================================================================

(setq evil-escape-key-sequence "jk"
      evil-esc-delay 0.3)

;;===================================================================
;; Org mode Stuff
;;===================================================================

(setq org-directory "~/org/")
