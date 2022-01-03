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

beginfig(1)                       % simple data types

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Behaviourally\_Decomposed\_ etex)(nextra);
eh := 3enth;

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex grid\_location etex)(niextra);

% length of attribute name
hspace1 := namespace(btex (DER) dimension L etex)(nextra);

numeric upshift;   % vertical space between boxes
upshift=sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := sdth;

% (Zcol/row)

%% row 1

z11 = (0,lyc1);
drawNUMBER(11);

z21 = (x11br+hspace1, lyc1);
drawINTEGER(21);

z31 = (x21br+hspace1, lyc1);
drawREAL(31);

%% row 2

z12 = (x11, lyc2);
drawBOOLEAN(12);

z22 = (x21, lyc2);
drawLOGICAL(22);

z32 = (x31, lyc2);
drawSTRING(32);

%% row 3

z23 = (x21,lyc3);
drawBINARY(23);


endfig;                             % end fig 1


beginfig(2)                       % generic types

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 3enth;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex grid\_location etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := sdth;

% (Zcol/row)

% row 1

%z11 = (0, lyc1);
%drawGENERIC(11);

%z21 = (x11br+hspace1, lyc1);
z21 = (0, lyc1);
%drawGENERICENT(21);
drawASDT(21, sdtbgel, sdtbgeh)(btex GENERIC\_ENTITY etex);


endfig;                             % end fig 2

beginfig(3)                       % SELECT and ENUM

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 3enth;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex ENUMERATION etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=eh+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := sdth;

% (Zcol/row)

% row 1

z11 = (0, lyc1);
drawSELECT(11, edtl, sdtbh)(btex SELECT etex);

z21 = (x11br+hspace1, lyc1);
drawENUM(21, edtl, sdtbh)(btex ENUMERATION etex);


endfig;                             % end fig 3


beginfig(4)                       % short SELECT and ENUM

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 3enth;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex ENUMERATION etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := sdth;

% (Zcol/row)

% row 1

z11 = (0, lyc1);
drawSELECT(11, edtl, sdtbh)(btex a\_select etex);

z21 = (x11br+hspace1, lyc1);
drawENUM(21, edtl, sdtbh)(btex an\_enumeration etex);


endfig;                             % end fig 4


beginfig(5)                       % alternate ENUMs

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 3enth;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex Hair\_Type etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

z11 = (0, lyc1);
drawENUM(11, hspace2, sdtbh)(btex hair\_type etex);

% row 2

z12 = (x11, lyc2);
drawTYPE(12, hspace2, sdtbh)(btex hair\_type etex);

z22 = (x12br+2hspace1, lyc2);
drawENUM(22, edtl, sdtbh)(btex ENUMERATION etex);

drawnormalO(12mr, 22ml);


endfig;                             % end fig 5


beginfig(6)                       % EXTENSIBLES

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 3enth;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) AN\_Select etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

z11 = (0, lyc1);
drawENUM(11, hspace2, sdtbh)(btex (EX) an\_enum etex);

% row 2

z12 = (x11, lyc2);
drawTYPE(12, hspace2, sdtbh)(btex an\_enum etex);

z22 = (x12br+2hspace1, lyc2);
drawENUM(22, edtl, sdtbh)(btex (EX) ENUMERATION etex);

drawnormalO(12mr, 22ml);

% row 3

z13 = (0, lyc3);
drawSELECT(13, hspace2, sdtbh)(btex (EX) a\_select etex);

% row 4

z14 = (x11, lyc4);
drawTYPE(14, hspace2, sdtbh)(btex a\_select etex);

z24 = (x22, lyc4);
drawSELECT(24, edtl, sdtbh)(btex (EX) SELECT etex);

drawnormalO(14mr, 24ml);



endfig;                             % end fig 6

beginfig(7)                       % Extensible SELECT

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 3enth;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) A\_Select etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

% row 2

z12 = (0, lyc2);
drawSELECT(12, edtl, sdtbh)(btex an\_extension etex);

