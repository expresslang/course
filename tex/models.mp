% symbols.mp   MetaPost express-g symbols (nov 02)

verbatimtex 
  \documentclass[11pt]{article}
  \usepackage{mprefs}
  \def\twolines#1#2{\vbox{\hbox{#1} \hbox{#2}}}
  \def\threelines#1#2#3{\vbox{\hbox{#1} \hbox{#2} \hbox{#3}}}
  \renewcommand{\twolines}[2]{\begin{tabular}{c} #1\\{} #2\end{tabular}}
  \renewcommand{\threelines}[3]{\begin{tabular}{c} #1\\{} #2\\{} #3\end{tabular}}
  \begin{document}
  \footnotesize
etex

input expressg

warningcheck:=0;

%%%% some commonly used variables & values

numeric pl, ph;           % length & height of numeric page connectors
pl:=pconl; ph:=pconh;
numeric plnamed;          % length of named page connector

numeric irh, irl;         % height & length of interschema ref boxes
irh:=2ish;                 % two lines

numeric sdtl, sdth;       % length & height of SDT (e.g. INTEGER) boxes
sdtl:=sdtbl; sdth:=sdtbh;

numeric edtl, edth;       % length & height of enum boxes (inset is sdtbs)
edth:=sdtbh;              % one line

numeric el, eh;           % length & height of entity boxes
eh:=enth;                 % one line

numeric typel;            % length of type box

numeric hspace[];         % horizontal spaces
numeric lyc[];            % Y coords of box bases

%%%%%%%%%%% end preamble

beginfig(1)                       % example 1 (page 1)

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X DATE etex)(nextra);

% length of entity box
el := namespace(btex PERSON etex)(nextra);
eh := 3onelineh;

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex Hair\_Type etex)(niextra);

% length of attribute name
hspace1 := namespace(btex (INV) HUSBAND S [0:2] etex)(nextra);

numeric upshift;   % vertical space between boxes
upshift=sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup+upshift;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;
lyc6 := lyc5+nextup;
lyc7 := lyc6+nextup;
lyc8 := lyc7+nextup;
lyc9 := lyc8+nextup;
lyc10 := lyc9+nextup;
lyc11 := lyc10+nextup;

% (Zcol/row)

%% row 1

z21 = (0,lyc1);
drawENT(21, el, eh)(btex male etex);

z41 = (x21br + hspace1, lyc1);
drawENT(41, el, eh)(btex female etex);

%% row 3

z63=(x41br, lyc3);
drawINTEGER(63);

%% row 5

z65=(x63,lyc5);
drawSTRING(65);

%% row 7

z67=(x63,lyc7);
drawPREF(67, plnamed, ph)(btex 2,5 date etex);

z27ml=(x21,y67ml);
drawENT(27, 2el, eh)(btex person etex);

%% row 9

z69=(x63,lyc9);
drawENUM(69, edtl, edth)(btex hair\_type etex);

%% row 10

z210bm=(x27tm,lyc10);
drawovalbox(210, 2el, edth)(btex *sc\_person etex);

%% box points

z27A=1/4[z27tl, z27tr];
z27S=2/4[z27tl, z27tr];
z27B=3/4[z27tl, z27tr];
z27C=(x27br,y67ml);
z27D=5/6[z27bl,z27br];
z27E=4/6[z27bl,z27br];
z27F=3/6[z27bl,z27br];
z27G=2/6[z27bl,z27br];
z27H=1/6[z27bl,z27br];
z27I=1/4[z27bl,z27tl];
z27J=3/4[z27bl,z27tl];


% sc/person 210/27
drawdash(210bm,27S);
drawA(210bm,27S);

%% person/male/female 27/21/41
z42=(x41tm, 1/2[y41tm,y63]);
z21G=(x27G,y21tl);
z21A=3/4[z21br, z21tr];
z21B=1/4[z21br, z21tr];

z22=(x21G,y42);
drawthickO(27G,21G);
drawthickO(42,41tm);
drawthick(22,42);
label.urt(btex 1 etex, z22);



% person/INT 27/63
VH(27F,63ml);
drawnormalthreeO(27F, 27F.vh, 63ml);
label.urt(btex (DER) age etex, z27F.vh);

