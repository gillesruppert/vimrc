" Vim color file
" " Converted from Textmate MadeOfBytes using Coloration v0.2.4
" (http://github.com/sickill/coloration)
"
set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "MadeOfBytes"

hi Cursor  guifg=NONE guibg=#ff9900 gui=NONE
hi Visual  guifg=NONE guibg=#3c4e6e gui=NONE
hi CursorLine  guifg=NONE guibg=#45242e gui=NONE
hi CursorColumn  guifg=NONE guibg=#45242e gui=NONE
hi LineNr  guifg=#7e8070 guibg=#000000 gui=NONE
hi VertSplit  guifg=#30302b guibg=#30302b gui=NONE
hi MatchParen  guifg=#949c8b guibg=NONE gui=NONE
hi StatusLine  guifg=#fcffe0 guibg=#30302b gui=bold
hi StatusLineNC  guifg=#fcffe0 guibg=#30302b gui=NONE
hi Pmenu  guifg=#a9ff00 guibg=NONE gui=bold
hi PmenuSel  guifg=NONE guibg=#3c4e6e gui=NONE
hi IncSearch  guifg=NONE guibg=#3c3f54 gui=NONE
hi Search  guifg=NONE guibg=#3c3f54 gui=NONE
hi Directory  guifg=NONE guibg=NONE gui=NONE
hi Folded  guifg=#57654a guibg=#000000 gui=NONE

hi Normal  guifg=#fcffe0 guibg=#000000 gui=NONE
hi Boolean  guifg=NONE guibg=NONE gui=NONE
hi Character  guifg=NONE guibg=NONE gui=NONE
hi Comment  guifg=#57654a guibg=NONE gui=italic
hi Conditional  guifg=#949c8b guibg=NONE gui=NONE
hi Constant  guifg=NONE guibg=NONE gui=NONE
hi Define  guifg=#949c8b guibg=NONE gui=NONE
hi ErrorMsg  guifg=#f8f8f8 guibg=#800f00 gui=NONE
hi WarningMsg  guifg=#f8f8f8 guibg=#800f00 gui=NONE
hi Float  guifg=NONE guibg=NONE gui=NONE
hi Function  guifg=#a9ff00 guibg=NONE gui=bold
hi Identifier  guifg=#cfbf6b guibg=NONE gui=NONE
hi Keyword  guifg=#949c8b guibg=NONE gui=NONE
hi Label  guifg=#d5d8ff guibg=NONE gui=bold
hi NonText  guifg=#523924 guibg=#45242e gui=NONE
hi Number  guifg=NONE guibg=NONE gui=NONE
hi Operator  guifg=#949c8b guibg=NONE gui=NONE
hi PreProc  guifg=#949c8b guibg=NONE gui=NONE
hi Special  guifg=#fcffe0 guibg=NONE gui=NONE
hi SpecialKey  guifg=#523924 guibg=#45242e gui=NONE
hi Statement  guifg=#949c8b guibg=NONE gui=NONE
hi StorageClass  guifg=#cfbf6b guibg=NONE gui=NONE
hi String  guifg=#d5d8ff guibg=NONE gui=bold
hi Tag  guifg=#b26316 guibg=NONE gui=NONE
hi Title  guifg=#fcffe0 guibg=NONE gui=bold
hi Todo  guifg=#57654a guibg=NONE gui=inverse,bold,italic
hi Type  guifg=#a9ff00 guibg=NONE gui=bold
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#949c8b guibg=NONE gui=NONE
hi rubyFunction  guifg=#a9ff00 guibg=NONE gui=bold
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=NONE guibg=NONE gui=NONE
hi rubyConstant  guifg=#9fc28a guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#d5d8ff guibg=NONE gui=bold
hi rubyBlockParameter  guifg=#b5bfff guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#ff80e1 guibg=NONE gui=NONE
hi rubyInclude  guifg=#949c8b guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#b5bfff guibg=NONE gui=NONE
hi rubyRegexp  guifg=#51a67d guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#51a67d guibg=NONE gui=NONE
hi rubyEscape  guifg=NONE guibg=NONE gui=NONE
hi rubyControl  guifg=#949c8b guibg=NONE gui=NONE
hi rubyClassVariable  guifg=#b5bfff guibg=NONE gui=NONE
hi rubyOperator  guifg=#949c8b guibg=NONE gui=NONE
hi rubyException  guifg=#949c8b guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#ff80e1 guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#9fc28a guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#f5fa03 guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=#f5fa03 guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=#f5fa03 guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=#f5fa03 guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#57654a guibg=NONE gui=italic
hi erubyRailsMethod  guifg=#f5fa03 guibg=NONE gui=NONE
hi htmlTag  guifg=#e5eb95 guibg=NONE gui=bold
hi htmlEndTag  guifg=#e5eb95 guibg=NONE gui=bold
hi htmlTagName  guifg=#e5eb95 guibg=NONE gui=bold
hi htmlArg  guifg=#e5eb95 guibg=NONE gui=bold
hi htmlSpecialChar  guifg=NONE guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#cfbf6b guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=#f5fa03 guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#b26316 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#b5bfff guibg=NONE gui=NONE
hi yamlAlias  guifg=#b5bfff guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#d5d8ff guibg=NONE gui=bold
hi cssURL  guifg=#b5bfff guibg=NONE gui=NONE
hi cssFunctionName  guifg=#f5fa03 guibg=NONE gui=NONE
hi cssColor  guifg=NONE guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#ff9019 guibg=NONE gui=bold
hi cssClassName  guifg=#ff9019 guibg=NONE gui=bold
hi cssValueLength  guifg=NONE guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#f6a082 guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE
