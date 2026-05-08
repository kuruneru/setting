;; --- 基本表示・挙動 ---
(global-display-line-numbers-mode t)
(setq-default tab-width 2)
(setq inhibit-startup-message t)
(global-set-key (kbd "<escape>") 'keyboard-quit)

;; ミニバッファの高さを固定する（大きくならないようにする）
(setq resize-mini-windows nil)
(setq max-mini-window-height 0.125)

;; --- 検索設定 ---
(global-set-key (kbd "C-x C-s") 'isearch-forward)
(with-eval-after-load 'isearch
  (define-key isearch-mode-map (kbd "C-n") 'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "C-p") 'isearch-repeat-backward))

;; --- キーバインド ---
(global-set-key (kbd "C-h") 'delete-backward-char) 
(global-set-key (kbd "C-g") 'beginning-of-buffer)  
(global-set-key (kbd "C-l") 'end-of-buffer)        
(global-set-key (kbd "M-n") 'next-buffer)          
(global-set-key (kbd "M-p") 'previous-buffer)     

(global-set-key (kbd "C-s") 'save-buffer)      
(global-set-key (kbd "C-w") 'kill-ring-save)   ; コピー
(global-set-key (kbd "M-w") 'kill-region)      ; 切り取り
(global-set-key (kbd "C-m") 'set-mark-command) 
(global-set-key (kbd "C-j") 'newline-and-indent) 

;; 行挿入カスタム
(defun my-insert-line-below ()
  (interactive)
  (end-of-line)
  (newline-and-indent))
(global-set-key (kbd "C-o") 'my-insert-line-below)

(defun my-insert-line-above ()
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (indent-according-to-mode))
(global-set-key (kbd "C-q") 'my-insert-line-above)

;; --- WSL クリップボード連携 ---
(defun wsl-copy (text &optional push)
  (let ((coding-system-for-write 'cp932))
    (let ((process-connection-type nil))
      (let ((proc (start-process "clip" nil "clip.exe")))
        (process-send-string proc text)
        (process-send-eof proc)))))

(defun wsl-paste ()
  (let ((coding-system-for-read 'cp932))
    ;; powershellの出力を受け取る際、余計なメッセージを抑制
    (let ((text (shell-command-to-string "powershell.exe -NoProfile -Command \"Get-Clipboard\"")))
      (unless (string= text "")
        (replace-regexp-in-string "\r" "" text)))))

(setq interprogram-cut-function 'wsl-copy)
(setq interprogram-paste-function 'wsl-paste)

;; --- 言語・文字コード設定 (一箇所に集約) ---
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

;; --- モード別設定 ---
(add-hook 'tex-mode-hook
          (lambda ()
            (define-key tex-mode-map (kbd "C-m") 'set-mark-command)
            (define-key tex-mode-map (kbd "C-j") 'newline-and-indent)))


;; シェルコマンドの出力バッファが表示される際のルールを設定
(setq display-buffer-alist
      '(("\\*Shell Command Output\\*"
         (display-buffer-reuse-window display-buffer-at-bottom)
         (window-height . 0.25)  ;; 画面全体の33%（約1/3）の高さにする
         )))
;; シェルコマンドの出力バッファが表示される際のルールを設定
(setq display-buffer-alist
      '(("\\*Shell Command Output\\*"
         (display-buffer-reuse-window display-buffer-at-bottom)
         (window-height . 0.25)  ;; 画面全体の33%（約1/3）の高さにする
         )))