% person/STRING 27/65 (3 off)
z64=(x65bm, 1/2[y63tm,y65bm]);
z66=(x65tm, 1/2[y65tm,y27bm]);
VH(27E,64);
drawdashfourO(27E, 27E.vh, 64, 65bm);
label.urt(btex nickname etex, z27E.vh);
VH(27D, 65ml);
drawnormalthreeO(27D, 27D.vh, 65ml);
label.urt(btex last\_name etex, z27D.vh);
z26=(x27D,y66);
drawnormalthreeO(26, 66, 65tm);
label.urt(btex first\_name etex, z26);

% person/date 27/67
drawnormalO(27C, 67ml);
label.urt(btex birth\_date etex, z27C);

% person/hair 27/69
VH(27B, 69ml);
drawnormalthreeO(27B, 27B.vh, 69ml);
label.urt(btex hair etex, z27B.vh);

% person/person (children) 27 J/A
z29=(x27A, y27B.vh);
z19=(x27A-hspace1, y29);
z17=(x19,y27J);
drawnormalfour(27J, 17, 19, 29);
drawnormalO(29,27A);
label.urt(btex children S[0:?] etex, z19);
label.llft(btex (INV) parents S[0:2] etex, z29);
%%%label.ulft(btex children S[0:?] etex, z27J);

% person/person (INV parents) 27 I/H

z15=(x17,y27I);
z14=(x15,y65ml);
z24=(x27H, y14);
%drawnormalfour(27I, 15, 14, 24);
%drawnormalO(24,27H);
%label.ulft(btex (INV) parents S[0:2] etex, z27I);
%label.llft(btex (person.children) etex, z27I);

% male/female 21/41
%z41A= (x41,y21A);
z41A= (x41,y21mr);
%drawdashO(21A,41A);
drawdashO(21mr,41A);
%label.urt(btex wife etex, z21A);
label.urt(btex wife etex, z21mr);
label.llft(btex (INV) husband S [0:1]\space etex, z41A);

%% and the inverse
%z41B= (x41,y21B);
%drawnormalO(41B, 21B);
%label.ulft(btex (INV) husband S [0:1] etex, z41B);
%label.llft(btex (male.wife) etex, z41B);

endfig;                             % end fig 1


beginfig(2)                       % example 1 page 2

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X DATE etex)(nextra);

% length of entity box
el := namespace(btex PERSON etex)(nextra);
eh := 3onelineh;

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex Hair\_Type etex)(niextra);

% length of attribute name
hspace1 := namespace(btex ARRAY [1:3] etex)(nextra);

numeric upshift;   % vertical space between boxes
upshift=sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;
lyc6 := lyc5+nextup;
lyc7 := lyc6+nextup;
lyc8 := lyc7+nextup;
lyc9 := lyc8+nextup;
lyc10 := lyc9+nextup;
lyc11 := lyc10+nextup;

% (Zcol/row)

%% row 1

z21 = (0,lyc1);
drawPREF(21, pl, ph)(btex 2,5 (1) etex);

z41 = (x21br + 2ph, lyc1);
drawTYPE(41, el, edth)(btex date etex);

z61 = (x41br + hspace1, lyc1);
drawINTEGER(61);

%%%%%%%%%%%%

% connections

% PREF/date 21/41
drawnormalO(21mr, 41ml);

% date/INT 41/61
drawnormalO(41mr, 61ml);
label.urt(btex A [1:3] etex, z41mr);


endfig;                             % end fig 2

beginfig(3)                       % example 2 (incomplete fig 4)

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X DATE etex)(nextra);

% length of entity box
el := sdtbl;
eh := sdtbh;

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex Hair\_Type etex)(niextra);

% length of attribute name
hspace1 := namespace(btex VALUES *A [1:3] etex)(ndextra);

numeric upshift;   % vertical space between boxes
upshift=3sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;
lyc6 := lyc5+nextup;
lyc7 := lyc6+nextup;
lyc8 := lyc7+nextup;
lyc9 := lyc8+nextup;
lyc10 := lyc9+nextup;
lyc11 := lyc10+nextup;

% (Zcol/row)

%% row 2

z22=(0, lyc2);
drawENT(22, el, eh)(btex from\_ent etex);

z32=(x22br+hspace1, lyc2);
drawENT(32, el, eh)(btex to\_ent etex);

z42=(x32br+hspace1, lyc2);
drawTYPE(42, sdtbl, sdtbh)(btex strings etex);

%% row 1

