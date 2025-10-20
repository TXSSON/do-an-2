ENTRY{
  title
  author
  publisher
  address
  year
  journal
  number
  volume
  pages
  howpublished
  url
} {  } { label }

% s, t: str, generic place to save temporary string
STRINGS { s1 s2 s3 }
% number of label to put into bibliography
% i: generic loop variable
INTEGERS {number.label i1 i2 i3}

% write a bibitem block
% \bibitem{something}
FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  number.label #1 + 'number.label := 
}

FUNCTION {not} { {#0} {#1} if$ }
FUNCTION {or} { {pop$ #1} {skip$} if$ }
FUNCTION {and} { {skip$} {pop$ #0} if$ }

% deglyph vietnamese character
% USAGE: s1 sort.de-unicode.char
% output will be push to stack
STRINGS {subchar}
INTEGERS {subcharfound}
FUNCTION {sort.de-unicode.char}
{ 'subchar :=
  #0 'subcharfound :=
  % 
  subchar "Đ" = {"D" #1 'subcharfound :=} {} if$
  subchar "đ" = {"d" #1 'subcharfound :=} {} if$

  % a series
  subchar "à" = {"a" #1 'subcharfound :=} {} if$
  subchar "á" = {"a" #1 'subcharfound :=} {} if$
  subchar "ã" = {"a" #1 'subcharfound :=} {} if$
  subchar "ả" = {"a" #1 'subcharfound :=} {} if$
  subchar "ạ" = {"a" #1 'subcharfound :=} {} if$
  subchar "À" = {"A" #1 'subcharfound :=} {} if$
  subchar "Á" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ã" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ả" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ạ" = {"A" #1 'subcharfound :=} {} if$

  % a breve series
  subchar "ă" = {"a" #1 'subcharfound :=} {} if$
  subchar "ắ" = {"a" #1 'subcharfound :=} {} if$
  subchar "ằ" = {"a" #1 'subcharfound :=} {} if$
  subchar "ẵ" = {"a" #1 'subcharfound :=} {} if$
  subchar "ẳ" = {"a" #1 'subcharfound :=} {} if$
  subchar "ặ" = {"a" #1 'subcharfound :=} {} if$
  subchar "Ă" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ắ" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ằ" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ẵ" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ẳ" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ặ" = {"A" #1 'subcharfound :=} {} if$

  % a hat series
  subchar "â" = {"a" #1 'subcharfound :=} {} if$
  subchar "ấ" = {"a" #1 'subcharfound :=} {} if$
  subchar "ầ" = {"a" #1 'subcharfound :=} {} if$
  subchar "ẫ" = {"a" #1 'subcharfound :=} {} if$
  subchar "ẩ" = {"a" #1 'subcharfound :=} {} if$
  subchar "ậ" = {"a" #1 'subcharfound :=} {} if$
  subchar "Â" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ấ" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ầ" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ẫ" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ẩ" = {"A" #1 'subcharfound :=} {} if$
  subchar "Ậ" = {"A" #1 'subcharfound :=} {} if$

  % o series
  subchar "ó" = {"o" #1 'subcharfound :=} {} if$
  subchar "ò" = {"o" #1 'subcharfound :=} {} if$
  subchar "õ" = {"o" #1 'subcharfound :=} {} if$
  subchar "ọ" = {"o" #1 'subcharfound :=} {} if$
  subchar "O" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ó" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ò" = {"O" #1 'subcharfound :=} {} if$
  subchar "Õ" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ọ" = {"O" #1 'subcharfound :=} {} if$

  % o hat series
  subchar "ô" = {"o" #1 'subcharfound :=} {} if$
  subchar "ồ" = {"o" #1 'subcharfound :=} {} if$
  subchar "ố" = {"o" #1 'subcharfound :=} {} if$
  subchar "ổ" = {"o" #1 'subcharfound :=} {} if$
  subchar "ỗ" = {"o" #1 'subcharfound :=} {} if$
  subchar "ộ" = {"o" #1 'subcharfound :=} {} if$
  subchar "Ô" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ồ" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ố" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ổ" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ỗ" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ộ" = {"O" #1 'subcharfound :=} {} if$

  % o hook series
  subchar "ơ" = {"o" #1 'subcharfound :=} {} if$
  subchar "ớ" = {"o" #1 'subcharfound :=} {} if$
  subchar "ờ" = {"o" #1 'subcharfound :=} {} if$
  subchar "ở" = {"o" #1 'subcharfound :=} {} if$
  subchar "ỡ" = {"o" #1 'subcharfound :=} {} if$
  subchar "ợ" = {"o" #1 'subcharfound :=} {} if$
  subchar "Ơ" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ớ" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ờ" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ở" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ỡ" = {"O" #1 'subcharfound :=} {} if$
  subchar "Ợ" = {"O" #1 'subcharfound :=} {} if$

  % u series
  subchar "ù" = {"u" #1 'subcharfound :=} {} if$
  subchar "ú" = {"u" #1 'subcharfound :=} {} if$
  subchar "ủ" = {"u" #1 'subcharfound :=} {} if$
  subchar "ũ" = {"u" #1 'subcharfound :=} {} if$
  subchar "ụ" = {"u" #1 'subcharfound :=} {} if$
  subchar "Ù" = {"U" #1 'subcharfound :=} {} if$
  subchar "Ú" = {"U" #1 'subcharfound :=} {} if$
  subchar "Ủ" = {"U" #1 'subcharfound :=} {} if$
  subchar "Ũ" = {"U" #1 'subcharfound :=} {} if$
  subchar "Ụ" = {"U" #1 'subcharfound :=} {} if$

  % u hook series
  subchar "ư" = {"u" #1 'subcharfound :=} {} if$
  subchar "ừ" = {"u" #1 'subcharfound :=} {} if$
  subchar "ứ" = {"u" #1 'subcharfound :=} {} if$
  subchar "ử" = {"u" #1 'subcharfound :=} {} if$
  subchar "ữ" = {"u" #1 'subcharfound :=} {} if$
  subchar "ự" = {"U" #1 'subcharfound :=} {} if$
  subchar "Ư" = {"U" #1 'subcharfound :=} {} if$
  subchar "Ừ" = {"U" #1 'subcharfound :=} {} if$
  subchar "Ứ" = {"U" #1 'subcharfound :=} {} if$
  subchar "Ử" = {"U" #1 'subcharfound :=} {} if$
  subchar "Ữ" = {"U" #1 'subcharfound :=} {} if$
  subchar "Ự" = {"U" #1 'subcharfound :=} {} if$

  % y series
  subchar "ỳ" = {"y" #1 'subcharfound :=} {} if$
  subchar "ý" = {"y" #1 'subcharfound :=} {} if$
  subchar "ỷ" = {"y" #1 'subcharfound :=} {} if$
  subchar "ỹ" = {"y" #1 'subcharfound :=} {} if$
  subchar "ỵ" = {"y" #1 'subcharfound :=} {} if$

  % i series
  subchar "ì" = {"i" #1 'subcharfound :=} {} if$
  subchar "í" = {"i" #1 'subcharfound :=} {} if$
  subchar "ỉ" = {"i" #1 'subcharfound :=} {} if$
  subchar "ĩ" = {"i" #1 'subcharfound :=} {} if$
  subchar "ị" = {"i" #1 'subcharfound :=} {} if$

  % e series
  subchar "è" = {"e" #1 'subcharfound :=} {} if$
  subchar "é" = {"e" #1 'subcharfound :=} {} if$
  subchar "ẻ" = {"e" #1 'subcharfound :=} {} if$
  subchar "ẽ" = {"e" #1 'subcharfound :=} {} if$
  subchar "ẹ" = {"e" #1 'subcharfound :=} {} if$

  % e hat series
  subchar "ê" = {"e" #1 'subcharfound :=} {} if$
  subchar "ề" = {"e" #1 'subcharfound :=} {} if$
  subchar "ế" = {"e" #1 'subcharfound :=} {} if$
  subchar "ể" = {"e" #1 'subcharfound :=} {} if$
  subchar "ễ" = {"e" #1 'subcharfound :=} {} if$
  subchar "ệ" = {"e" #1 'subcharfound :=} {} if$

  % get or empty
  subcharfound { skip$ } { "" } if$
}

% remove glyph for an entire string
FUNCTION {sort.de-unicode.string}
{ 's1 :=
  "" 's2 :=
  #0 'i1 :=
  % iterate though string s1
  { s1 #1 i1 substring$ s1 = not }
  { 
    i1 #1 + 'i1 :=
    % iterate though number of byte
    % if loop end normally (i2 = 4)
    % then append 1 character
    % else append the ascii substitution
    #0 'i2 :=
    { i2 #4 < }
    {
      i2 #1 + 'i2 :=
      s1 i1 i2 substring$ sort.de-unicode.char
      empty$
      { skip$ }
      { s2 s1 i1 i2 substring$ sort.de-unicode.char * 's2 :=
        #10 'i2 :=
      }
      if$
    }
    while$
    % if not exit early...
    i2 #10 <
      { s2 s1 i1 #1 substring$ * 's2 := }
      { skip$ }
    if$
  }
  while$
  % debug only
  % "Substitute: " s1 * " --> " * s2 * warning$
  s2
}

% sort order arange
FUNCTION {presort}
{
  author empty$
  { 
    publisher empty$
    {
      journal empty$
      { "" 'sort.key$ := }
      { journal sort.de-unicode.string 'sort.key$ := }
      if$
    }
    { publisher sort.de-unicode.string 'sort.key$ := }
    if$
  }
  { author sort.de-unicode.string 'sort.key$ := }
  if$
}

% receive a string and wrap
% \textit around it
% USAGE "something" style.emphasize
FUNCTION {style.emphasize}
{ 's1 :=
  s1 empty$
    {""}
    {"\textit{" s1 * "}" * }
  if$
}

% receive a string, wrap
% quoted style around it
% USAGE "something" style.quoted
FUNCTION {style.quoted}
{ 's1 :=
  s1 empty$
    {""}
    {"``" s1 * "''" *}
  if$
}

INTEGERS {ismultipage}
FUNCTION {format.pages}
{ pages 's1 :=
  % tmp string s3 s2
  #0 'i1 :=
  % detect multipage
  #0 'ismultipage :=
  { ismultipage not s1 #1 i1 substring$ s1 = not and }
  {
    % in crease counter
    #1 i1 + 'i1 :=
    % extract first character 
    s1 i1 #1 substring$ duplicate$
    % check if it was a hyphen
    "-" =  
    { #1 'ismultipage := }
    { skip$ }
    if$
    %if it was a space then remove it
    empty$
    {
      i1 #1 - 'i1 := % decrease loop variable
      % first i1 - 1 char
      s1 #1 i1 substring$
      % last i1 to end char
      s1 i1 #2 + global.max$ substring$
      % concat, assign to s1
      * 's1 :=
    } { skip$ }
    if$
  }
  while$
  % debug purpose
  % cite$ "is Multipage" * ismultipage int.to.str$ * warning$
  % cite$ "loop " * i1 int.to.str$ * warning$

  % format if multipage
  ismultipage 
    {
      % save the first page number to s3
      s1 #1 i1 #1 - substring$ 's3 :=
      s3 "--" * 's3 :=
      { s1 #1 i1 substring$ s1 = not }
      { 
        i1 #1 + 'i1 := 
        % check if the current character a number
        s1 i1 #1 substring$ % get current char
        duplicate$ % dupp it to append it later
        chr.to.int$ % convert to char the #2 one
        duplicate$ % dup char code to compare twice
        #47 > % 48 = ascii 0
        swap$ % put char code #1 on top
        #58 < % 57 = ascii 9 
        and % char must be in range of 0 and 9
        % else do nothing
        { s3 swap$ * 's3 := }
        { pop$ }
        if$
      }
      while$
      s3
    }
    % if not multipage print everything
    { s1 }
  if$
  % loop though pages and format
}

% attr = the key in the .bib file
% e.g. journal = "SIAM" => "journal" is attr
STRINGS { attr }
% USAGE: journal "journal" test
FUNCTION {test}
{
  'attr :=
  duplicate$ empty$
    { pop$ "missing " attr * " in " * cite$ * warning$ }
    { pop$ }
  if$
}

% check for missing article attribute
FUNCTION {test.article}
{
  author "author" test
  title "title" test
  journal "journal" test
  volume "volume" test
  number "number" test
  year "year" test
  pages "pages" test
}
FUNCTION {test.book}
{
  author "author" test
  title "title" test
  publisher "publisher" test
  address "address" test
  year "year" test
}

FUNCTION {test.misc}
{
  title "title" test
}

FUNCTION {article}
{ 
  output.bibitem
  test.article
  author write$
  ", " title style.quoted * write$
  ", " journal * write$
  volume empty$
    { "" }
    { ", " volume * }
  if$ write$
  number empty$
    {""}
    {"(" number * ")" *}
  if$ write$
  year empty$
    {""}
    {", " year *}
  if$ write$
  pages empty$
    {""}
    {", " format.pages *}
  if$ write$

  ".\newblock{}" write$
}

FUNCTION {book}
{ output.bibitem
  test.book
  author write$
  ", " title style.emphasize * write$
  ", " publisher * write$
  ", " address * write$
  ", " year * write$
  ".\newblock{}" write$
}

FUNCTION {misc}
{ output.bibitem
  test.misc
  author empty$
    { skip$ }
    { author write$ }
  if$
  ", " title style.quoted * write$
  howpublished empty$
    { skip$ }
    { ", " howpublished * write$ }
  if$
  url empty$
    { skip$ }
    { ", " url * write$ }
  if$
  ".\newblock{}" write$
}

FUNCTION {output.beginbib}
{ "\begin{thebibliography}{" number.label int.to.str$ * "}" * write$ newline$
}

FUNCTION {output.endbib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

READ
ITERATE {presort}
SORT
EXECUTE {output.beginbib}
ITERATE {call.type$}
EXECUTE {output.endbib}