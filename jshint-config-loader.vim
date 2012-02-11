" check whether there is a .jshintrc or jshintrc in the current working
" directory or a parent directory. If yes, it sets it to the syntastic jshint
" config. else nothing happens.
" The code that is walking up the tree is copied and adapted from
" the ctrlp extension. All of this should probably be in an external file and
" tidied up, but I was just happy to get it running in the 1st place.
" As they say: "It ain't pretty but it works..."
fu! s:lash()
  retu &ssl || !exists('+ssl') ? '/' : '\'
endf

fu! s:glbpath(...)
  let cond = v:version > 702 || ( v:version == 702 && has('patch051') )
  retu call('globpath', cond ? a:000 : a:000[:1])
endf

fu! s:getparent(item)
  let parent = substitute(a:item, '[\/][^\/]\+[\/:]\?$', '', '')
  if parent == '' || match(parent, '[\/]') < 0
    let parent .= s:lash()
  en
  retu parent
endf

fu! s:findroot(curr, config, depth, type)
  let [depth, notfound] = [a:depth + 1, empty(s:glbpath(a:curr, a:config, 1))]
  if !notfound
    let g:syntastic_javascript_jshint_conf = a:curr . '/' . a:config
  el
    let parent = s:getparent(a:curr)
    if parent != a:curr | cal s:findroot(parent, a:config, depth, a:type) | en
  en
endf

let configs = ['.jshintrc', 'jshintrc']
for config in configs
  call s:findroot(getcwd(), config, 0, 0)
  if exists('s:foundconfig') | break | endif
endfor
unlet! s:foundconfig
