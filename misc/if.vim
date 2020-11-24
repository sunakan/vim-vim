echo '---------------a条件演算子'
let a1 = 1 ? '1はtrue' : '1はfalse'
let a2 = 0 ? '0はtrue' : '0はfalse'
let a3 = -1 ? '-1はtrue' : '-1はfalse'
echo a1
echo a2
echo a3

echo '---------------b'
echo 'abc' == 'abc' ? 'true' : 'false'
echo 'abc' == 'abcd' ? 'true' : 'false'
echo 'abc' != 'abcd' ? 'true' : 'false'
echo 5 >= 3 ? 'true' : 'false'
echo 5 <= 5 ? 'true' : 'false'

echo '---------------c'
echo 'abc' == 'aBC' ? 'true' : 'false'
echo 'abc' ==# 'aBC' ? 'true' : 'false'
echo 'abc' ==? 'aBC' ? 'true' : 'false'
