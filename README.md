# Fractal-Pitagora
CMPのレポート課題の再帰・フラクタル 2016/06/01  

## 作ったものの一覧　(再帰・フラクタル)
#### 1.fms
ただただ文字を重ね繰り返してるだけ。  
意外と普通だった…。  

#### 2.ta
カタカナの「タ」を重ねていっただけ。  

#### 3.octps
さっきの「ta」を利用して「タ」で足を「コ」で目を作りタコにした。  
わちゃわちゃしすぎていい感じにならなくて残念。  

#### 4.mous
ミッキーをフラクタルにしてサボテンっぽくなるかと思いきや奥にきれいに整列してるようにしか見えなくて…残念。  

#### 5.bercode
バーコードっぽい模様を作った。ふむふむ…うーんな感じ。  
1/4のsizeの四角を半分にさらに半分の繰り返しをして交互に色を変える。それを方向を変えて4つ並べた。  

#### 6.spider
フラクタルでも再帰でもない。交互に黒と赤の三角形を交互に並べ、さらに次の段階では前の段階と逆の色から初めて三角形を並べた。  

#### 7.circle_cross
6角に円書いて交わりのとこでまた書いた。最初は5角形でやろうとしていたけれど角度を考えるのがめんどくさかったためこれで断念。  

#### 8.cateye
楕円の方向を変えていき交互に色を変えた。ネコの目みたいになった。にゃー。  

#### 9.flower
お花の中に向きをずらしてお花描いていっただけ。  

#### 10.wow
びっくりした感じの動きにしたかったけども色付けtりしてもならなくて残念。まぁこれはこれで好き。  
ひたすら扇形書いただけ。  

#### 11.tiintikkz
太陰対極図のフラクタル。空気遠近法使って奥行きを少し表現してみた。  

#### 12.eye_rect
小学校の時の葉っぱ型の図形問題のフラクタル  

#### 13.leaf
eyerectの四角の部分をなくした。これも空気遠近法つかってみた。こっちのGif滑らかでとても良い。  

## 作ったもの　(自作ピタゴラスイッチ)
　いろんな錯角・だまし絵のデザインを少し取り入れたピタゴラスイッチ。  
　SPACE-keyを押すとgo(FBox)が落ちてきて始まる。  
　最初はミュラー・リヤー錯視。go(FBox)がtile(FBox)を全部一緒に落としていく。  
これによってすべて同じ長さだということが証明される。  
　go(FBox)が落ち切るとスイッチが押されball(FCircle)が落ちてくる。背景のDidの虫食いの部分で跳ね返るようになている。  
文字がどんなに虫食割れていても脳がそれを自然とカバーするのを少し取り入れた。  
ちなみに跳ね返るとき背景の文字とball(FCircle)の模様がぴったり合うようになている。  
　そのあとball(FCircle)がy(FPoly)の部分に入りスイッチが押される。スイッチが押されると  
オオウチ錯視の浮き出て見える丸の部分から小さなb(FCircle)が25個落ちてくる。またそれと同時にfooled(FBox)が回転する。  
オオウチ錯視はすべて2Dで書かれているはずなのに模様が一部ずれているせいで浮いているように見えるというもの。  
なのでその飛び出ていることをそのまま使って久寿玉みたいに使った。  
　落ちてきたb(FCircle)はouの隙間を通って落ちていく。これは文字の部分を強調するのではなくて文字でない部分を  
強調させるだまし絵みたいなものを使った。気づかせるために色を付けたり消したりフラッシュさせた。  
　b(FCircle)が落ちるとカフェオールの錯視の板stripe(FPoly)を滑っていく。寡婦ぁオールの錯視は本来ならばすべて平行に書かれているが  
平行に見えないというものだがここでは少々傾きを付けてb(FCircle)が転がるようにした。  
　stripe(FPoly)を滑り切るとfooled(FBox)の上をすべる。これは回転する前では文字の部分がへこんでいるように見えるが、回転後では  
でっぱているように見えるというだまし絵を使った。  
　fooled(FBox)をb(FCircle)が10個滑り切りtall(FBox)のところに落ちるとtall(FBox)が伸びる。  
これは床屋の看板の錯覚を使った。伸びていないはずなのに伸びている。  
　最後はこれが伸びきるとべろべろしたやつが出てきて、背景も派手になり終了。  
　この一連のデザインはただ錯覚を錯角の通りに組み込むのではなくわざとその錯角の騙された状態のものにしたリ  
あべこべにし混乱させるようにしている。そのあべこべに気づけたのかと問うために「Did you fooled?(あなたは騙されましたか?）」  
というメッセージをデザインに組み込んだ。  

## 最後に
フラクタルのほうは主にZentangleとか寄木細工をもとにしていたけれど、作ってみたら再帰じゃないものが多かった。  
文字でいい感じの不抜けた感じが出ることを期待していたけれどもわちゃわちゃしていただけで残念だった。  
作っているうちに何がフラクタルなのかフラクタルじゃないのかわからなくなってすごく困った。  
なるべく現実に近いものにしたかったがスイッチを使ってしまった。時間もなかったから考えたくなかった。  
時間がなくて焦ると地道にやる癖があるからコードがとてつもなく汚い。デザイン考えるので手一杯だった。  