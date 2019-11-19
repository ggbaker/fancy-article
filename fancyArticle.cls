\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gBakerArticle}[2015/02/10 by G. Baker]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions

\LoadClass[letterpaper,oneside,12pt,article,oldfontcommands]{memoir}


\RequirePackage{natbib}
\bibliographystyle{agsm}

\RequirePackage{mathtools}
\RequirePackage{amsfonts}
\RequirePackage{metalogo}
\RequirePackage[bookmarks=true,hidelinks]{hyperref}



% Sets fonts
\linespread{1.1}

%\RequirePackage[math-style=french,bold-style=upright,nabla=upright,partial=upright,vargreek-shape=unicode]{unicode-math}

\RequirePackage[math-style=french,bold-style=upright,nabla=upright,partial=upright]{unicode-math}

\setmainfont[
  Mapping=tex-text,
  Ligatures=TeX,
  UprightFeatures={
    Numbers=Lowercase,
    SmallCapsFeatures={Letters=SmallCaps,LetterSpace=6},
  },
]{Libertinus Serif}


\setmathfont{Libertinus Math}
%\setmathfont[range={\mathcal,\mathbfcal},StylisticSet=1]{XITS Math}
%\setmathfont[range=\mathup]{Linux Libertine O}
%\setmathfont[range=\mathit]{XITS Math}
%\setmathfont[range=\mathbfup]{Linux Libertine O Bold}
%\setmathfont[range={"222B-"2230}]

\setverbatimfont{\ttfamily\scriptsize}
\setmonofont{Libertinus Mono}

\newcommand{\textverb}[1]{\texttt{\scriptsize #1}}


\newfontfamily\LibTitle[UprightFeatures={
  LetterSpace=10,
  WordSpace=1.3,
  Kerning=Off}
]{Libertinus Serif Display}



% Sets page layout
\setstocksize{11in}{8.5in}
\settypeblocksize{45pc}{35pc}{*}
\setlrmargins{*}{*}{1}
\setulmargins{*}{*}{1.5}

\setheadfoot{2pc}{3pc}

%Set spacing around displays (e.g. equations)
\AtBeginDocument{%
 \abovedisplayskip=15pt plus 1pt minus 1pt
 \abovedisplayshortskip=12pt plus 1pt minus 1pt
 \belowdisplayskip=15pt plus 1pt minus 1pt
 \belowdisplayshortskip=12pt plus 1pt minus 1pt
}


%\RequirePackage[title]{appendix}
\RequirePackage[explicit]{titlesec}
%%%%% Fix for numbering bug
\usepackage{etoolbox, apptools}

\makeatletter
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
\patchcmd{\ttlh@hang}{\noindent}{}{}{}
\makeatother
%%%%%%

\setsecnumdepth{subsection}

% Sets title style
\pretitle{\vspace{-3em}\begin{center}\Large\LibTitle\MakeUppercase}
 \posttitle{\par\end{center}\vskip 0.5em}
 \preauthor{\begin{center}
            \large \lineskip 0.5em%
            \begin{tabular}[t]{c}}
 \postauthor{\end{tabular}\par\end{center}}
 \predate{\begin{center}\large}
 \postdate{\par\end{center}\vspace{-1em}}



% Sets abstract style
\renewcommand{\abstractname}{abstract}
\renewcommand{\abstractnamefont}{\scshape}
\renewcommand{\abstracttextfont}{\small}

% Set check for appendix environment for formatting appendix sections
\AtBeginEnvironment{appendices}{\appendixtrue}

% Sets section style
\renewcommand{\thesection}{\IfAppendix{\alph{section}}{\arabic{section}}}
\titleformat{\section}[hang]                              
{\scshape\Large}               
{\IfAppendix{\appendixname~}{\relax}\thesection}{1em}{\MakeLowercase{#1}}[]                                
\titlespacing*{\section}                                           
{0em}{17pt}{16pt}   


% Sets subsection style
\renewcommand{\thesubsection}{\arabic{subsection}}
\titleformat{\subsection}[hang]                              
{\itshape}               
{\thesection.\thesubsection}{1em}{#1}[]                                
\titlespacing*{\subsection}                                           
{0em}{9pt}{9pt}   

% Sets bibliography heading style
\AtBeginDocument{
  \renewcommand\bibsection{\section*{\bibname}}
}


% Removes increases footenote separation and removes horizontal line
\renewcommand\footnoterule{\rule{\linewidth}{0pt}}
\setlength{\footnotesep}{14pt}

% Sets footnote style
\footmarkstyle{#1}
\setlength{\footmarkwidth}{-0.7em}
\setlength{\footmarksep}{0.7em}


% Sets title footnote style - Not recommended. Use \thanksA commands below with manual markers instead
\thanksmarkseries{fnsymbol}
\thanksmarkstyle{#1}                       
\setlength{\thanksmarkwidth}{-0.7em}
\setlength{\thanksmarksep}{0.7em}


% Sets equation tag style
% \newtagform{none}{}{}    
% \usetagform{none}


% 1 space after periods
\frenchspacing


% Create commands for cursive ampersand and letterspaced uppercase
\newcommand{\itand}{\XeTeXglyph2406}
\newcommand{\textuc}[1]{\addfontfeature{LetterSpace=12.0} \uppercase{#1} \addfontfeature{LetterSpace=0.0}}


% custom title footnote commands
\newcommand{\thanksA}[1]{\renewcommand*{\thefootnote}{\fnsymbol{footnote}}\footnotetext[1]{#1}\renewcommand*{\thefootnote}{\arabic{footnote}}\setcounter{footnote}{0}}

\newcommand{\thanksB}[1]{\renewcommand*{\thefootnote}{\fnsymbol{footnote}}\footnotetext[2]{#1}\renewcommand*{\thefootnote}{\arabic{footnote}}\setcounter{footnote}{0}}


%Underbar command
\newcommand{\ubar}[1]{\text{\b{$#1$}}}

\RequirePackage{amsthm}

 \def\th@plain{
  \thm@headfont{\scshape} % Heading font is italic
  \thm@notefont{} % Note is same as heading
  \itshape% Regular text is also italic
}

\newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\newtheorem*{lemma*}{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{definition}{Definition}
\newtheorem*{definition*}{Definition}
\newtheorem{assumption}{Assumption}

\newenvironment{piecewise}
{\left\{
\begin{array}{ll}
  }
  {
\end{array}\color{white}\right\}}

% Define an argmax command similar to \max
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}

% Define a command for upright d to be used for integrals e.g. dx 
\newcommand{\D}{\mathrm{d}}
