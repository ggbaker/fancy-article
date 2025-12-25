\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancy-article}[2025-12-25 by G. Baker]

%% Use the memoir class as a base. All options passed to this file get
%% passed to  the memoir class
%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions

\LoadClass[
  letterpaper,
  %a4paper,
  oneside,
  12pt,
  article,
  oldfontcommands,
  ]{memoir}

%%%%%
  
%% Use natbib for bibliography formatting.
\RequirePackage{natbib}
\bibliographystyle{ecta}

%% Standard package imports. Mathtools loads amsmath among others
\RequirePackage{mathtools}

%% amsthm is used to define a variety of environments such as theorem,
%% corollary, and proof.
\RequirePackage{amsthm}

%% Metalogo includes XeLaTeX support for various logomarks. Also
%% includes the \XeLaTeX logomark that isn't included in the base
%% distribution
\RequirePackage{metalogo}

%% Use the comment package for commenting blocks of text
\RequirePackage{comment}

%% Hyperref to create intra-document links between referenced objects
%% and their references. The "hidelinks" option suppresses the usual
%% colored boxes around links. 
\RequirePackage[
  bookmarks=true,
  hidelinks,
  ]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TYPEFACE SPECIFICATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% Unicode-math loads the usual fontspec package that XeTeX uses for
%% typeface specification. French math style gives italic lowercase
%% latin letters, and upright everywhere else. The remaining
%% 'upgright' commands are to match that style.
\RequirePackage[
  % math-style=french,
  math-style=ISO,
  bold-style=upright,
  nabla=upright,
  partial=upright,
  mathbf=sym,
  ]{unicode-math}

%% Use Libertinus Serif as the default font. Use inline numerals when
%% not in math-mode.
\setmainfont[
  Mapping=tex-text,
  Ligatures=TeX,
  UprightFeatures={
    % Numbers=Lowercase,
    SmallCapsFeatures={
      Letters=SmallCaps,
      LetterSpace=7,},
  },
  ]{Libertinus Serif}

%% Use the matching math typeface in mathmode
\setmathfont{Libertinus Math}

%% Use Libertinus Mono for the mono font. For verbatim environments
%% (e.g. for code blocks) use a smaller type size to better match the
%% rest of the document.
\setmonofont{Libertinus Mono}
\setverbatimfont{\ttfamily\scriptsize}
\newcommand{\textverb}[1]{\texttt{\scriptsize #1}}

%% Use the Libertinus Display Type for titles. The display font is
%% slightly thinner to display better at the larger sizes used in a
%% title. 
\newfontfamily\LibTitle[UprightFeatures={
  LetterSpace=10,
  WordSpace=1.3,
  Kerning=Off}
]{Libertinus Serif Display}

%% Put one space after periods. Don't @ me if you think two spaces is
%% better...
\frenchspacing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% The default line spread is a bit tight. Loosen it up just a bit
\linespread{1.05}

%% The typeblock is set to a height of 45 pica and width of 35
%% pica. These are roughly the block size recommended by Bringhurst
%% given the standard font size of Libertinus. These options are all
%% provided by the memoir class.
\settypeblocksize{55pc}{35pc}{*}

%% Center the typeblock horizontally
\setlrmargins{*}{*}{*}

%% Leave a slightly larger lower margin than upper margin
\setulmargins{*}{*}{1.5}

%% The second argument sets the skip distance to the footnotes. Note
%% sure if the first argument is needed since this class doesn't put
%% anything in the header.
\setheadfoot{2pc}{3pc}

%% For some reason memoir needs this command to actually implement the
%% above lines.
\checkandfixthelayout

%% Set spacing around displays (e.g. equations)
\AtBeginDocument{
 \abovedisplayskip=15pt plus 1pt minus 1pt
 \abovedisplayshortskip=12pt plus 1pt minus 1pt
 \belowdisplayskip=15pt plus 1pt minus 1pt
 \belowdisplayshortskip=12pt plus 1pt minus 1pt
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TITLE AND SECTION HEADING STYLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% Sets title style. I really don't understand how titlesec
%% works. Like much of this section, it's cobbled together from many
%% old stackexchange posts.
%%%%%
\pretitle{\vspace{-3em}\begin{center}\normalsize\LibTitle\MakeUppercase}
  \posttitle{\par\end{center}\vskip 0.3em}
  \preauthor{\begin{center}
      \normalsize \lineskip 0.5em%
      \begin{tabular}[t]{c}}
 \postauthor{\end{tabular}\par\end{center}}
 \predate{\begin{center}\small}
 \postdate{\par\end{center}\vspace{-1em}}
%%%%%


%% Change format of date (\today) to dd MM yyyy
\RequirePackage{datetime}
\renewcommand{\today}{\the\day\ \monthname[\the\month] \the\year}

%% Set numbering style for sections
% Ensure sections are not chapter-based (prevents 0.1, 0.2, ...)
\setsecnumdepth{subsubsection}
\renewcommand{\thesection}{\arabic{section}}%
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}%
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}%
\let\fancy@origappendix\appendix
\renewcommand{\appendix}{%
  \fancy@origappendix
  \renewcommand{\thesection}{\Alph{section}}%
  \renewcommand{\thesubsection}{\thesection.\arabic{subsection}}%
  \renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}%
}