z31 = (x32,lyc1);
drawREAL(31);

z41 = (x42, lyc1);
drawSTRING(41);


%% row 4

z24=(x22,lyc4);
drawENT(24, el, eh)(btex super etex);

z34=(x32, lyc4);
drawENT(34, el, eh)(btex sub\_2 etex);

z44=(x42, lyc4);
drawSELECT(44, sdtbl, sdtbh)(btex choice etex);

%% row 3

z23=(x22, lyc3);
drawENT(23, el, eh)(btex sub\_1 etex);

z43br=(x44bl, lyc3);
drawENT(43, el, eh)(btex an\_ent etex);

z53bl=(x44br, lyc3);
drawTYPE(53, sdtbl, sdtbh)(btex name etex);

z33br=(x43bl-hspace1, lyc3);
drawINTEGER(33);

%% connections

% from_ent/REAL 22/31
VH(22bm,31ml);
drawnormalthreeO(22bm, 22bm.vh, 31ml);
%%label.urt(btex values*A[1:3] etex, z22bm.vh);

% from_ent/to_ent 22/32
drawdashO(22mr, 32ml);
%%label.urt(btex description etex, z22mr);

% to_ent/strings 32/42
drawnormalO(32mr,42ml);
%%label.urt(btex text etex, z32mr);

% strings/STRING 42/41
drawnormalO(42bm,41tm);
%%label.lrt(btex L[1:?] etex, z42bm);

% sub1/from 23/22
drawnormalO(23bm,22tm);
%%label.lrt(btex attr etex, z23bm);

% an_ent/INTEGER 43/33
drawnormalO(43ml,33mr);
%%label.ulft(btex int etex, z43ml);

% name/STRING 53/41
VH(53bm,41mr);
drawnormalthreeO(53bm, 53bm.vh, 41mr);


% super/sub1/sub2 24/23/34
drawthickO(24bm,23tm);
drawthickO(24mr,34ml);

% sub2/choice 34/44
drawnormalO(34mr, 44ml);
%%label.urt(btex pick etex, z34mr);

% choice/ent/name 44/43/53
VhV(44bm,43tm);
drawnormalfourO(44bm, 44bm.vhv, 43tm.vhv, 43tm);
VH(53tm, 44bm.vhv);
drawnormalthreeO(44bm.vhv, 53tm.vh, 53tm);


endfig;                             % end fig 3


beginfig(4)                       % example 3 (complete fig 3)

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X DATE etex)(nextra);

% length of entity box
el := sdtbl;
eh := sdtbh;

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex Hair\_Type etex)(niextra);

% length of attribute name
hspace1 := namespace(btex VALUES *A [1:3] etex)(ndextra);

numeric upshift;   % vertical space between boxes
upshift=3sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;
lyc6 := lyc5+nextup;
lyc7 := lyc6+nextup;
lyc8 := lyc7+nextup;
lyc9 := lyc8+nextup;
lyc10 := lyc9+nextup;
lyc11 := lyc10+nextup;

% (Zcol/row)

%% row 2

z22=(0, lyc2);
drawENT(22, el, eh)(btex from\_ent etex);

z32=(x22br+hspace1, lyc2);
drawENT(32, el, eh)(btex to\_ent etex);

z42=(x32br+hspace1, lyc2);
drawTYPE(42, sdtbl, sdtbh)(btex strings etex);

%% row 1

z31 = (x32,lyc1);
drawREAL(31);

z41 = (x42, lyc1);
drawSTRING(41);


%% row 4

z24=(x22,lyc4);
drawENT(24, el, eh)(btex super etex);

z34=(x32, lyc4);
drawENT(34, el, eh)(btex sub\_2 etex);

z44=(x42, lyc4);
drawSELECT(44, sdtbl, sdtbh)(btex choice etex);

%% row 3

z23=(x22, lyc3);
drawENT(23, el, eh)(btex sub\_1 etex);

z43br=(x44bl, lyc3);
drawENT(43, el, eh)(btex an\_ent etex);

z53bl=(x44br, lyc3);
drawTYPE(53, sdtbl, sdtbh)(btex name etex);

z33br=(x43bl-hspace1, lyc3);
drawINTEGER(33);

%% connections

% from_ent/REAL 22/31
VH(22bm,31ml);
drawnormalthreeO(22bm, 22bm.vh, 31ml);
label.urt(btex values*A[1:3] etex, z22bm.vh);

