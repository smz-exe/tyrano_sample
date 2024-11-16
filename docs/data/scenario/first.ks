*start

; Setting
[title name="AM8:57"]
@hidemenubutton
[start_keyconfig]

;メッセージウィンドウの設定
[position layer="message0" left=160 top=500 width=1000 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="30" marginl="50" marginr="70" marginb="60"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=510]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;このゲームで登場するキャラクターを宣言
;K-LMS
[chara_new name="K-LMS" storage="K-LMS.png" jname="K-LMS" ]


; タイトル画面
*title
[wait time=200]
; メッセージレイヤーの非表示
@layopt layer=message0 visible=false

;背景画像の設定
[image layer="base" page=fore storage="Background.png" ]
[image layer=1 storage=title.png visible=true top=272 left=366 ]
;ボタンの設定
[button x=490 y=545 graphic="StartButton.png" target=*first]

[s]

; ゲーム開始
*first
[cm]
[freeimage layer=1]

;メニューボタンの表示
@showmenubutton

;背景画像の設定
[bg layer="base" storage="yellow_background.jpeg" time="100"]

@layopt layer=message0 visible=true


メロスは激怒した.[l][r]

必ず、かの邪智暴虐の王を除かねばならぬと決意した。[p]

[iscript]
f.num = 10
f.hello = "Hello, World!"
f.pi = 3.141592653589793
[endscript]

[eval exp="f.num2 = f.num * f.pi"]

f.numの内容: [emb exp="f.num"][l][r]
f.helloの内容: [emb exp="f.hello"][l][r]
f.piの内容: [emb exp="f.pi"][p]
演算の結果: [emb exp="f.num2"][l][r]

[layopt layer="0" visible=true]
[image storage="folder1/icon1.png" layer="0" x="540" y="300" name="icon1" time="100" width="100" height="100" ]
[s]



選択肢を表示します。[l][r]

[link target=*select_1]【1】選択肢 その1  [endlink][r]
[link target=*select_2]【2】選択肢 その2  [endlink][r]
[s]

*select_1
[cm]

選択肢1を選択しました。[l]
@jump target=*common

*select_2
[cm]

選択肢2を選択しました。[l]
@jump target=*common

*common
[cm]
共通ルートです。[p]

好きな方を選んでください。[l][r]

[locate x=100 y=200]
[button graphic="icon1.png" target=*tag_1]
[button x=300 y=200 graphic="icon2.png" target=*tag_2]
[s]

*tag_1
[cm]
選択肢1を選択しました。[l]
@jump target=*tag_common

*tag_2
[cm]
選択肢2を選択しました。[l]
@jump target=*tag_common

*tag_common
[cm]
共通ルートです。[p]



#
さて、ゲームが簡単に作れるというから、来てみたものの[p]

誰もいねぇじゃねぇか。[p]
……[p]
帰るか。。。[p]

[font size="50" ]
#?
ちょっとまったーーーーー[p]
[resetfont ]

#
誰だ！？[p]

;キャラクター登場
[chara_show name="K-LMS" ]
#?
こんにちは。[p]

(中略)[l][r]

[cm]

;メッセージウィンドウの高さを変更する
[position height=160 top=430]

[3d_init]

;ティラノの背景変更タグ
[bg storage="run.jpg"]


;3Dの箱を定義する
[3d_box_new name="mybox" width=100 height=100 depth=100 scale=2 color="0x00ff00" ]

;定義した箱を実際に画面に表示する
[3d_show name="mybox"]
3Dモデル(緑の箱)を表示[p]

[3d_anim name="mybox" pos="-377,-678,-1311" rot="-5,-0.41,300" scale="2"  ]
緑の箱を移動

;gLTFファイルを指定する
[3d_model_new name="AnimatedMorphSphere" storage="AnimatedMorphSphere/AnimatedMorphSphere.gltf" ]
[3d_show name="AnimatedMorphSphere" ]

3Dモデル(アニメーション付き)を表示[p]

[3d_anim name="mybox" pos="100,200,40" rot="3000,3000,200" scale="20"  ]

[3d_anim name="camera" pos="-481,1777,-274" rot="-0.92,0.06,0" scale="1,1,1" ]
カメラのアニメーション[p]

緑の箱のデバッグを開始[p]
[3d_debug name="mybox"]


カメラのデバッグを開始[p]
[3d_debug_camera ]


[3d_anim name="mybox" pos="-377,-678,-1311" rot="-0.15,-0.41,0" scale="2"  ]


[3d_camera pos="345,-32,1000" rot="0.03,0.6,0" scale="1,1,1" ]

[l][r]


ああ、何もかも、ばかばかしい。私は、醜い裏切り者だ。どうとも、勝手にするがよい。やんぬる哉。[l][r]
メロスは...[l][r]

[link target=*tag_sleep] →寝る [endlink][r]
[link target=*tag_run] →走る [endlink][r]
[s]

*tag_sleep

[cm]

[bg storage=sleep.jpg time=500]

メロスは死んだように深く眠った。[l][r]
勇者は、ひどく赤面した。[r]

【 BAD END 】[l][cm]

[jump target=*start]

*tag_run

[bg storage=run.jpg time=500]

[cm]
メロスは黒い風のように走った。[l][r]
陽は、ゆらゆら地平線に没し、まさに最後の一片の残光も、消えようとした時、メロスは疾風の如く刑場に突入した。間に合った。[r]

【 GOOD END 】[l][cm]

[jump target=*start]
