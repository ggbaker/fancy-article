\NeedsTeXFormat{XeLaTeX}
\ProvidesClass{fancyArticle}[2020/05/17 by G. Baker]

%% Use the memoir class as a base. All options passed to this file get
%% passed to  the memoir class
%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions

\LoadClass[
  letterpaper,
  oneside,
  12pt,
  article,
  oldfontcommands
  ]{memoir}
%%%%%
  
%% Use natbib for bibliography formatting.
\RequirePackage{natbib}
\bibliographystyle{agsm}

%% Standard package imports. Mathtools loads amsmath among others
\RequirePackage{mathtools}

%% amsthm is used to define a variety of environments such as theorem,
%% corollary, and proof.
\RequirePackage{amsthm}

%% Metalogo includes XeLaTeX support for various logomarks. Also
%% includes the \XeLaTeX logomark that isn't included in the base
%% distribution
\RequirePackage{metalogo}

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
  math-style=french,
  bold-style=upright,
  nabla=upright,
  partial=upright
  ]{unicode-math}

%% Use Libertinus Serif as the default font. Use inline numerals when
%% not in math-mode.
\setmainfont[
  Mapping=tex-text,
  Ligatures=TeX,
  UprightFeatures={
    Numbers=Lowercase,
    SmallCapsFeatures={
      Letters=SmallCaps,
      LetterSpace=6},
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
\settypeblocksize{50pc}{35pc}{*}

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

%% The titlesec package allows respecifying all title styles 
\RequirePackage[explicit]{titlesec}

%% This is needed to fix some weird bugs with numbering. I have no
%% idea what it actually does. This code came from some long-lost
%% stackexchange post...
%%%%%
\usepackage{etoolbox, apptools}
\makeatletter
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
\patchcmd{\ttlh@hang}{\noindent}{}{}{}
\makeatother
%%%%%

%% Sets title style. I really don't understand how titlesec
%% works. Like much of this section, it's cobbled together from many
%% old stackexchange posts.
%%%%%
\pretitle{\vspace{-3em}\begin{center}\Large\LibTitle\MakeUppercase}
  \posttitle{\par\end{center}\vskip 0.5em}
  \preauthor{\begin{center}
      \large \lineskip 0.5em%
      \begin{tabular}[t]{c}}
 \postauthor{\end{tabular}\par\end{center}}
 \predate{\begin{center}\large}
 \postdate{\par\end{center}\vspace{-1em}}
%%%%%

%% Assign numbers down to the subsection level. 
\setsecnumdepth{subsection}

%% Sets section style.
%%%%%
\renewcommand{\thesection}{\IfAppendix{\alph{section}}{\arabic{section}}}
\titleformat{\section}[hang]                              
  {\scshape\Large}               
  {\IfAppendix{\appendixname~}{\relax}\thesection}{1em}{\MakeLowercase{#1}}[]                                
  \titlespacing*{\section}                                           
  {0em}{17pt}{16pt}   
%%%%%

%% Sets subsection style
%%%%%
\renewcommand{\thesubsection}{\arabic{subsection}}
\titleformat{\subsection}[hang]                              
  {\itshape}
  {\thesection.\thesubsection}{1em}{#1}[]                                
  \titlespacing*{\subsection}                                           
  {0em}{9pt}{9pt}   
%%%%%
  
%% Sets bibliography heading style
\AtBeginDocument{
  \renewcommand\bibsection{\section*{\bibname}}
}

%% Sets abstract style
%%%%%
\renewcommand{\abstractname}{abstract}
\renewcommand{\abstractnamefont}{\scshape}
\renewcommand{\abstracttextfont}{\small}
% Set check for appendix environment for formatting appendix sections
\AtBeginEnvironment{appendices}{\appendixtrue}
%%%%%%

%% Footnote style
%%%%%
% Increases footenote separation and removes horizontal line
\renewcommand\footnoterule{\rule{\linewidth}{0pt}}
\setlength{\footnotesep}{14pt}
% Sets footnote style
\footmarkstyle{#1}
\setlength{\footmarkwidth}{-0.7em}
\setlength{\footmarksep}{0.7em}
%%%%%

%% Sets title footnote style - Not recommended. Use \thanksA commands
%% below with manual markers instead
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

\newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\newtheorem*{lemma*}{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{definition}{Definition}
\newtheorem*{definition*}{Definition}
\newtheorem{assumption}{Assumption}

%% Will probably remove this at some point. This environment was
%% created to make piecewise equations. Older versions of this file
%% had a bug when using the "cases" environment in amsmath that would
%% produce a boxed-x glyph after them. I think this bug no longer
%% exists since the switch to the Libertinus typeface, The "cases"
%% environment /should/ work fine.
\newenvironment{piecewise}
  {\left\{
      \begin{array}{ll}
        }
        {
      \end{array}\color{white}\right\}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CUSTOM COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


%% Create commands for cursive ampersand and letterspaced uppercase
\newcommand{\itand}{\XeTeXglyph2406}
\newcommand{\textuc}[1]{\addfontfeature{LetterSpace=12.0} \uppercase{#1} \addfontfeature{LetterSpace=0.0}}

%% custom title footnote commands
\newcommand{\thanksA}[1]{\renewcommand*{\thefootnote}{\fnsymbol{footnote}}\footnotetext[1]{#1}\renewcommand*{\thefootnote}{\arabic{footnote}}\setcounter{footnote}{0}}
\newcommand{\thanksB}[1]{\renewcommand*{\thefootnote}{\fnsymbol{footnote}}\footnotetext[2]{#1}\renewcommand*{\thefootnote}{\arabic{footnote}}\setcounter{footnote}{0}}

%% Underbar command for math
\newcommand{\ubar}[1]{\text{\b{$#1$}}}

%% Define command for upright d (used for the dx in integrals.)
\newcommand{\D}{\mathrm{d}}

% Define an argmax command similar to \max
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}