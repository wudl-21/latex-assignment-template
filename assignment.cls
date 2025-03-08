\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}

% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃         选项        ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
% 单/双边模式
\providecommand{\Side}{oneside} % 单边 (不分奇偶数页, 默认) 或双边 (区分奇偶数页) 模式
\newif\if@TwoSide                % [布尔变量] 是否为双边模式
\DeclareOption{oneside}         % 定义“单边模式”
{
    \renewcommand{\Side}{oneside}
    \@TwoSidefalse
}
\DeclareOption{twoside}         % 定义“双边模式”
{
    \renewcommand{\Side}{twoside}
    \@TwoSidetrue
}

% 单/双栏模式
\providecommand{\Column}{onecolumn}
\newif\if@TwoColumn
\DeclareOption{onecolumn}         % 定义“单栏模式”
{
    \renewcommand{\Column}{onecolumn}
    \@TwoColumnfalse
}
\DeclareOption{twocolumn}         % 定义“双栏模式”
{
    \renewcommand{\Column}{twocolumn}
    \@TwoColumntrue
}

% 语言
\newif\if@UsingEnglish   % [布尔变量] 是否 (默认) 使用英语
\DeclareOption{zh}      % 使用中文
{
    \@UsingEnglishfalse
    \PassOptionsToPackage{scheme=chinese}{ctex} % 用 ctex 宏包汉化文档结构
}
\DeclareOption{en}      % 使用英语
{
    \@UsingEnglishtrue
    \PassOptionsToPackage{scheme=plain}{ctex}   % 阻止 ctex 宏包过度汉化
}
\ProcessOptions\relax

% 其余变量传递给 article 类
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃      加载文档类     ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\LoadClass[a4paper, 10pt, \Side, \Column]{article}   % 加载纸张尺寸=A4，字号=10，...，的 article 类
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃       调用宏包      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\RequirePackage[l2tabu, orthodox]{nag} % 检查过时宏包和命令

\RequirePackage[UTF8]{ctex} % 中文支持

\RequirePackage{setspace}

\RequirePackage{afterpage}  % 延迟执行命令直到当前页面结束
\RequirePackage{fix-cm}     % 允许修改字体大小

% 自定义页眉和页脚
\RequirePackage{fancyhdr}   % 页眉和页脚
\RequirePackage{xparse}     % 多可选参数的自定义命令
\RequirePackage{lastpage}   % 返回末页页码
\RequirePackage{calc}       % 返回文本宽度

\RequirePackage{geometry} % 页边距
\geometry{
    a4paper,
    vmargin=.5in,
    hmargin=.5in,
    headheight=\maxof{30pt}{1.5\baselineskip}, % 确保至少能容纳1.5行高度
    headsep=4ex, % 增加页眉与正文间距
    footskip=15mm,          % 固定页脚基线位置
    heightrounded,
    includeheadfoot,
    %showframe,
}

% 多栏模式
\RequirePackage{multicol}

% 数学公式
\RequirePackage{amsmath, amssymb, amsthm, bm, mathtools}    % 基础数学支持, 特殊数学符号, 自定义定理, 公式内加粗
\RequirePackage{mathrsfs}   % 公式内花体字母
\RequirePackage{esint}      % 特殊积分号
\RequirePackage{siunitx}    % 格式化物理量 (包括数值和单位)
\RequirePackage{physics}    % 微分、偏微分记号快捷输入

% 图片
\RequirePackage{graphicx}   % 插入图片
\RequirePackage{float}      % 强制设定图片位置
\RequirePackage{subfigure}  % figure环境中子图
\RequirePackage{tikz}       % 绘图
\RequirePackage{svg}        % 插入svg
\RequirePackage{wrapfig}    % 文字环绕图表

% 表格
\RequirePackage{multirow}   % 表内多行单元格合并
\RequirePackage{booktabs}   % 三线表
\RequirePackage{threeparttable} % 支持注释的表格
\RequirePackage{longtable}  % 表格跨页
\RequirePackage{lscape}     % 横排表格
\RequirePackage{diagbox}    % 单元格内对角分割线
\RequirePackage{makecell}   % 单元格内换行

% 化学式
\RequirePackage[version=4]{mhchem}  % 基础化学式
\RequirePackage{chemfig}            % 化学结构式