% from_ent/to_ent 22/32
drawdashO(22mr, 32ml);
label.urt(btex description etex, z22mr);

% to_ent/strings 32/42
drawnormalO(32mr,42ml);
label.urt(btex text etex, z32mr);

% strings/STRING 42/41
drawnormalO(42bm,41tm);
label.lrt(btex L[1:?] etex, z42bm);

% sub1/from 23/22
drawnormalO(23bm,22tm);
label.lrt(btex attr etex, z23bm);

% an_ent/INTEGER 43/33
drawnormalO(43ml,33mr);
label.ulft(btex int etex, z43ml);

% name/STRING 53/41
VH(53bm,41mr);
drawnormalthreeO(53bm, 53bm.vh, 41mr);


% super/sub1/sub2 24/23/34
drawthickO(24bm,23tm);
drawthickO(24mr,34ml);

% sub2/choice 34/44
drawnormalO(34mr, 44ml);
label.urt(btex pick etex, z34mr);

% choice/ent/name 44/43/53
VhV(44bm,43tm);
drawnormalfourO(44bm, 44bm.vhv, 43tm.vhv, 43tm);
VH(53tm, 44bm.vhv);
drawnormalthreeO(44bm.vhv, 53tm.vh, 53tm);

endfig;                             % end fig 4



beginfig(5)                       % inheritance graph

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex (ABS) SUB\_2 etex)(ndextra);
eh := onelineh;

numeric upshift;   % vertical space between boxes
upshift=3sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=eh+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

%% row 2

z12=(0,lyc2);
drawENT(12, el, eh)(btex sub1 etex);

z32=(x12br+hspace1, lyc2);
%%drawENT(32, el, eh)(btex (ABS) sub2 etex);
drawENT(32, el, eh)(btex sub2 etex);

z52=(x32br+hspace1, lyc2);
drawENT(52, el, eh)(btex sub5 etex);

%% row 3

z33bm=(x32tm,lyc3);
drawENT(33, el, eh)(btex super etex);

% row 1

z21bm = (1/2[x12br,x32bl], lyc1);
drawENT(21, el, eh)(btex sub3 etex);

z41bm = (1/2[x32br,x52bl], lyc1);
drawENT(41, el, eh)(btex sub4 etex);

z11mr = (1/4[x12bl,x12br], y21ml);
drawovalbox(11, el, 2onelineh)(btex \twolines{(ABS)}{*sc\_sub2} etex);

%% connections

%% sc/sub2 11/32
drawdash(11mr, 32ml);
drawA(11mr, 32ml);


pickup thickpen;

% super/sub1/sub2 33/12/32
z33A=1/3[z33bl,z33br];
z33B=2/3[z33bl,z33br];
z32A=(x33A,y32tl);
drawnormalO(33A,32A);
z32D=1/2[z32A,z33A];
VH(12tm,32D);
drawnormalthreeO(32D, 12tm.vh, 12tm);

VhV(33B, 52tm);
drawnormalfourO(33B, 33B.vhv, 52tm.vhv, 52tm);

% sub2/sub3/sub4 32/21/41
VhV(32bm,21tm);
drawnormalfourO(32bm, 32bm.vhv, 21tm.vhv, 21tm);
VH(41tm, 32bm.vhv);
drawnormalthreeO(32bm.vhv, 41tm.vh, 41tm);
label.urt(btex 1 etex, z32bm.vhv);

endfig;                             % end fig 5


beginfig(6)                       % redeclarations

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := sdtbl;
eh := sdtbh;

numeric upshift;   % vertical space between boxes
upshift=3sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := namespace(btex (RT) ATTR etex)(ndextra);

% (Zcol/row)

% row 1

z11 = (0, lyc1);
drawENT(11, el, eh)(btex sub\_a etex);

z31 = (x11br+hspace1, lyc1);
drawENT(31, el, eh)(btex sub\_b etex);

z51 = (x31br+hspace1, lyc1);
drawREAL(51);

% row 2

z12 = (x11, lyc2);
drawENT(12, el, eh)(btex sup\_a etex);

z32 = (x12br+hspace1, lyc2);
drawENT(32, el, eh)(btex sub\_b etex);

z52 = (x32br+hspace1, lyc2);
drawNUMBER(52);

%% connections

