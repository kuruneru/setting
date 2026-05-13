#!/bin/bash

# --- Global Definitions ---
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# --- Path Settings ---
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
# TeX Live 2023
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH"

# --- Language Settings ---
# --- Standard Aliases ---
alias emacs='emacs -nw'
alias l='ls'

alias la=`ls -a`
alias lal=`ls -al`

# --- Functions ---

# Windows クリップボードへコピー (UTF-8 -> CP932)
function pbcopy {
    iconv -f utf-8 -t cp932 | /mnt/c/Windows/System32/clip.exe
}

# Windows クリップボードから貼り付け
function pbpaste {
    powershell.exe -NoProfile -Command "Get-Clipboard" | tr -d "\r"
}

# LaTeX 初期化 (jlreq + listings)
function latex_init {
    for filename in "$@"; do
        local base="${filename%.tex}"
        if [ -f "$base.tex" ]; then
            echo "Warning: $base.tex already exists. Skipped."
            continue
        fi

        cat << 'EOT' > "$base.tex"
\documentclass[paper=a4, fontsize=10pt]{jlreq}

\usepackage{amsmath, amssymb}
\usepackage{enumerate}
\usepackage{tikz}
\usepackage{listings, xcolor}

\lstset{
  basicstyle = {\ttfamily},
  frame = {tbrl},
  breaklines = true,
  numbers = left,
  showspaces = false,
  showstringspaces = false,
  showtabs = false,
  keywordstyle = \color{blue},
  commentstyle = {\color[HTML]{1AB91A}},
  identifierstyle = \color{black},
  stringstyle = \color{brown},
  captionpos = t
}

\title{}
\author{学籍番号 1280391 \\ 細川 夏風}
\date{\today}

\begin{document}

\maketitle

\begin{thebibliography}{99}
  \bibitem{}
\end{thebibliography}

\end{document}
EOT
        echo "Created: $base.tex"
    done
}

# Markdown から PDF 生成 (Pandoc)
function mdc {
    pandoc -s "$1.md" -o "$1.pdf" \
        --pdf-engine=xelatex \
        -V mainfont="IPAexMincho" \
        -V geometry:top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm
}

# LuaLaTeX 安全実行
# LuaLaTeX Beamer
function beamer_init {
  # ファイル名が指定されていない場合のエラー処理
  if [ -z "$1" ]; then
    echo "エラー: ファイル名を指定してください。"
    echo "使用法: beamer_init <ファイル名.tex>"
    return 1
  fi

  cat << 'EOF' > "$1"
\documentclass[11pt, aspectratio=169]{beamer}

% LuaLaTeXで日本語を使うための必須パッケージ
\usepackage{luatexja}

% 便利な追加パッケージ
\usepackage{booktabs}   % 表の罫線
\usepackage{tikz}       % 図形描画
\usepackage{listings}   % ソースコード挿入
\lstset{
  basicstyle=\ttfamily\scriptsize,
  frame=single,
  breaklines=true,
  numbers=left,
  numberstyle=\tiny
}

% テーマとカラーテーマの設定
\usetheme{Madrid}
\usecolortheme{orchid}

% セクション開始時の自動表紙（扉絵）設定
\AtBeginSection[]{
  \begin{frame}
    \vfill
    \centering
    \begin{beamercolorbox}[sep=8pt,center,shadow=true,rounded=true]{title}
      \usebeamerfont{title}\insertsectionhead\par%
    \end{beamercolorbox}
    \vfill
  \end{frame}
}

% タイトル情報
\title{}
\subtitle{}
\author{学籍番号(Student ID): 1280391 \\ 氏名(Name): 細川夏風(Hosokawa Natsuka)}
\institute{高知工科大学(Kochi Univ of Tech)}
\date{\today}

\begin{document}

% タイトルスライド
\begin{frame}
    \titlepage
\end{frame}

% 目次スライド
\begin{frame}{目次}
    \tableofcontents
\end{frame}

% ==========================================
% ここから本文
% ==========================================

\section{セクション1}

\begin{frame}{スライドタイトル}
    % ここに内容を記述
\end{frame}

\end{document}
EOF

  echo "$1 を作成しました。"
  echo "コンパイルするには以下のコマンドを実行してください："
  echo "lualatex $1"
}

# bashrc.d 読み込み
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        [ -f "$rc" ] && . "$rc"
    done
fi
