"==========================================================================
"File:         nasl.vim
"Description:  Syntax checking plugin for syntastic.vim
"Maintainer:   Benjamin Bergman
"==========================================================================

if exists("g:loaded_syntastic_nasl_nasl_checker")
	finish
endif
let g:loaded_syntastic_nasl_nasl_checker=1

function! SyntaxCheckers_nasl_nasl_GetLocList() dict
	let makeprg = self.makeprgBuild({ 'args': '-XLW' })

	" See ':help errorformat' for format details
	" NASL 5.2
	let errorformat = '%f(%l): %m'

	" NASL 5.0
	let errorformat .= ',' . '%m (%f\, line %l)'
	let errorformat .= ',' . '(%f) %tARNING! %m (line %l)'
	let errorformat .= ',' . '(%f) %tARNING! %m'
	let errorformat .= ',' . '(%f) %tARNING - %m line %l'
	" multi-line syntax error
	let errorformat .= ',' . '%Asyntax %trror\, %m'
	              \ .  ',' . '%Z%.%# %l'

	" Ignore all else
	let errorformat .= ',' . '%-G%.%#'

	return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
	\ 'filetype': 'nasl',
	\ 'name': 'nasl'})
