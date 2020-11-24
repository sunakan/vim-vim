echo '---------------a'
function! Sum(a, b)
  return a:a + a:b
endfunction
echo Sum(1, 2)


echo '---------------b同名funcは上書き'
function! Hoge()
  return 'Hello'
endfunction
function! Hoge()
  return 'World'
endfunction
echo Hoge()