% suba/subb 11/31
drawnormalO(11mr,31ml);
label.urt(btex (RT) attr etex, z11mr);

% subb/REAL 31/51
drawnormalO(31mr,51ml);
label.urt(btex (RT) num etex, z31mr);

% suba/suba 12/11
drawthickO(12bm,11tm);

% supb/subb 32/31
drawthickO(32bm, 31tm);

% supa/supb 12/32
drawnormalO(12mr,32ml);
label.urt(btex attr etex, z12mr);

% supb/REAL 32/52
drawnormalO(32mr,52ml);
label.urt(btex num etex, z32mr);


endfig;                             % end fig 6

beginfig(7)                       % the top schema

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Geom.Surface etex)(nextra);
eh := 2enth;

% length of interschema box
irl := namespace(btex Geom.Surface etex)(nextra);
irh := ish;                 % one line


numeric upshift;   % vertical space between boxes
upshift=3sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=eh+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := namespace(btex bounds L[1:?] etex)(ndextra);

% (Zcol/row)

% row 1

z21=(0,lyc1);
drawENT(21, el, eh)(btex vertex etex);

z41=(x21br+hspace1, lyc1);
drawENT(41, el, eh)(btex edge etex);

z51ml=(x41br+hspace1, y41mr);
drawISU(51, el, irh)(btex geom.curve etex);

z11mr=(x21-hspace1, y21ml);
drawISUR(11, el, 5/4irh)(btex geom.point etex)(btex node etex);


% row 2

z22bm  = (x21tm, lyc2);
drawENT(22, el, eh)(btex vloop etex);

z42bm  = (x41tm, lyc2);
drawENT(42, el, eh)(btex eloop etex);

% row 3

z33bm = (1/2[x22tr,x42tl], lyc3);
%%drawENT(33, el, eh)(btex (ABS) loop etex);
drawENT(33, el, eh)(btex loop etex);

z53ml = (x33mr+hspace1, y33mr);
drawovalbox(53, el, eh)(btex \twolines{(ABS)}{*sc\_loop} etex);

% row 4

z34bm = (x33tm, lyc4);
drawENT(34, el, eh)(btex face etex);

z54ml = (x34br+hspace1, y34mr);
drawISR(54, el, irh)(btex geom.surface etex);

%% connections

% vertex/point 21/11
drawnormal(21ml,11mr);
label.ulft(btex loc etex, z21ml);

% edge/vertex 41/21 (2 off)
z21A=3/4[z21br,z21tr];
z21B=1/4[z21br,z21tr];
z41A=(x41,y21A);
z41B=(x41,y21B);
drawnormalO(41A,21A); label.ulft(btex start etex, z41A);
drawnormalO(41B,21B); label.llft(btex finish etex, z41B);

% edge/curve 41/51
drawnormalO(41mr,51ml);
label.urt(btex loc etex, z41mr);

% vloop/vertex 22/21
drawnormalO(22bm,21tm); label.llft(btex bound etex, z22bm);

% eloop/edge 42/41
drawnormalO(42bm,41tm); label.lrt(btex bound L[1:?] etex, z42bm);

% loop/v/e 33/22/42
VhV(33bm,22tm);
VH(42tm,33bm.vhv);
drawthickO(22tm.vhv, 22tm);
drawthickO(42tm.vh, 42tm);
drawthick(22tm.vhv, 42tm.vh);
drawthick(33bm, 33bm.vhv);
label.urt(btex 1 etex, z33bm.vhv);

% sc/loop 53/33
drawdash(53ml, 33mr);
drawA(53ml, 33mr);

% face/loop 34/33
drawnormalO(34bm,33tm);
label.lrt(btex \twolines{bounds}{L[1:?]} etex, z34bm);

% face/surface 34/54
drawnormal(34mr,54ml);
label.urt(btex loc etex, z34mr);



endfig;                             % end fig 7

%%%%%%%%%%%%%%%%
%%end
%%%%%%%%%%%%%%%%%

beginfig(8)                       % complete schema level

%%drawgrid;

% length of schema box
hspace2 := namespace(btex GEOMETRY etex)(ndextra);
% height of schema box
hspace3 := schemah;


numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 3/2hspace2;

% (Zcol/row)

% row 2

z22 = (0, lyc2);
drawSCHEMA(22, hspace2, hspace3)(btex top etex);

z42 = (x22br+hspace1, lyc2);
drawSCHEMA(42, hspace2, hspace3)(btex geom etex);