z32 = (x12br+2hspace1, lyc2);
drawSELECT(32, edtl, sdtbh)(btex (EX) ext\_extension etex);

% row 3

z23bm = (1/2[x12tr,x32tl], lyc3);
drawSELECT(23, edtl, sdtbh)(btex (EX) a\_select etex);

z22=(x23bm, 1/2[y12tm,y23bm]);
VH(12tm,22);
VH(32tm,22);
drawthickO(12tm.vh, 12tm);
drawthickO(32tm.vh, 32tm);
drawthick(12tm.vh, 32tm.vh);
drawthick(23bm, 22);


endfig;                             % end fig 7


beginfig(8)                       % defined data type

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 3enth;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) A\_Select etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

% row 2

z12 = (0, lyc2);
drawTYPE(12, edtl, sdtbh)(btex a\_dd\_type etex);


endfig;                             % end fig 8


beginfig(9)                       % entity

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 2onelineh;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) A\_Select etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

% row 2

z12 = (0, lyc2);
drawENT(12, el, eh)(btex an\_entity etex);


endfig;                             % end fig 9



beginfig(10)                       % abstract entity

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 3onelineh;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) A\_Select etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

% row 2

z12 = (0, lyc2);
drawENT(12, el, eh)(btex \twolines{(AE)}{an\_entity} etex);


endfig;                             % end fig 10



beginfig(11)                       % abstract supertype

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 3onelineh;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex ABS etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup= eh + upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

% row 2

z12 = (0, lyc2);
%%drawENT(12, el, eh)(btex \twolines{(ABS)}{an\_entity} etex);
drawENT(12, el, eh)(btex an\_entity etex);

%z32 = (x12br+hspace1, lyc2);
%drawENT(32, el, eh)(btex an\_entity etex);

% row 3

%z33bm = (x32tm, lyc3);
%drawcirclebox(33, hspace2)(btex ABS etex);

z13bm = (x12tm, lyc3);
drawovalbox(13, el, 2onelineh)(btex \twolines{(ABS)}{sc\_entity} etex);


%% connections
%drawnormal(33bm, 32tm);
%drawA(33bm, 32tm);

drawdash(13bm, 12tm);
drawA(13bm, 12tm);


endfig;                             % end fig 11


beginfig(12)                       % total_over subtype constraint

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 2onelineh;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) A\_Select etex)(niextra);

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

hspace1 := 2sdth;

% (Zcol/row)

% row 4

z24=(0,lyc4);
drawENT(24, el, eh)(btex male etex);

z44=(x24br+hspace1, lyc4);
drawENT(44, el, eh)(btex female etex);

% row 2

z32bm = (1/2[x24br, x44bl], lyc2);
drawovalbox(32, el, eh)(btex *gender etex);

% row 6

z36bm = (x32tm, lyc6);
drawENT(36, el, eh)(btex person etex);

%% connections

% gender/male/female 32/24/44
z33=(x32tm, 1/2[y32tm,y24]);
drawnormal(32tm,33);
VyV(24bm, 33, 44bm);
drawnormalfour(24bm, 24bm.vyv, 44bm.vyv, 44bm);
drawA(24bm.vyv, 24bm);
drawA(44bm.vyv, 44bm);

% gender/person 32/36
z14=(x24-hspace1, y24ml);
HxH(32ml, 14, 36ml);
drawdashfour(32ml, 32ml.hxh, 36ml.hxh, 36ml);
drawA(36ml.hxh, 36ml);

% person/male/female 36/24/44

z35=(x36bm, 1/2[y24tm,y36bm]);
drawthick(36bm,35); label.urt(btex 1 etex, z35);
VyV(24tm, 35, 44tm);
drawthick(24tm.vyv, 44tm.vyv);
drawthickO(24tm.vyv, 24tm);
drawthickO(44tm.vyv, 44tm);

endfig;                             % end fig 12


beginfig(13)                       % schema

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 2onelineh;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) A\_Select etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

% row 2

