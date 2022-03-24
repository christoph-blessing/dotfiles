autocmd BufRead,BufNewFile * if !did_filetype() && getline(1) =~# '@startuml\>' | setfiletype plantuml | endif
autocmd BufRead,BufNewFile *.uml,*.plantuml set filetype=plantuml