%% Set the section heading style and spacing
\setsecheadstyle{\scshape\large\MakeTextLowercase}
  \setsecindent{0em}
  \setbeforesecskip{17pt}
  \setaftersecskip{16pt}

%% Sets subsection style
\setsubsecheadstyle{\itshape}
  \setsubsecindent{0em}
  \setbeforesubsecskip{9pt}
  \setaftersubsecskip{9pt}
  
%% Sets bibliography heading style
\AtBeginDocument{
  \renewcommand\bibsection{\section*{\bibname}}
}

%% Sets abstract style
\renewcommand{\abstractname}{abstract}
\renewcommand{\abstractnamefont}{\scshape}
\renewcommand{\abstracttextfont}{\small}
% set abstract extra margin
\setlength{\absleftindent}{2.5pc}
\setlength{\absrightindent}{2.5pc}

%% Footnote style
% Increases footenote separation and sets horizontal line length
\renewcommand\footnoterule{\noindent\rule{0.15\linewidth}{0.5pt}}
\setlength{\footnotesep}{14pt}
% Sets footnote style
\footmarkstyle{#1}
\setlength{\footmarkwidth}{-0.7em}
\setlength{\footmarksep}{0.7em}
%%%%%

%% Sets title footnote style
%%%%%
\thanksmarkseries{fnsymbol}
\thanksmarkstyle{#1}                       
\setlength{\thanksmarkwidth}{-0.7em}
\setlength{\thanksmarksep}{0.7em}
%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CUSTOM ENVIRONMENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


%% This block defines a number of extra environments, mostly for math
%% purposes. This mostly relies on the amstheorem package.

\def\th@plain{
  \thm@headfont{\scshape} % Heading font is italic
  \thm@notefont{} % Note is same as heading
  \itshape% Regular text is also italic
}

%% Math environments
\newcounter{lem}                              % counter for lemmas
\newtheorem{lemma}[lem]{Lemma}                % lemma environment
\newtheorem*{lemma*}{Lemma}
\newcounter{prop}                             % counter for propositions
\newtheorem{proposition}[prop]{Proposition}   % proposition environment
\newtheorem*{proposition*}{Proposition}
\newcounter{thm}                              % counter for theorems
\newtheorem{theorem}[thm]{Theorem}            % theorem environment
\newtheorem*{theorem*}{Theorem}
\newcounter{cor}                              % counter for corollaries
\newtheorem{corollary}[cor]{Corollary}        % corollary environment
\newtheorem*{corollary*}{Corollary}
\newcounter{conj}                             % counter for conjectures
\newtheorem{conjecture}[conj]{Conjecture}     % conjecture environment
\newtheorem*{conjecture*}{Conjecture}
\newcounter{def}                              % counter for definitions
\newtheorem{definition}[def]{Definition}      % definition environment
\newtheorem*{definition*}{Definition}
\newcounter{assum}                            % counter for assumptions
\newtheorem{assumption}[assum]{Assumption}    % assumption environment
\newtheorem*{assumption*}{Assumption}

%% The autoref command allows automatic insertion of the type of
%% environment before a referenced number.
%% Define the labels for different environments
\def\propautorefname{Proposition}
\def\corautorefname{Corollary}
\def\lemautorefname{Lemma}
\def\thmautorefname{Theorem}
\def\conjautorefname{Conjecture}
\def\defautorefname{Definition}
\def\assumautorefname{Assumption}
\def\equationautorefname{Equation}
\def\sectionautorefname{Section}
\def\figureautorefname{Figure}
%% Make equation references put number in ()
\makeatletter
\def\tagform@#1{\maketag@@@{\ignorespaces#1\unskip\@@italiccorr}}
\let\orgtheequation\theequation
\def\theequation{(\orgtheequation)}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CUSTOM COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%% Create commands for cursive ampersand and letterspaced uppercase
\newcommand{\itand}{\XeTeXglyph2406}
\newcommand{\textuc}[1]{\addfontfeature{LetterSpace=12.0} \uppercase{#1} \addfontfeature{LetterSpace=0.0}}

%% Underbar command for math
\newcommand{\ubar}[1]{\text{\b{$#1$}}}

%% Define command for upright d (used for the dx in integrals.)
\newcommand{\D}{\mathrm{d}}

%% Define an argmax command similar to \max
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}

%% Define a commands for coloring text
\RequirePackage{xcolor}
\newcommand{\red}{\color{red}}
\newcommand{\blue}{\color{blue}}

%% QED symbol
\renewcommand{\qedsymbol}{\textit{Q.E.D.}}