z12 = (0, lyc2);
drawSCHEMA(12, el, schemah)(btex a\_schema etex);


endfig;                             % end fig 13


beginfig(14)                       % lines

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 2onelineh;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) A\_Select etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
%nextup=sdth+upshift;
nextup=upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

% row 2

z12 = (0, lyc2);
z22 = (x12+el, lyc2);
z32 = (x22+el, lyc2);
drawthick(12, 22); label.rt(btex Thick line etex, z32);

% row 3

z13 = (x12, lyc3);
z23 = (x22, lyc3);
z33 = (x32, lyc3);
drawdash(13, 23); label.rt(btex Dashed line etex, z33);

% row 4

z14 = (x12, lyc4);
z24 = (x22, lyc4);
z34 = (x32, lyc4);
drawnormal(14, 24); label.rt(btex Normal line etex, z34);



endfig;                             % end fig 14


beginfig(15)                       % page refs

%%drawgrid;

% length of named page connector
plnamed := namespace(btex Page\#, Ref\#\ (\#, \#, \ldots) etex)(niextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 2onelineh;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) A\_Select etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;


lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

% row 2

z22 = (0, lyc2);
drawPREF(22, plnamed, ph)(btex page\#, ref\#\ name etex);
z12 = (x22-hspace1, y22ml);
drawnormal(12, 22ml);
z32 = (x22mr+hspace1, y22mr);
label.rt(btex \twolines{reference onto}{another page} etex, z32);

% row 3

z13 = (x12, lyc3);
drawPREF(13, plnamed, ph)(btex page\#,ref\#\ (\#,\#, \ldots) etex);
z23 = (x13mr+hspace1, y13mr);
drawnormalO(13mr, 23);
z33 = (x32, y23);
label.rt(btex \twolines{reference onto}{this page} etex, z33);



endfig;                             % end fig 15


beginfig(16)                       % interschema refs

%%drawgrid;

% length of named page connector
plnamed := namespace(btex Page\#, Ref\#\ (\#, \#, \ldots) etex)(niextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 2onelineh;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) A\_Select etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=isrh+upshift;


lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

% row 2

z22 = (0, lyc2);
drawISUR(22, el, isrh)(btex schema.def etex)(btex rename etex);
z32 = (x22mr+hspace1, y22mr);
label.rt(btex \twolines{definition \textsc{use}'d}
                       {from another schema} etex, z32);

% row 3

z23 = (0, lyc3);
drawISRR(23, el, isrh)(btex schema.def etex)(btex rename etex);
z33 = (x32, y23mr);
label.rt(btex \twolines{definition \textsc{reference}'d}
                       {from another schema} etex, z33);



endfig;                             % end fig 16


beginfig(17)                       % subtype_constraint

%%drawgrid;

% length of named page connector
plnamed := namespace(btex X,X Temporal\_Spatial\_Domain etex)(nextra);

% length of entity box
el := namespace(btex Model\_Property\_ etex)(nextra);
eh := 2onelineh;
% length of long entity box
elong := namespace(btex Bevavioural\_Decomposition\_ etex)(nextra);

% length of interschema box
irl := namespace(btex Product\_Definition\_Schema. etex)(2nextra);

% length of enum box
edtl := namespace(btex (EX) ENUMERATION etex)(niextra);

% length of short enum
hspace2 := namespace(btex (EX) A\_Select etex)(niextra);

numeric upshift;   % vertical space between boxes
upshift=2sdth;
numeric nextup;    % vertical space between bases of boxes
nextup=sdth+upshift;

lyc1 := 0;
lyc2 := lyc1+nextup;
lyc3 := lyc2+nextup;
lyc4 := lyc3+nextup;
lyc5 := lyc4+nextup;

hspace1 := 2sdth;

% (Zcol/row)

% row 1

% row 2

z12 = (0, lyc2);
%drawENT(12, el, eh)(btex an\_entity etex);
drawovalbox(12, el, 2onelineh)(btex sc\_constraint etex);


endfig;                             % end fig 17




end

