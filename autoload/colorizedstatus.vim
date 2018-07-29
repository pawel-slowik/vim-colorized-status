function! colorizedstatus#GitInfo(...) abort
	if !exists('b:git_dir')
		return ''
	endif
	return fugitive#head(6)
endfunction

function! colorizedstatus#PathInfo(...) abort
	" show relative filename
	" http://stackoverflow.com/a/24463362
	let path_info = fnamemodify(expand('%'), ':~:.')
	if path_info !=# ''
		return path_info
	endif
	" no file opened, cwd outside of $HOME - show full path;
	" strip trailing slash for consistency with how the relative
	" variant works
	return fnamemodify(expand('%'), ':p:s?\/$??')
endfunction

function! colorizedstatus#FunctionInfo(...) abort
	return currentfunction#GetCurrentTag()
endfunction

function! colorizedstatus#PasteInfo(...) abort
	if !&paste
		return ''
	endif
	return 'P'
endfunction

function! colorizedstatus#ErrorInfo(...) abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let err_cnt = l:counts.error + l:counts.style_error
	if err_cnt == 0
		return ''
	endif
	return printf('%2d', err_cnt)
endfunction

function! colorizedstatus#WarningInfo(...) abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let warn_cnt = l:counts.warning + l:counts.style_warning
	if warn_cnt == 0
		return ''
	endif
	return printf('%2d', warn_cnt)
endfunction
