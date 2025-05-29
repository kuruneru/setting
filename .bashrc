#!/bin/bash

function latex {
        for filename in "$@"
        do
                echo '\documentclass{jlreq}' >> $filename.tex
                echo '' >> $filename.tex
                echo '\usepackage{amsmath, amssymb}' >> $filename.tex
                echo '\usepackage{enumerate}' >> $filename.tex
                echo '\usepackage{tikz}' >> $filename.tex
                echo '\usepackage{listings, xcolor};' >> $filename.tex
                echo '' >> $filename.tex

                echo '\lstset{' >> $filename.tex
                echo '  basicstyle = {\ttfamily}, % 基本的なフォントスタイル ' >> $filename.tex
                echo '  frame = {tbrl}, % 枠線の枠線。t: top, b: bottom, r: right, l: left' >> $filename.tex
                echo '  breaklines = true, % 長い行の改行' >> $filename.tex
                echo '  numbers = left, % 行番号の表示。left, right, none' >> $filename.tex
                echo '  showspaces = false, % スペースの表示' >> $filename.tex
                echo '  showstringspaces = false, % 文字列中のスペースの表示' >> $filename.tex
                echo '  showtabs = false, %　タブの表示' >> $filename.tex
                echo '  keywordstyle = \color{blue}, % キーワードのスタイル。intやwhileなど' >> $filename.tex
                echo '  commentstyle = {\color[HTML]{1AB91A}}, % コメントのスタイル' >> $filename.tex
                echo '  identifierstyle = \color{black}, % 識別子のスタイル　関数名や変数名' >> $filename.tex
                echo '  stringstyle = \color{brown}, % 文字列のスタイル' >> $filename.tex
                echo '  captionpos = t % キャプションの位置 t: 上、b: 下' >> $filename.tex
                echo '}' >> $filename.tex
                echo '' >> $filename.tex
                echo '\title{}' >> $filename.tex
                echo '\author{細川 夏風}' >> $filename.tex
                echo '\date{\today}' >> $filename.tex
                echo '' >> $filename.tex
                echo '\begin{document}' >> $filename.tex
                echo '' >> $filename.tex
                echo '  \maketitle' >> $filename.tex
                echo '' >> $filename.tex
                echo '\begin{thebibliography}{99}' >> $filename.tex
                echo '  ' >> $filename.tex
                echo '\end{thebibliography}' >> $filename.tex
                echo '\end{document}' >> $filename.tex
        done
}

function mdc {
        pandoc -s $1.md -o $1.pdf --pdf-engine=xelatex -V mainfont="IPAexMincho" -V geometry:top=2.5cm,bottom=2.5cm,left=3cm,right=20cm
}

function cpp_tmp {
        for filename in "$@"
        do
                echo '#include <iostream>' >> $filename.cpp
                echo '#include <bits/stdc++.h>' >> $filename.cpp
                echo 'using namespace std;' >> $filename.cpp
                echo '' >> $filename.cpp
                echo 'int main() {' >> $filename.cpp
                echo '' >> $filename.cpp
                echo '}' >> $filename.cpp
        done
}
