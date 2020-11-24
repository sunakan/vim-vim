echo '---------------a'
let a = []
echo a

echo '---------------b'
let b = [1,2,3,4,5,6]
echo b

echo '---------------c型は自由'
let c = [1,'a',3,'b',5]
echo c

echo '---------------d先頭と末尾に追加'
let d = [1,2,3]
echo d
call add(d, 4)
call insert(d, 0)
echo d

echo '---------------e削除'
let e = [0,1,2,3,4]
echo 'Before: ' e
call remove(e, 2)
echo 'After: ' e

echo '---------------f結合'
let f1 = [0,1,2]
let f2 = [3,4,5]
echo f1 + f2

echo '---------------g場所を指定して結合'
let gindex = 1
let g1 = [0,1,2]
let g2 = [3,4,5]
echo extend(g1, g2, gindex)

echo '---------------hlistのjoin'
let h = ['name', 'lv', 'rank']
echo join(h, ',')
