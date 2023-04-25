" Vim color file - Aesir
"
" Inspired by Mustang, BusyBee and BadWolf
"
" HL function and layout snatched from badwolf by Steve Losh
" http://stevelosh.com/projects/badwolf/

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
  finish
endif

set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "aesir"

" Colors ---------- "
let s:hc = {}

" Normal text.
let s:hc.plain = ['e2e2e5', 254]

" Pure and simple.
let s:hc.snow = ['ffffff', 15]
let s:hc.coal = ['000000', 0]

let s:hc.brightgravel   = ['d9cec3', 252]
let s:hc.lightgravel    = ['998f84', 245]
let s:hc.gravel         = ['857f78', 243]
let s:hc.mediumgravel   = ['666462', 241]
let s:hc.deepgravel     = ['45413b', 238]
let s:hc.deepergravel   = ['35322d', 236]
let s:hc.darkgravel     = ['242321', 235]
let s:hc.blackgravel    = ['202020', 234]
let s:hc.blackestgravel = ['141413', 232]

let s:hc.neon = ['d0ffc0', 193]
let s:hc.lime = ['b1d631', 148]
let s:hc.tardis = ['0a9dff', 39]
let s:hc.nebula = ['7e8aa2', 103]
let s:hc.dirtyblonde = ['f4cf86', 222]
let s:hc.taffy = ['ff2c4b', 196]
let s:hc.orange = ['ff9800', 208]
let s:hc.paleyellow = ['fce96b',11]
let s:hc.straw = ['faf4c6', 230]

" Highlighter -----------------------------------------------------------------
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:hc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:hc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:hc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction

" THEME =======================================================================

" UI --------------------------------------------------------------------------
call s:HL('Normal', 'plain', 'darkgravel')
call s:HL('Folded', 'mediumgravel', 'bg', 'none')
call s:HL('VertSplit', 'coal', 'coal', 'none')
call s:HL('HorSplit', 'coal', 'coal', 'none')
call s:HL('ColorColumn',  '', 'blackgravel')
call s:HL('MatchParen', 'taffy', 'bg')
call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')
call s:HL('Visual',    'tardis',  'deepergravel')
call s:HL('VisualNOS', 'snow',  'tardis')
call s:HL('Search',    'coal', 'tardis', 'bold')
call s:HL('IncSearch', 'coal', 'tardis', 'bold')
call s:HL('Underlined', 'fg', '', 'underline')
call s:HL('StatusLine',   'snow', 'bg', 'bold')
call s:HL('StatusLineNC', 'coal', 'bg', 'none')

call s:HL('Directory', 'tardis', '', 'bold')
call s:HL('Title', 'lime')

call s:HL('ErrorMsg',   'taffy',       'bg', 'bold')
call s:HL('MoreMsg',    'lime',   '',   'bold')
call s:HL('ModeMsg',    'dirtyblonde', '',   'bold')
call s:HL('Question',   'dirtyblonde', '',   'bold')
call s:HL('WarningMsg', 'taffy',       'bg',   'bold')

" Gutter
call s:HL('LineNr',     'deepgravel')
call s:HL('SignColumn', '',             'coal')
call s:HL('FoldColumn', 'mediumgravel', 'coal')

" Cursor
call s:HL('Cursor',  'coal', 'tardis', 'bold')
call s:HL('vCursor', 'coal', 'tardis', 'bold')
call s:HL('iCursor', 'coal', 'tardis', 'none')

call s:HL('ExtraWhitespace',  '', 'taffy',    'none')

" Syntax  ---------------------------------------------------------------------

call s:HL('Special', 'orange')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'mediumgravel')
call s:HL('Todo',           'coal', 'paleyellow', 'bold')
call s:HL('SpecialComment', 'brightgravel', 'bg', 'bold')

call s:HL('String', 'lime')

" Control flow stuff is nebula.
call s:HL('Statement',   'dirtyblonde', '', 'none')
call s:HL('Keyword',     'straw', '', 'none')
call s:HL('Conditional', 'orange', '', 'none')
call s:HL('Operator',    'nebula', '', 'none')
call s:HL('Label',       'nebula', '', 'none')
call s:HL('Repeat',      'nebula', '', 'none')

call s:HL('Identifier', 'nebula', '', 'none')
call s:HL('Function',   'paleyellow', '', 'bold')

call s:HL('PreProc',   'straw', '', 'none')
call s:HL('Macro',     'straw', '', 'none')
call s:HL('Define',    'straw', '', 'none')
call s:HL('PreCondit', 'straw', '', 'none')

call s:HL('Include',   'straw', '', 'none')

call s:HL('Constant',  'orange', '', 'none')
call s:HL('Character', 'orange', '', 'none')
call s:HL('Boolean',   'orange', '', 'none')
call s:HL('Number',    'orange', '', 'none')
call s:HL('Float',     'orange', '', 'none')

call s:HL('SpecialChar', 'taffy', '', 'none')

call s:HL('Type', 'orange', '', 'none')
call s:HL('StorageClass', 'orange', '', 'none')
call s:HL('Structure', 'orange', '', 'none')
call s:HL('Typedef', 'orange', '', 'none')

call s:HL('Exception', 'nebula', '', 'none')

" Misc
call s:HL('Error',  'taffy',   'bg', 'bold')
call s:HL('Debug',  'snow',   '',      'bold')
call s:HL('Ignore', 'gravel', '',      '')

