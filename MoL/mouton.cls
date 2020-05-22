% $Id: mouton.cls,v 1.4 2002/12/06 11:04:49 eyrich Exp $
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{mouton}[2002/10/18 v0.9a
^^JLaTeX preliminary document class for Mouton de Gruyter monographs]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% please send problems/feedback to <eyrich@math.tu-berlin.de>                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
%--------------------------------------------------------------------------------
\LoadClass[11pt,twoside]{book}
\RequirePackage{calc}
\RequirePackage{mathptmx}                            % switch to times fonts
\RequirePackage{fancyhdr}                            % running heads
\RequirePackage{extramarks}                          % running heads
\RequirePackage{endnotes}                            % no footnotes
\RequirePackage[small,nooneline,it,hang]{caption2}   % format captions

% page make-up
\normalsize
\setlength{\textheight}{37\baselineskip}\addtolength{\textheight}{\topskip}
\setlength{\textwidth}{118mm}
\setlength{\headheight}{13.59999\p@}
\setlength{\headsep}{14\p@}   
\setlength{\parindent}{5mm}
\setlength{\parskip}{0\p@}
\setlength{\belowcaptionskip}{5\p@} 
\setcounter{secnumdepth}{4}

% no extra space after sentence-final periods:
\frenchspacing

% center page body on the physical page:
\setlength\@tempdima        {\paperwidth} 
\addtolength\@tempdima      {-\textwidth} 
\setlength\oddsidemargin    {.5\@tempdima}
\addtolength\oddsidemargin  {-1in}
\setlength\marginparwidth   {.5\@tempdima}
\addtolength\marginparwidth {-\marginparsep}
\@settopoint\oddsidemargin 
\@settopoint\marginparwidth
\setlength\evensidemargin  {\oddsidemargin}
\@settopoint\evensidemargin

% set running heads using fancyhdr.sty:
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\extramarks{}{#1}}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[RO]{\normalsize{\itshape{\fontsize{10}{11pt}\selectfont\lastxmark}}\hspace{1em}\thepage}
\fancyhead[LE]{\normalsize\thepage\hspace{1em}\itshape\fontsize{10}{11pt}\selectfont\leftmark}
\fancypagestyle{plain}{%
\fancyhead{}% 
\renewcommand{\headrulewidth}{0pt}}

% no running heads on blank pages:
\def\cleardoublepage{%
    \clearpage{\ps@empty\if@twoside\ifodd\c@page\else
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}}

% adjust float parameters
\renewcommand{\topfraction}{.9}
\renewcommand{\bottomfraction}{.9}
\renewcommand{\textfraction}{.1}
\renewcommand{\floatpagefraction}{.9}
\setlength\@fptop{0\p@ }
\setlength\@fpsep{12\p@ }
\setlength\@fpbot{0\p@ plus 1fil }

% remove vertical space above or below captions at the top or bottom
% of a page:
\renewenvironment{table}
               {\setlength\abovecaptionskip{0\p@}%
                \setlength\belowcaptionskip{5\p@}%
                \@float{table}}
               {\end@float}
\renewenvironment{figure}
               {\setlength\abovecaptionskip{5\p@}%
                \setlength\belowcaptionskip{0\p@}%
                \@float{figure}}
               {\end@float}

% set style of various counters:
\renewcommand\thesection      {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thetable        {\@arabic\c@table}
\renewcommand\thefigure       {\@arabic\c@figure}
% we don't want a period in the counter definition but in the headings:
\def\@seccntformat#1{\csname the#1\endcsname.\quad}

% adjust formatting of captions to mouton style (belongs to caption2.sty):
\renewcommand{\captionlabeldelim}{.}

% we don't want the figure and table counters to be reset with the
% start of a new chapter (the following code is from the springer
% CL2EMULT document class.):
\def\@takefromreset#1#2{%
    \def\@tempa{#1}%
    \let\@tempd\@elt
    \def\@elt##1{%
        \def\@tempb{##1}%
        \ifx\@tempa\@tempb\else
            \@addtoreset{##1}{#2}%
        \fi}%
    \expandafter\expandafter\let\expandafter\@tempc\csname cl@#2\endcsname
    \expandafter\def\csname cl@#2\endcsname{}%
    \@tempc
    \let\@elt\@tempd}
% end of code from springer
\@takefromreset{figure}{chapter}%
\@takefromreset{table}{chapter}%
\@takefromreset{footnote}{chapter}%
\@takefromreset{endnote}{chapter}%
\@takefromreset{ExNo}{chapter}%

% chapter head
\def\@makechapterhead#1{%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \fontsize{15}{17pt}\selectfont\bfseries \@chapapp\space \thechapter
        \par\nobreak
      \fi
    \fi
    \interlinepenalty\@M
    \fontsize{15}{17pt}\selectfont\bfseries #1\par\nobreak
    \vskip 36\p@
  }\sectionmark{#1}}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \fontsize{15}{17pt}\selectfont\bfseries  #1\par\nobreak
    \vskip 36\p@
  }\sectionmark{#1}}

\renewcommand\section{\@startsection{section}{1}{\z@}%
                                     {-24pt \@plus -1ex \@minus -.3ex}%
                                     {12pt \@plus.2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-24pt \@plus -1ex \@minus -.3ex}%
                                     {12pt \@plus .2ex}%
                                     {\normalfont\normalsize}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-24pt \@plus -1ex \@minus -.3ex}%
                                     {12pt \@plus .2ex}%
                                     {\normalfont\normalsize\itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{3}{\z@}%
                                     {-24pt \@plus -1ex \@minus -.3ex}%
                                     {12pt \@plus .2ex}%
                                     {\normalfont\normalsize\itshape}}
\renewcommand\subparagraph[1]{\typeout{Warning: You must not use \string\subparagraph\space !}%
                   \vskip2ex \texttt{Warning: You must not use
                   \string\subparagraph!}\vskip2ex}

% endnotes instead of footnotes:
\renewcommand{\footnote}{\endnote}
\renewcommand{\footnotemark}{\endnotemark}
\renewcommand{\footnotetext}{\endnotetext}

% adjust endnotes.sty to mouton style:
\def\enoteformat{\rightskip\z@ \leftskip=2em \parindent=0em
     \leavevmode\llap{\makebox[2em][r]{\@theenmark.\hspace{.5em}}}}
\def\enoteheading{\chapter{\notesname}}

% redefined quote-environment
\renewenvironment{quote}%
{\begin{list}{}{%
      \setlength{\topsep}{13pt plus 3pt minus 3pt}%
      \setlength{\partopsep}{0pt}%
      \setlength{\parsep}{0pt}%      
      \setlength{\rightmargin}{5mm}%
      \setlength{\leftmargin}{5mm}}%
      \setlength{\itemsep}{0pt}%
\item[]\small}
{\unskip\end{list}}

% table of contents
\setcounter{tocdepth}{3}
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname %\thispagestyle{empty} % <-------
        \@mkboth{%
           \contentsname}{\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }

% no bold page numbers in the toc:
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{3em}% 
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \textbf{#1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

% formatting of toc entries:
\renewcommand*\l@section{\@dottedtocline{1}{0em}{3em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{0em}{3em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{0em}{3em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{0em}{3em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{0em}{3em}}

% reference section:
% eventually, a bibtex style file will be prepared. for the time being
% those not using bibtex may use the following commands to format
% their references:
% 
% usage:
% 
% \biblio{Vennemann, Theo}{2000a} 
%    From quantity to syllable cuts: On so-called
%    lengthening in the Germanic Languages. \textit{Journal of Italian
%    Linguistics/Rivista di Linguistica} 12: 251--282.
% 
% \biblioff{2000b} 
%    Triple-cluster reduction in Germanic: Etymology
%    without sound laws? \textit{Historische Sprachwissenschaft}
%    113: 239--258. 

\newcommand{\biblio}[2]{%
  \vspace{0pt plus 7pt}\par
  \noindent
  \footnotesize
  \hangindent=2cm \hangafter=2
  {#1}\newline
  \makebox[2cm][l]{\hspace{1em}#2}\ignorespaces}

\newcommand{\biblioff}[1]{%
  \vspace{0pt plus 7pt}\par
  \noindent
  \hangindent=2cm \hangafter=1
  \makebox[2cm][l]{\hspace{1em}#1}\ignorespaces}

\AtBeginDocument{%
 \renewenvironment{theindex}
                {\if@twocolumn
                   \@restonecolfalse
                 \else
                   \@restonecoltrue
                 \fi
                 \columnseprule \z@
                 \columnsep 35\p@
                 \twocolumn[\@makeschapterhead{\indexname}]%
                 \@mkboth{\indexname}%
                         {\indexname}%
                 \thispagestyle{plain}\parindent\z@
                 \parskip\z@ \@plus .3\p@\relax
                 \let\item\@idxitem}
                {\if@restonecol\onecolumn\else\clearpage\fi}%
%--------------------------------------------------------------------------------
\@takefromreset{ExNo}{chapter}%
\let\eachwordone=\it 
\let\footnote=\endnote
\let\footnotemark=\endnotemark
\let\footnotetext=\endnotetext
\setcounter{page}{4}%
}

\endinput
