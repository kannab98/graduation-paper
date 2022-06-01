\NeedsTeXFormat{LaTeX2e}[1995/12/01]

\ProvidesClass{statphysicsdep}[2015/11/01 v2.0 Non Standard LaTeX document class]

\LoadClass{article}


\RequirePackage[T1, T2A]{fontenc}
\RequirePackage[english, russian]{babel}



\RequirePackage[fontsize=12]{fontsize}
\RequirePackage{fontspec}
\setmainfont{CMU Serif}
% \setmainfont{times.ttf}[
%     Path = fonts/,
%     BoldFont       =  timesbd.ttf,
%     ItalicFont     =  timesi.ttf,
%     BoldItalicFont =  timesbi.ttf
% ]


% minimal values from ГОСТ 7.32-2001 ред. 2009 года.pdf item 6.1.2
\RequirePackage[%
  right=15mm,
  top=20mm,
  bottom=20mm,
  left=30mm,
  headsep=0pt,
  includefoot,
]{geometry}
\RequirePackage{setspace}

\setlength\parindent{1.25cm}
% Полуторный межстрочный интервал 
\onehalfspacing

\RequirePackage{csquotes}

\RequirePackage[%
  style=ieee,
  isbn=true,
  url=true,
  defernumbers=true,
  sorting=nyt, % "Sort by name, year, title."
  % sorting=none, % "Do not sort at all. All entries are processed in citation order." (order of appearance)
  bibencoding=utf8,
  backend=biber,
  sortlocale=en_US,
  language=auto,
  maxnames=10
]{biblatex}


\RequirePackage{amssymb, amsmath, physics}

\RequirePackage{graphicx}

\RequirePackage{indentfirst}
% \RequirePackage[justification=centering]{caption}
% 4.3.1 - 4.3.3 Иллюстрации

% Подпись по умолчанию по центру (для таблиц, листингов и т.п.)
\RequirePackage[normal,nooneline,justification=centering]{caption}

% Длинное тире в качестве разделителя
\DeclareCaptionLabelSeparator*{emdash}{\space\cdash---\space}

% Между подписью и рисунком 10pt
\captionsetup{labelsep=emdash,aboveskip=10pt,belowskip=0pt,position=bottom}

% У рисунков выравнивание по центру
\captionsetup[figure]{justification=centering}

\def\fps@figure{bph}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}





% 6.9 Графический материал

%  Подпись к рисунку
\DeclareCaptionLabelFormat{figure}{Рис. #2}
\captionsetup[figure]{labelformat=figure}

% ... допускается нумерация рисунков в пределах раздела
\@addtoreset{figure}{section}%
\renewcommand{\thefigure}{\thesection.\arabic{figure}}%

\@addtoreset{table}{section}%
\renewcommand{\thetable}{\thesection.\arabic{table}}%


%  ненумерованные перечисления
% \renewcommand{\labelitemi}{\cdash---}
% \renewcommand{\labelitemii}{\cdash---}
% \renewcommand{\labelitemiii}{\cdash---}
% \renewcommand{\labelitemiv}{\cdash---}

\newcommand\Introduction{
  \section*{Введение}
  \addcontentsline{toc}{section}{Введение}
 }

\newcommand\SafetyRules{
  \section*{Техника безопасности}
  \addcontentsline{toc}{section}{Техника безопасности}
 }

\newcommand\Conclusion{
  \section*{Заключение}
  \addcontentsline{toc}{section}{Заключение}
 }

 % Цвета для гиперссылок
\usepackage{xcolor}
\definecolor{linkcolor}{HTML}{000000} % цвет ссылок
\definecolor{urlcolor}{HTML}{799B03} % цвет гиперссылок
 
 
 
\usepackage[
    unicode, 
    colorlinks, 
    urlcolor=linkcolor, 
    linkcolor=linkcolor,
    citecolor=linkcolor
]{hyperref}


