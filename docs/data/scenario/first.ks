*start

; Setting
[title name="AM8:57"]
@hidemenubutton
[start_keyconfig]
[loadcss file="./data/others/css/style.css"]

;メッセージウィンドウの設定
[position layer="message0" left=160 top=500 width=1000 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="30" marginl="50" marginr="70" marginb="60"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=510]

;上記で定義した領域がキャラクターの名前表示であることを宣言
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
[bg layer="base" storage="Background.png" time="100"]

@layopt layer=message0 visible=true



[html name=container]
<!-- 画面中央にタイマーとランダムな単語を出題 -->
<div id="content">
  <p id="timer">残り時間: 600秒</p>
  <p id="score">正解数: 0 / 30</p>
  <p id="display_word">超伝導</p>
  <p id="display_roman">tyoudendou</p>
  <input type="text" id="user_input" autocomplete="off">
  <div id="colored_input"></div>
  <p id="error_message"></p>
</div>
[endhtml]

[iscript]
// 固定の単語リスト
const fixedWords = {
  1: { kanji: "実験目的", roman: ["jikkenmokuteki", "jikkennmokuteki"] },
  5: { kanji: "実験原理", roman: ["jikkengenri", "jikkenngenri"] },
  9: { kanji: "実験方法", roman: ["jikkenhouhou", "jikkennhouhou"] },
  13: { kanji: "実験結果", roman: ["jikkenkekka", "jikkennkekka"] },
  18: { kanji: "考察", roman: ["kousatu", "kosatsu"] },
  24: { kanji: "結論", roman: ["keturonn", "ketsuronn"] },
  28: { kanji: "参考文献", roman: ["sankoubunkenn", "sannkoubunnkenn"] },
};

// ランダムに選ばれる単語リスト
const randomWords = [
  { kanji: "超伝導", roman: ["tyoudendou", "choudendou"] },
  { kanji: "量子力学", roman: ["ryousirikigaku", "ryoushirikigaku"] },
  { kanji: "人工知能", roman: ["jinkoutinou", "jinkouchinou"] },
  { kanji: "機械学習", roman: ["kikaigakusyuu", "kikaigakushuu"] },
  { kanji: "深層学習", roman: ["sinsougakusyuu", "shinsougakushuu"] },
];

// 現在の問題番号
let currentQuestionIndex = 1;

// 現在の正解数
let correctCount = 0;

// タイマー
let timeLeft = 600;
let timerInterval;

// タイマーを停止する関数
const stopTimer = () => {
  if (timerInterval) {
    clearInterval(timerInterval);
    timerInterval = null;
  }
  // 残り時間をスコアとして保存
  TYRANO.kag.variable.sf.score = timeLeft; // ティラノスクリプトの変数にスコアを保存
};

// テキストボックスにフォーカスを当てる
const focusInput = () => $('#user_input').focus();

// 出題リストを作成
const createQuestionList = () => {
  const questionList = [];
  const randomPool = [...randomWords]; // ランダム単語のコピー

  for (let i = 1; i <= 30; i++) {
    if (fixedWords[i]) {
      questionList.push(fixedWords[i]); // 固定単語を追加
    } else {
      // ランダム単語を選択
      const randomIndex = Math.floor(Math.random() * randomPool.length);
      questionList.push(randomPool.splice(randomIndex, 1)[0]); // ランダムに選んで削除
      if (randomPool.length === 0) randomPool.push(...randomWords); // ランダムプールを補充
    }
  }

  return questionList;
};

// 問題リストを生成
const questionList = createQuestionList();

// 現在の問題
let currentWord;

// 次の問題を選ぶ関数
const selectNextWord = () => {
  if (currentQuestionIndex > questionList.length) {
    stopTimer();
    TYRANO.kag.ftag.startTag("jump", { target: "*clear" }); // ゲームクリア
    return;
  }

  currentWord = questionList[currentQuestionIndex - 1]; // 現在の問題を更新
  currentRomanCandidate = currentWord.roman[0]; // デフォルト候補を設定
  $('#display_word').text(currentWord.kanji); // 日本語を表示
  $('#display_roman').text(currentRomanCandidate); // ローマ字を表示
  $('#user_input').val(""); // 入力欄をクリア
  $('#colored_input').html(""); // 色分け結果をクリア
  $('#error_message').css('visibility', 'hidden').css('opacity', 0); // エラーメッセージを非表示

  currentQuestionIndex += 1; // 問題番号を進める
};

