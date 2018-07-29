" update status line after ALE has finished linting
augroup ALEStatusLine
	autocmd!
	autocmd User ALELintPost redrawstatus!
augroup end
