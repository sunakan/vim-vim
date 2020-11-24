echo '---------------a'
let a = {'name': 'taro', 'lv': 100}
echo a
echo a['name']
echo a['lv']

" 数値をkeyにすると、自動で文字列になる
echo '---------------b'
let b = {1: 'apple'}
echo b

" 代入
echo '---------------c'
let c = {}
let c.name = 'tanaka'
let c['lv'] = 99
echo c

" マージ
echo '---------------d'
let d = extend({'name': 'suzuki'}, {'lv': 88})
echo d
