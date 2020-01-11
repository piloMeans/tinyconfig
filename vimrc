set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"   Plug 'fatih/vim-go', { 'do' : ':GoInstallBinaries'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'taglist.vim'
Plugin 'morhetz/gruvbox'
Plugin 'stephpy/vim-yaml'
Plugin 'tfnico/vim-gradle'
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-fugitiv'
Plugin 'frazrepo/vim-rainbow'
"Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sjl/badwolf'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'easymotion/vim-easymotion'
call vundle#end()

"au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

filetype plugin indent on

nmap<C-l> :Tlist <LF>

"let g:go_guru_scope = ["gvisor.googlesource.com/gvisor/..."]
let g:vim_markdown_folding_disabled=1

"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
set t_Co=256
syntax on
setlocal noswapfile " 不要生成swap文件

"set mouse=cn
set showcmd
set updatetime=100
set showmode
set clipboard=unnamed
set bufhidden=hide " 当buffer被丢弃的时候隐藏它
set background=dark
"colorscheme evening " 设定配色方案
"colorscheme gruvbox " 设定配色方案
colorscheme badwolf " 设定配色方案
hi Normal guibg=NONE ctermbg=NONE
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes " 设置备份时的行为为覆盖
set hlsearch " 搜索时高亮显示被找到的文本
"set noerrorbells " 关闭错误信息响铃
"set novisualbell " 关闭使用可视响铃代替呼叫
"set t_vb= " 置空错误铃声的终端代码
set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%) " 设置在状态行显示的信息
"set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为 1
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠

if has("cscope")
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    else
        if $CSCOPE_DB!=""
            cs add $CSCOPE_DB
        endif
    endif
    set csverb
endif

set t_ut=

set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" set ctrlp search ignore case
set ignorecase
let g:ctrlp_follow_symlinks=1


" show tabs in vim
set list
set listchars=tab:>-
let g:rainbow_active=1

" lightline

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  "let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let root = fnamemodify(get(b:, 'gitbranch_path'), ':h:h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"easymotion
"nmap s <Plug>(easymotion-s)
map <Leader> <Plug>(easymotion-prefix)
"nmap <Leader>s <Plug>(easymotion-overwin-f2)
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)