% 代码环境
\RequirePackage{listings}   % 程序代码
\RequirePackage{xcolor}     % 颜色
\RequirePackage{fontenc}        % 字体编码
\RequirePackage{lstautogobble}   % 去除代码前的空格及末尾空行
\RequirePackage{listingsutf8}   % 支持代码环境中的UTF-8编码
\RequirePackage{tcolorbox}       % 文本加框
\tcbuselibrary{skins, listings}  % tcolorbox代码环境

% 其他
\RequirePackage{ulem}       % 各式下划线和删除标记
\normalem                   % 避免将意大利斜体 (\emph 或 \em) 替换为下划线
\RequirePackage{color}      % 文本颜色
\RequirePackage{hyperref}   % 超链接
\RequirePackage{framed}     % 文本加框
\RequirePackage{footmisc}   % 脚注引用
\RequirePackage{enumitem}   % bullet point 列表
\RequirePackage{diagbox}    % 表格单元格内斜线分隔
\RequirePackage{cancel}     % 删除线
\RequirePackage{cases}      % 左大括号多编号公式
\RequirePackage{scalerel, stackengine}  % 超长上标（例如\hat、\bar等）
\RequirePackage{ifthen}     % 条件判断
\usepackage{sectsty}      % 章节标题优化
\RequirePackage{lipsum}     % 生成随机文本
\RequirePackage{etoolbox}  % 逻辑判断
\RequirePackage{kvoptions}  % 键值对参数解析
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃         字体        ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
%% 常规
\setmonofont{SFMonoSC}      % 设定等宽字体
\setsansfont{HelveticaNeue}  % 设定无衬线字体
\setCJKsansfont{FZHei}[ % 中文无衬线字体
    AutoFakeSlant = 0.15    % 伪斜体修正（可选）
]
\setCJKmonofont{SFMonoSC}[ % 中文等宽字体
    AutoFakeSlant = 0.15    % 伪斜体修正（可选）
]
\allsectionsfont{\sffamily}   % 指定所有章节标题样式
%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃     自定义颜色      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
%% 行内代码
\definecolor{cmdbg}{gray}{0.95}
\definecolor{cmdborder}{gray}{0.8}

%% 代码环境
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{codebg}{rgb}{0.95,0.95,0.92}
\definecolor{codeborder}{rgb}{214,214,214}
%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃       文档键值      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\SetupKeyvalOptions{
    family=docinfo,
    prefix=DocInfo@
}

% 定义所有键及其默认值
\if@UsingEnglish
    \DeclareStringOption[Default Title]{title}
    \DeclareStringOption[Default Course]{course}
    \DeclareStringOption[AAAA0000]{code}
    \DeclareStringOption[Default Name]{name}
    \DeclareStringOption[00000000]{id}
    \DeclareStringOption[Default Subtitle]{subtitle}
\else
    \DeclareStringOption[默认标题]{title}
    \DeclareStringOption[默认课程]{course}
    \DeclareStringOption[AAAA0000]{code}
    \DeclareStringOption[默认姓名]{name}
    \DeclareStringOption[00000000]{id}
    \DeclareStringOption[默认副标题]{subtitle}
\fi