// タイマーを開始する関数
const startTimer = () => {
  timerInterval = setInterval(() => {
    timeLeft -= 1;
    $('#timer').text(`残り時間: ${timeLeft}秒`);
    if (timeLeft <= 0) {
      stopTimer();
      alert("時間切れです！");
      TYRANO.kag.ftag.startTag("jump", { target: "*timeout" });
    }
  }, 1000);
};

// 初期化処理
$(document).ready(() => {
  currentWord = null;
  selectNextWord();
  focusInput();
  startTimer();
});

// 正解数を更新する関数
const updateScore = () => {
  correctCount += 1;
  $('#score').text(`正解数: ${correctCount} / 30`);
};

// 入力エラーハンドリング（文字数制限）
$('#user_input').on('keydown', function (e) {
  const userInput = $(this).val();
  const maxRomanLength = Math.max(...currentWord.roman.map((r) => r.length)); // 最大文字数
  const errorMessage = $('#error_message'); // エラーメッセージエリア

  if (userInput.length >= maxRomanLength && e.key !== 'Backspace') {
    e.preventDefault(); // 入力を無効化
    errorMessage.text("これ以上は入力出来ません");
    errorMessage.css('visibility', 'visible').css('opacity', 1); // 表示
  } else {
    errorMessage.css('visibility', 'hidden').css('opacity', 0); // 非表示
  }
});

// リアルタイムで入力をチェック
$('#user_input').on('input', function () {
  const userInput = $(this).val(); // ユーザーの入力値を取得
  const coloredInputDiv = $('#colored_input'); // 色分け結果を表示するエリア
  const errorMessage = $('#error_message'); // エラーメッセージエリア

  // 入力が正常な場合、エラーメッセージを非表示
  errorMessage.css('visibility', 'hidden').css('opacity', 0);

  // 入力が現在の候補に一致しない場合、別解をチェック
  if (!currentRomanCandidate.startsWith(userInput)) {
    const alternateRoman = currentWord.roman.find((r) => r.startsWith(userInput));
    if (alternateRoman) {
      currentRomanCandidate = alternateRoman; // 表示候補を変更
      $('#display_roman').text(currentRomanCandidate); // 表示を更新
    }
  }

  let coloredHTML = "";

  for (let i = 0; i < currentRomanCandidate.length; i++) {
    if (i < userInput.length) {
      coloredHTML += userInput[i] === currentRomanCandidate[i]
        ? `<span style="color: green;">${userInput[i]}</span>`
        : `<span style="color: red;">${userInput[i]}</span>`;
    } else if (i === userInput.length) {
      coloredHTML += `<span style="color: blue; text-decoration: underline;">${currentRomanCandidate[i]}</span>`;
    } else {
      coloredHTML += `<span style="color: gray;">${currentRomanCandidate[i]}</span>`;
    }
  }

  coloredInputDiv.html(coloredHTML);

  // 正解した場合の処理
  if (currentWord.roman.some((r) => r === userInput)) {
    updateScore();
    selectNextWord();
    focusInput();
  }
});
[endscript]
[s]


*clear
[cm]
@layopt layer=message0 visible=true
終わった！締め切りまでにレポートを書き上げた！[l][r]
まだあと[emb exp="sf.score"]秒残ってる！[p]
[call target=*correct]


*timeout
[cm]
@layopt layer=message0 visible=true
あぁ、遅レポが確定してしまった...[p]
[call target=*correct]


*correct
[cm]
@layopt layer=message0 visible=true
テスト終了[p]


[layopt layer="0" visible=true]
[image storage="folder1/icon1.png" layer="0" x="540" y="300" name="icon1" time="100" width="100" height="100" ]

[wait time=200]
[cm]

サブルーチンを呼び出します。[l][r]

[call target=*subroutine]

サブルーチンを呼び出しました。[p]
[call target=*body]


*subroutine

これはサブルーチンです。[l][r]

クリックをすると呼び出し元に戻ります。[p]

[return]


*body
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
[button graphic="icon1.png" target=*tag_1 width=100 height=100]
[button x=300 y=200 graphic="icon2.png" target=*tag_2 width=100 height=100]
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
