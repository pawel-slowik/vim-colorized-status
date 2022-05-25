function! colorizedstatus#GitInfo(...) abort
	if exists('*FugitiveGitDir')
		if !empty(FugitiveGitDir(bufnr('')))
			return FugitiveHead(6)
		endif
	endif
	if exists('b:git_dir')
		return fugitive#head(6)
	endif
	return ''
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

let s:lsc_warn_groups = ["lscDiagnosticWarning", "lscDiagnosticInfo", "lscDiagnosticHint"]
let s:lsc_err_groups = ["lscDiagnosticError"]

function! colorizedstatus#ErrorInfo(...) abort
	let err_cnt = len(filter(
		\ copy(getmatches()),
		\ {idx, match_ -> index(s:lsc_err_groups, match_["group"]) != -1}
	\ ))
	if err_cnt == 0
		return ''
	endif
	return printf('%2d', err_cnt)
endfunction

function! colorizedstatus#WarningInfo(...) abort
	let warn_cnt = len(filter(
		\ copy(getmatches()),
		\ {idx, match_ -> index(s:lsc_warn_groups, match_["group"]) != -1}
	\ ))
	if warn_cnt == 0
		return ''
	endif
	return printf('%2d', warn_cnt)
endfunction