z22A = 2/3[z22br,z22tr];
z22B = 1/3[z22br,z22tr];

z42A = (x42, y22A);
z42B = (x42, y22B);

drawnormalO(22A,42A);
drawdashO(22B,42B);

z32B=1/3[z22B,z42B];
z31B=(x32B, y32B-hspace3);
drawnormalCA(31B,32B); % drawnormal(31B,32B);
label.urt(btex surface etex, z31B);

z32A=1/3[z22A,z42A];
z33A=(x32A, y32A+3/2hspace3);
drawnormalCA(33A, 32A); % drawnormal(33A,32A);
label.lrt(btex point $>$ node etex, z33A);
z33C=2/3[z32A,z33A];
label.lrt(btex curve etex, z33C);


endfig;                             % end fig 8


beginfig(9)                       % schema level of 6 schemas


%%drawgrid;

% length of schema box
hspace2 := namespace(btex GEOMETRY etex)(ndextra);
% height of schema box
hspace3 := schemah;


numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=hspace3+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := hspace3;

% (Zcol/row)

% row 2

z22 = (0, lyc2);
drawSCHEMA(22, hspace2, hspace3)(btex stuff etex);

z32 = (x22br+hspace1, lyc2);
drawSCHEMA(32, hspace2, hspace3)(btex whatsits etex);

z42 = (x32br+hspace1, lyc2);
drawSCHEMA(42, hspace2, hspace3)(btex whosits etex);

z52 = (x42br+hspace1, lyc2);
drawSCHEMA(52, hspace2, hspace3)(btex widgets etex);

% row 3

z23 = (x22,lyc3);
drawSCHEMA(23, hspace2, hspace3)(btex gadgets etex);

z53 = (x52,lyc3);
drawSCHEMA(53, hspace2, hspace3)(btex things etex);

%% connections

% box points 23 gadgets
z23A=1/4[z23br,z23tr];
z23B=3/4[z23bl,z23br];
z23C=2/4[z23bl,z23br];
z23D=1/4[z23bl,z23br];

% 22 stuff
z22D=(x23D, y22tl);
z22A=1/4[z22br,z22tr];
z22B=z22bm;

% 32 whatsits
z32B=(x32,y22A);
z32A=(x32br,y32B);

% 42 whosits
z42A=z42tm;
z42D=(x42,y32A);
z42B=(x42br,y42D);
z42C=z42bm;

% 52 widgets
z52A=1/4[z52tl,z52tr];
z52B=2/4[z52tl,z52tr];
z52C=(x52, y42B);

% 53 things
z53B=(x52B, y53);
z53C=(x53, y23A);

%% connections

% gadgets/stuff 23/22
drawnormalO(23D,22D);

% gadgets/things 23/53
drawdashO(23A,53C);

% widgets/things 52/53
drawdashO(52B,53B);

% widgets/whosits 52/42
drawnormalO(52C,42B);

% widgets/gadgets 52A/23B
z23H=(x23B, 2/3[y22tr,y23]);
z23J=(x23C, 1/3[y22tr,y23]);
VH(52A,23H);
drawnormalfourO(52A, 52A.vh, 23H, 23B);


% whosits/whatsits 42/32
drawdashO(42D,32A);

% whosits/gadgets 42A/23C
VH(42A,23J);
drawnormalfourO(42A, 42A.vh, 23J, 23C);

% whosits/stuff 42C/22B
z42F=(x42C, y42-hspace1);
VH(22B,42F);
drawdashfourO(42C, 42F, 22B.vh, 22B);

% whatsits/stuff 32B/22A
drawdashO(32B,22A);


endfig;                             % end fig 9



beginfig(10)                       % instances 1

%%drawgrid;


% length of entity box
el := 2onelineh;
eh := 2onelineh;
% length of long entity box
elong := namespace(btex (ABS) A etex)(nextra);


numeric upshift;   % vertical space between boxes
upshift=sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=eh+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;
lyc6 := lyc5+nextup;
lyc7 := lyc6+nextup;
lyc8 := lyc7+nextup;

hspace1 := 2sdth;

% (Zcol/row)


% row 3

z13=(0,lyc3);
drawENT(13, el, eh)(btex m etex);

z23=(x13br+hspace1, lyc3);
drawENT(23, el, eh)(btex f etex);

