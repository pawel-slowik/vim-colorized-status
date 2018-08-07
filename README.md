This is a set of functions that can be used to construct a simple status line
for the [Vim](https://www.vim.org/) editor.

## Requirements

- [fugitive.vim](https://github.com/tpope/vim-fugitive)
- [ALE](https://github.com/w0rp/ale)
- [vim-current-function](https://github.com/pawel-slowik/vim-current-function)

## Usage

Set some colors:

	highlight StatusLineGit ctermbg=22 ctermfg=white cterm=none
	highlight StatusLinePath ctermbg=94 ctermfg=white cterm=none
	highlight StatusLineCurrentFunction ctermbg=23 ctermfg=white cterm=none
	highlight StatusLinePaste ctermbg=89 ctermfg=white cterm=bold
	highlight StatusLineErrorCount ctermbg=darkred ctermfg=white cterm=bold
	highlight StatusLineWarningCount ctermbg=58 ctermfg=white cterm=none

Use the `colorizedstatus#*` functions in your status line:

	set statusline=%<
	set statusline+=%#StatusLineGit#%(%{colorizedstatus#GitInfo()}\ %)%*
	set statusline+=%#StatusLinePath#%(\ %{colorizedstatus#PathInfo()}\ %)%*
	set statusline+=%#StatusLineCurrentFunction#%(\ %{colorizedstatus#FunctionInfo()}\ %)%*
	set statusline+=%=%h%m%r
	set statusline+=%#StatusLinePaste#%(\ %{colorizedstatus#PasteInfo()}\ %)%*
	set statusline+=%#StatusLineErrorCount#%(\ %{colorizedstatus#ErrorInfo()}\ %)%*
	set statusline+=%#StatusLineWarningCount#%(\ %{colorizedstatus#WarningInfo()}\ %)%*
	set statusline+=\ %-9.(%5.l,%3.v%)\ %P

Screenshot:

![screenshot](screenshot.png?raw=true)