% 定义 \DocInfo 命令
\newcommand{\DocInfo}[1][]{%
    \setkeys{docinfo}{#1} % 解析键值对
}

% 初始化默认值
\setkeys{docinfo}{} % 强制触发默认值存储


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃       布局键值      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\SetupKeyvalOptions{
    family=layoutinfo,
    prefix=LayoutInfo@
}

% 定义键名（字符串类型）
\DeclareStringOption[1.0]{lineSpacing}
\DeclareStringOption[1.0]{tableLineSpacing}
\DeclareStringOption[0cm]{indent}
\DeclareStringOption[1em]{paragraphSpacing}

% 定义布局命令
\newcommand{\LayoutInfo}[1][]{%
    \setkeys{layoutinfo}{#1}%

    % 应用参数
    \setstretch{\LayoutInfo@lineSpacing}
    \renewcommand{\arraystretch}{\LayoutInfo@tableLineSpacing}
    \setlength{\parindent}{\LayoutInfo@indent}
    \setlength{\parskip}{\LayoutInfo@paragraphSpacing}
}

% 设置默认值
\setkeys{layoutinfo}{}


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃       引文键值      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\SetupKeyvalOptions{
    family=bibinfo,
    prefix=BibInfo@
}

% 定义键名（字符串类型）
\DeclareStringOption[apa]{style}
\DeclareStringOption[english]{language}
\DeclareStringOption[none]{sorting}
\DeclareStringOption[ref.bib]{path}

% 定义布局命令
\newcommand{\BibInfo}[1][]{%
    \setkeys{bibinfo}{#1}%

    % 应用参数
    \RequirePackage[\BibInfo@language, provide=*]{babel}%语言
    \RequirePackage[
        style=\BibInfo@style,
        sorting=\BibInfo@sorting,
        backend=biber
    ]{biblatex}\addbibresource{\BibInfo@path}
}

% 设置默认值
\setkeys{bibinfo}{}


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃       插图键值      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\SetupKeyvalOptions{
    family=figinfo,
    prefix=FigInfo@
}

% 定义键名（字符串类型）
\DeclareStringOption[./img/]{path}

% 定义布局命令
\newcommand{\FigInfo}[1][]{%
    \setkeys{figinfo}{#1}%

    % 应用参数
    \graphicspath{\FigInfo@path}
}

% 设置默认值
\setkeys{figinfo}{}


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃     处理无效键值    ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\DeclareDefaultOption{\PackageWarning{assignment}{Unknown layout key '\CurrentOption' ignored}}
%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃   分栏/页眉/页脚    ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\if@TwoColumn
    \setlength{\columnsep}{1cm}
    \setlength{\columnseprule}{0.5pt}
\fi

\if@UsingEnglish
    \providecommand{\iName}{Name}            % 页眉右 "姓名"
    \providecommand{\iID}{Student ID} % 页眉右 "学号"
\else
    \providecommand{\iName}{姓名}            % 页眉右 "姓名"
    \providecommand{\iID}{学号}       % 页眉右 "学号"
\fi

\fancyhf{}          % 清除预设的页眉和页脚

%% 非首页页眉和页脚样式
\fancypagestyle{Normal}{
    \fancyhead[C]{\DocInfo@title}   % 页眉中
    \fancyhead[L]{\DocInfo@code}   % 页眉左
    \fancyhead[R]{\DocInfo@name}   % 页眉右
    \if@TwoSide
        \fancyfoot[RO]{\thepage\ / \pageref{LastPage}}  % 奇数页脚右: <当前页码> / <总页数>
        \fancyfoot[LE]{\thepage\ / \pageref{LastPage}}  % 偶数页脚左: <当前页码> / <总页数>
    \else
        \fancyfoot[C]{%
            \vbox to \footskip{% 创建固定高度的页脚容器
                \vfil
                \thepage\ / \pageref{LastPage}
                \vfil
            }
        }  % 页脚中: <当前页码> / <总页数>
    \fi
}

%% 首页页眉和页脚样式
\fancypagestyle{First}
{   
    \fancyhf{}
    \fancyhead[C]{%
        \raisebox{-\dp\strutbox}[0pt][0pt]{% 消除标题深度对高度计算的影响
            \parbox[c][\dimexpr30pt+8mm\relax][t]{\textwidth}{% 固定总高度=基准高度+间距
                \centering{\Huge\bfseries\DocInfo@title}\\[0.5ex]
                \DocInfo@subtitle
            }
        }
    }
    \fancyhead[L]{\DocInfo@course\\\DocInfo@code}                   % 页眉左
    \fancyhead[R]{\iName : \makebox[\maxof{\widthof{\DocInfo@name}}{\widthof{\DocInfo@id}}][s]{\DocInfo@name}\\
        \iID : \makebox[\maxof{\widthof{\DocInfo@name}}{\widthof{\DocInfo@id}}][s]{\texttt{\DocInfo@id}}} % 页眉右
    \if@TwoSide
        \fancyfoot[RO]{\thepage\ / \pageref{LastPage}}  % 奇数页脚右: <当前页码> / <总页数>
        \fancyfoot[LE]{\thepage\ / \pageref{LastPage}}  % 偶数页脚左: <当前页码> / <总页数>
    \else
        \fancyfoot[C]{\thepage\ / \pageref{LastPage}}   % 页脚中: <当前页码> / <总页数>
    \fi
}

\thispagestyle{First}       % 设置首页样式
\pagestyle{Normal}          % 设置其他页样式
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃     自定义命令      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
%% 符号
\providecommand{\abs}[1]{\left\lvert#1\right\rvert}         % 绝对值
\providecommand{\norm}[1]{\left\lVert#1\right\rVert}        % 模
\providecommand{\Ex}[2][]{\mathbb{E}\left[#2\ifthenelse{\equal{#1}{}}{}{\vert#1}\right]} % 期望（条件）
\renewcommand{\Pr}[2][]{\text{Pr}\left(#2\ifthenelse{\equal{#1}{}}{}{\vert#1}\right)}    % 概率（条件）
\providecommand{\Cov}[3][]{\text{Cov}\left(#2,#3\ifthenelse{\equal{#1}{}}{}{\vert#1}\right)}    % 协方差（条件）
\providecommand{\Var}[2][]{\text{Var}\left(#2\ifthenelse{\equal{#1}{}}{}{\vert#1}\right)}    % 方差（条件）

\providecommand{\argmin}[2][]{\mathop{\arg\min}_{#1}{#2}}   % argmin
\providecommand{\argmax}[2][]{\mathop{\arg\max}_{#1}{#2}}   % argmax

\stackMath\providecommand{\longstack}[2]{
    \savestack{\tmpbox}{\stretchto{
        \scaleto{
            \scalerel*[\widthof{\ensuremath{#2}}]{\kern.1pt\char`#1\kern.1pt}
            {\rule{0ex}{\textheight}}
        }{\textheight}
    }{1ex}}
    \stackon[0.5pt]{#2}{\tmpbox}
}   % 超长上标

%% 标记
\providecommand{\muline}[1]{\text{\uline{$#1$}}}            % 公式内下划线
\providecommand{\muuline}[1]{\text{\uuline{$#1$}}}          % 公式内双下划线
\providecommand{\muwave}[1]{\text{\wave{$#1$}}}             % 公式内波浪下划线
\providecommand{\msout}[1]{\text{\sout{$#1$}}}              % 公式内删除线
\providecommand{\mxout}[1]{\text{\xout{$#1$}}}              % 公式内删除标记 (多条斜线)
\providecommand{\mdashuline}[1]{\text{\dashuline{$#1$}}}    % 公式内虚下划线
\providecommand{\mdotuline}[1]{\text{\dotuline{$#1$}}}      % 公式内点状虚下划线

%% 图表引用
\providecommand{\figref}[1]{\Figure \ref{#1}}
\providecommand{\tabref}[1]{\Table \ref{#1}}
%\counterwithin{figure}{section}
%\counterwithin{table}{section}
%章节计数器不适用于作业格式

%% 行内代码
\providecommand{\cmd}[1]{\fcolorbox{cmdborder}{cmdbg}{\small\!\texttt{#1}\!}}

%% 表格内缩进组
\providecommand{\subrow}[1]{\hspace{1em}-\ #1}

%% 单栏切换命令
\newcommand{\enteronecolumn}{%
  \clearpage                     % 确保内容刷新
  \onecolumn                     % 切换到单栏
  \thispagestyle{Normal}         % 保持页眉页脚样式一致
  \vspace*{\dimexpr-\headsep-\headheight} % 补偿页眉高度
}
\newcommand{\exitonecolumn}{%
  \clearpage
  \twocolumn                     % 恢复双栏
  \thispagestyle{Normal}
}
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃       题目样式      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\if@UsingEnglish
    \newtheoremstyle{Problem}
    {5ex}
    {}
    {}
    {}
    {\bfseries}
    {.}
    { }
    {\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}
    \theoremstyle{Problem}
    \newtheorem{prob}{Problem}
    \providecommand{\Solution}{Solution}
    \providecommand{\Answer}{Answer}
    \providecommand{\Proof}{Proof}
    \providecommand{\Table}{Table}
    \providecommand{\Figure}{Figure}
\else
    \newtheoremstyle{Problem}   % 定理样式名称
    {5ex}   % 定理上方空间尺寸, 留空为默认
    {}          % 定理下方空间尺寸, 留空为默认
    {}          % 定理主体字体
    {}          % 定理缩进量
    {\bfseries} % 定理开头字体
    {.}         % 定理开头后所接标点
    { }         % 定理开头后所接空间尺寸, 空格为默认词间距
    {第\thmnumber{ #2}\thmname{ #1 }\thmnote{ (#3)}}    % 定理开头格式, 留空为默认
    \theoremstyle{Problem}          % 设定定理样式
    \newtheorem{prob}{题}           % 题目
    \providecommand{\Solution}{解}  % 题解环境 (sol) 中的 "解"
    \providecommand{\Answer}{答}    % 回答环境 (ans) 中的 "答"
    \providecommand{\Proof}{证}     % 证明环境 (pf) 中的 "证"
    \providecommand{\Table}{表}
    \providecommand{\Figure}{图}
\fi
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃   题解样式（单问）  ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\newtheoremstyle{Solution}      % 定理样式名称
{}              % 定理上方空间尺寸, 留空为默认
{}              % 定理下方空间尺寸, 留空为默认
{}              % 定理主体文本字体
{}              % 定理缩进量
{\bfseries}     % 定理开头字体
{:}             % 定理开头后所接标点
{ }             % 定理开头后所接空间尺寸, 空格为默认词间距
{\thmname{#1}}  % 定理开头格式
\makeatletter
\def\@endtheorem{\qed\endtrivlist\@endpefalse}  % 题解末尾添加 QED 符号 (黑色空心小正方形)
\makeatother
\theoremstyle{Solution}         % 设定定理样式
\newtheorem*{sol}{\Solution}    % 题解
\newtheorem*{ans}{\Answer}      % 回答
\newtheorem*{pf}{\Proof}        % 证明
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃   题解样式（多问）  ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\newenvironment{subsol}[1][{\arabic*)}]
 {\enumerate[
   nosep,font=\normalfont\bfseries,
   leftmargin=2em,itemindent=0em,align=left,itemsep=3ex,topsep=0ex,parsep=2ex,label={#1}]}
 {\qed\endenumerate}
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃       代码样式      ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\lstdefinestyle{code}{
    backgroundcolor=\color{codebg},         % 背景色
    basicstyle=\ttfamily\footnotesize,          % 基础样式
    breakatwhitespace=true,                     % 仅在空字符处换行
    breaklines=true,                            % 自动折行
    commentstyle=\color{codegreen},             % 注释样式
    frame=none,                                 % 代码线框环绕样式
    framesep=5pt,                               % 代码线框与代码间距
    keywordstyle=\color{blue},                  % 关键字样式
    xleftmargin=15pt,                           % 为行号留出空间
    numbers=left,                               % 行号位置：左对齐
    numberstyle=\ttfamily\tiny\color{codegray}, % 行号样式
    numbersep=5pt,                              % 行号与代码间距
    stringstyle=\color{codepurple},             % 字符串样式
    captionpos=b,                               % 标题位置
    keepspaces=true,                            % 保留空格
    showspaces=false,                           % 显示空格
    showstringspaces=false,                     % 显示字符串空格
    showtabs=false,                             % 显示制表符
    tab=→,                                      % 制表符显示符号
    tabsize=4,                                  % 制表符大小
    autogobble=true,                            % 去除代码前的空格及末尾空行
    escapeinside={!*}{*!},                         % 默认逃逸符号设置
    literate=  % 特殊字符处理
      {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
      {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
      {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
      {À}{{\`A}}1 {È}{{\`E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
      {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
      {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
      {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
      {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
      {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
      {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
      {€}{{\euro}}1 {£}{{\pounds}}1 {«}{{\guillemotleft}}1
      {»}{{\guillemotright}}1 {ñ}{{\~n}}1 {Ñ}{{\~N}}1,
}

% 创建支持行号控制的代码环境
\makeatletter
\newtcblisting{code}[1][]{
    listing only,
    left=0pt,
    colback=codebg,
    colframe=codeborder,
    enhanced,
    sharp corners,
    boxrule=0.5pt,
    overlay={
        \node[anchor=south east,
              font=\footnotesize\ttfamily\color{gray!60},
              inner sep=3pt] at (frame.south east) {\lstname};
    },
    listing options={
        style=code,
        #1,
    }
}
\makeatother
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃    超链接自动换行   ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\makeatletter
\def\UrlAlphabet{%
      \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
      \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
      \do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D%
      \do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N%
      \do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X%
      \do\Y\do\Z}
\def\UrlDigits{\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0}
\g@addto@macro{\UrlBreaks}{\UrlOrds}
\g@addto@macro{\UrlBreaks}{\UrlAlphabet}
\g@addto@macro{\UrlBreaks}{\UrlDigits}
\makeatother
%%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


% ┏━━━━━━━━━━━━━━━━━━━━━┓
% ┃      杂项设置       ┃
% ┗━━━━━━━━━━━━━━━━━━━━━┛
\allowdisplaybreaks[4]      % 允许公式跨页
\AtBeginEnvironment{tabular}{\singlespacing} % 表格行间距
%━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