" Completion ------------------------------------------------------------------
call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'coal', 'tardis', 'bold')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

" Diffs -----------------------------------------------------------------------
call s:HL('DiffDelete', 'coal', 'coal')
call s:HL('DiffAdd',    '',     'deepergravel')
call s:HL('DiffChange', '',     'darkgravel')
call s:HL('DiffText',   'snow', 'deepergravel', 'bold')
call s:HL('gitDiff', 'lightgravel', '',)
call s:HL('diffRemoved', 'taffy', '',)
call s:HL('diffAdded', 'lime', '',)
call s:HL('diffFile', 'coal', 'taffy', 'bold')
call s:HL('diffNewFile', 'coal', 'taffy', 'bold')
call s:HL('diffLine', 'coal', 'orange', 'bold')
call s:HL('diffSubname', 'orange', '', 'none')

" Specifics ---------------------------------------------------------------------

" Coc -----
call s:HL('CocErrorSign', 'taffy', '', 'none')
call s:HL('CocWarningSign', 'orange', '', 'none')
call s:HL('CocInfoSign', 'tardis', '', 'none')

" NerdTree -----
call s:HL('NERDTreeDir', 'dirtyblonde', '', 'bold')

" EasyMotion -----
call s:HL('EasyMotionTarget', 'tardis',     'bg', 'bold')
call s:HL('EasyMotionShade',  'deepgravel', 'bg')

" CSS -----
call s:HL('cssColorProp', 'straw', '', 'none')
call s:HL('cssBoxProp', 'straw', '', 'none')
call s:HL('cssTextProp', 'straw', '', 'none')
call s:HL('cssRenderProp', 'straw', '', 'none')
call s:HL('cssGeneratedContentProp', 'straw', '', 'none')
call s:HL('cssValueLength', 'plain', '', 'none')
call s:HL('cssColor', 'straw', '', 'bold')
call s:HL('cssBraces', 'lightgravel', '', 'none')
call s:HL('cssIdentifier', 'paleyellow', '', 'bold')
call s:HL('cssClassName', 'paleyellow', '', 'none')

" Punctuation
call s:HL('htmlTag',            'plain', 'bg', 'none')
call s:HL('htmlEndTag',         'plain', 'bg', 'none')
call s:HL('htmlTagName',        'plain', '', 'bold')
call s:HL('htmlSpecialTagName', 'paleyellow', '', 'bold')
call s:HL('htmlSpecialChar',    'lime',   '', 'none')
call s:HL('htmlArg',            'nebula', '', 'none')
call s:HL('htmlLink',           'tardis', '', 'underline')

" Markdown --------------------------------------------------------------------

" MySQL -----------------------------------------------------------------------
call s:HL('mysqlSpecial', 'taffy', '', 'bold')

" Vim -------------------------------------------------------------------------
call s:HL('VimCommentTitle',  'lightgravel',  '', 'bold')
call s:HL('VimMapMod',        'taffy',        '', 'none')
call s:HL('VimMapModKey',     'taffy',        '', 'none')
call s:HL('VimNotation',      'taffy',        '', 'none')
call s:HL('VimBracket',       'taffy',        '', 'none')

" JavaScript ------------------------------------------------------------------
call s:HL('javaScriptDocComment', 'mediumgravel')
call s:HL('javaScriptDocTags',    'lightgravel')
call s:HL('javaScriptDocParam',   'lightgravel', '', 'bold')
call s:HL('javaScriptDocSeeTag',   'snow')
call s:HL('javaScriptReserved', 'nebula')
call s:HL('javaScriptOperator', 'orange')
call s:HL('javaScriptBraces', 'lightgravel')
call s:HL('javaScriptParens', 'lightgravel')

call s:HL('javaScriptTemplateDelim', 'lime')
call s:HL('javaScriptTemplateVar', 'neon')
call s:HL('javaScriptTemplateString', 'lime')
call s:HL('javaScriptObjectKey', 'straw')
call s:HL('javaScriptFunctionKey', 'straw')
call s:HL('javaScriptFuncDef', 'straw', '' , 'bold')
call s:HL('javaScriptFuncArg', 'dirtyblonde')

" Pandoc  -------------------------------------------------------------------
call s:HL('pandocAtxStart', 'mediumgravel')
call s:HL('pandocAtxHeader', 'tardis', '', 'bold')

" Gitgutter -------------------------------------------------------------------
call s:HL('GitGutterAdd', 'lime')
call s:HL('GitGutterChange', 'orange')
call s:HL('GitGutterDelete', 'taffy')
call s:HL('GitGutterChangeDelete', 'taffy')

" TypeScript  ------------------------------------------------------------------
call s:HL('typescriptFuncKeyword', 'paleyellow', '', 'bold')
call s:HL('typescriptFuncName', 'straw', '', 'bold')
call s:HL('typescriptFuncArg', 'dirtyblonde')

" XML (JSX) =------------------------------------------------------------------
call s:HL('jsxRegion','nebula')
call s:HL('xmlAttrib','straw')
call s:HL('xmlAttribPunct', 'lightgravel')
call s:HL('xmlEqual', 'snow')
call s:HL('xmlString','lime')

call s:HL('xmlTagName', 'paleyellow')
call s:HL('xmlStartTag', 'paleyellow')
call s:HL('xmlEndTag', 'paleyellow')

" Haskell =----------------------------------------------------------------------
call s:HL('haskellType', 'nebula')

highlight SignColumn ctermbg=234