z33=(x23br+hspace1, lyc3);
drawENT(33, el, eh)(btex c etex);

z43=(x33br+hspace1, lyc3);
%drawENT(43, elong, eh)(btex (AE) a etex);
drawENT(43, elong, eh)(btex a etex);

%% 43 box points
z43A=1/3[z43tl,z43tr];
z43B=2/3[z43tl,z43tr];

% row 1

z31br=(x43bl, lyc1);
drawENT(31, el, eh)(btex i etex);

z41bl=(x43br, lyc1);
drawENT(41, el, eh)(btex l etex);


% row 5

z25bm=(1/2[x23tr,x33tl], lyc5);
drawENT(25, el, eh)(btex p etex);

z15mr = (x13mr, y25ml);
drawovalbox(15, elong, eh)(btex *p\_subs etex);

z45bm = (x43B, y15);
drawovalbox(45, elong, elong)(btex \twolines{(ABS)}
                                           {*no\_li} etex);



%% connections

% sc/p 15/25
drawdash(15mr, 25ml);
drawA(15mr, 25ml);

% sc/a 45/43
drawdash(45bm, 43B);
drawA(45bm, 43B);

pickup thickpen;

% a/i/l 43/31/41
VhV(43bm,31tm);
drawnormalfourO(43bm, 43bm.vhv, 31tm.vhv, 31tm);
VH(41tm, 43bm.vhv);
drawnormalthreeO(43bm.vhv, 41tm.vh, 41tm);
label.urt(btex 1 etex, z43bm.vhv);

% p/m/f/c/a  25/13/23/33/43

z24 = (x25bm, 1/2[y33tm,y25bm]);
z14 = (1/2[x13tr,x23tl], 1/2[y13tr,y24]);
z34 = (1/2[x33tr,x43tl], y14);

VH(14,24);
drawnormalfour(25bm, 24, 14.vh, 14);
label.urt(btex \& etex, z24);
VH(34,24);
drawnormalthree(24, 34.vh, 34);
label.urt(btex 1 etex, z34);

VyV(13tm, 14, 23tm);
drawnormalthreeO(23tm.vyv, 13tm.vyv, 13tm);
drawnormalO(23tm.vyv, 23tm);
label.urt(btex 1 etex, z14);

VyV(33tm, 34, 43A);
drawnormalthreeO(43A.vyv, 33tm.vyv, 33tm);
drawnormalO(43A.vyv, 43A);

pickup normalpen;

% sc/p total_over 15/13/23

z4 = (x14, y43bm.vhv);
z3 = (x4, y31tm);
z5 = (x15-eh, y15ml);
HxH(15ml, 5, 3);
drawnormalfour(15ml, 15ml.hxh, 3.hxh, 3);
VyV(13bm, 4, 23bm);
drawnormal(3,4);
drawnormalfour(13bm, 13bm.vyv, 23bm.vyv, 23bm);
drawA(13bm.vyv, 13bm);
drawA(23bm.vyv, 23bm);


endfig;                             % end fig 10


beginfig(11)                       % instances 2

%%drawgrid;


% length of entity box
el := 2onelineh;
eh := 2onelineh;
% length of long entity box
elong := namespace(btex (ABS) A etex)(nextra);


numeric upshift;   % vertical space between boxes
upshift=sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=eh+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;
lyc6 := lyc5+nextup;
lyc7 := lyc6+nextup;
lyc8 := lyc7+nextup;

hspace1 := 2sdth;

% (Zcol/row)


% col 1

z13=(0,lyc3);
drawENT(13, el, eh)(btex b etex);

% col 2

z21=(x13br+hspace1, lyc1);
drawENT(21, el, eh)(btex d etex);


z25=(x21, lyc5);
drawENT(25, el, eh)(btex a etex);

z26bm = (x25tm, lyc6);
drawovalbox(26, 2el, eh)(btex *a\_subs etex);

% col 3

z33=(x21br+hspace1, lyc3);
drawENT(33, el, eh)(btex c etex);


%% connections
z24=(x25bm, 1/2[y13tl, y25bl]);
z21A=1/4[z21tl,z21tr];
z21B=3/4[z21tl,z21tr];


% sc/a 26/25
drawdash(26bm, 25tm);
drawA(26bm, 25tm);

pickup thickpen;

% a/b/c 25/13/33

VH(13tm,24); VH(33tm,24);
drawnormalfourO(25bm, 24, 13tm.vh, 13tm);
drawnormalthreeO(24, 33tm.vh, 33tm);
label.urt(btex 1 etex, z24);

% b/d 13/21
VhV(13bm, 21A);
drawnormalfourO(13bm, 13bm.vhv, 21A.vhv, 21A);

% c/d 33/21
VhV(33bm, 21B);
drawnormalfourO(33bm, 33bm.vhv, 21B.vhv, 21B);

endfig;                             % end fig 11


beginfig(12)                       % instances 3

%%drawgrid;


% length of entity box
el := 2onelineh;
eh := 2onelineh;
% length of long entity box
elong := namespace(btex (ABS) A etex)(nextra);


numeric upshift;   % vertical space between boxes
upshift=sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=eh+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;
lyc6 := lyc5+nextup;
lyc7 := lyc6+nextup;
lyc8 := lyc7+nextup;

hspace1 := 2sdth;

% (Zcol/row)


% row 3

z13=(0,lyc3);
drawENT(13, el, eh)(btex b etex);

z23=(x13br+hspace1, lyc3);
drawENT(23, el, eh)(btex c etex);

z33=(x23br+hspace1, lyc3);
%drawENT(33, elong, eh)(btex (ABS) d etex);
drawENT(33, elong, eh)(btex d etex);

z43=(x33br+hspace1, lyc3);
drawENT(43, el, eh)(btex f etex);

z53=(x43br+hspace1, lyc3);
drawENT(53, el, eh)(btex y etex);

z63=(x53br+hspace1, lyc3);
drawENT(63, el, eh)(btex x etex);

% row 1

z21bm=(1/2[x23br,x33bl], lyc1);
drawENT(21, el, eh)(btex k etex);

z31bm=(1/2[x33br,x43bl], lyc1);
drawENT(31, el, eh)(btex l etex);

% row 5

z25bm=(x21tm, lyc5);
drawENT(25, el, eh)(btex a etex);

z55bm=(x53tm, lyc5);
drawENT(55, el, eh)(btex z etex);

z15mr = (x23ml, y25ml);
drawovalbox(15, elong, eh)(btex *a\_subs etex);

% row 2

z12mr = (x23ml, lyc2);
drawovalbox(12, elong, eh)(btex \twolines{(ABS)}{*d\_subs} etex);


%% connections

z43A=1/4[z43tl,z43tr];
z43B=3/4[z43tl,z43tr];

z31A=1/4[z31tl,z31tr];
z31B=3/4[z31tl,z31tr];

% sc/a 15/25
drawdash(15mr, 25ml);
drawA(15mr, 25ml);

% sc/d 12/33
drawdash(12mr, 33bl);
drawA(12mr, 33bl);

pickup thickpen;

% d/k/l 33/21/31
VhV(33bm,21tm);
drawnormalfourO(33bm, 33bm.vhv, 21tm.vhv, 21tm);
VH(31A, 33bm.vhv);
drawnormalthreeO(33bm.vhv, 31A.vh, 31A);
label.urt(btex 1 etex, z33bm.vhv);

% y/l 53/31
VhV(53bm,31B);
drawnormalfourO(53bm, 53bm.vhv, 31B.vhv, 31B);


% z/f/y/x 55/43/53/63

z54=1/2[z55bm,z53tm];
drawnormalO(55bm,53tm);
VH(43B,54);
drawnormalthreeO(54, 43B.vh, 43B);
VH(63tm,54);
drawnormalthreeO(54, 63tm.vh, 63tm);


% a/b/c/d/f 25/13/23/33/43

z24 = (x25bm, y54);
z14 = (1/2[x13tr,x23tl], 1/2[y13tr,y24]);
z34 = (1/2[x33tr,x43tl], y14);

VH(14,24);
drawnormalfour(25bm, 24, 14.vh, 14);
VH(34,24);
drawnormalthree(24, 34.vh, 34);

VyV(13tm, 14, 23tm);
drawnormalthreeO(23tm.vyv, 13tm.vyv, 13tm);
drawnormalO(23tm.vyv, 23tm);
label.urt(btex 1 etex, z14);

VyV(33tm, 34, 43A);
drawnormalthreeO(43A.vyv, 33tm.vyv, 33tm);
drawnormalO(43A.vyv, 43A);


endfig;                             % end fig 12



end

