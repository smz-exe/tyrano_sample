*start

; Setting
[title name="AM8:58"]
@hidemenubutton
[start_keyconfig]
[loadcss file="./data/others/css/styles.css"]

;メッセージウィンドウの設定
[position layer=message0 left=160 top=500 width=1000 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="30" marginl="50" marginr="70" marginb="60"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true


; タイトル画面
*title
[cm]
[wait time=200]
@layopt layer=message0 visible=false

;背景画像の設定
[image layer="base" page=fore storage="Background.png" width="1280" height="720"]
[image layer=1 storage="Title.png" visible=true top=285 left=366 width=548 height=150 ]
;ボタンの設定
[button x=130 y=576 graphic="StoryButton.png" target=*first width=300 height=66]
[button x=490 y=576 graphic="WriteButton2.png" target=*rule width=300 height=66]
[button x=850 y=576 graphic="RankingButton.png" target=*ranking width=300 height=66]
[s]


*ranking
[cm]
[freeimage layer=1]
@jump storage=ranking.ks target=*start

; ゲーム開始
*first
[cm]
[freeimage layer=1]


;背景画像の設定
[bg layer="base" storage="bg_white.png" time="100"]

@layopt layer=message0 visible=true
[wait time=200]

(目覚ましの音が聞こえる)[l][r]
あぁ、久しぶりによく寝れた。[l][r]
こんなにも気持ちのいい朝はいつぶりだろう。[p]

. . . . .[l][r]
何か大事なことを忘れている気がする。[l][r]

@layopt layer=1 visible=true
[mtext text="ざわ･･" layer=1 x="200" y="100" size="70" in_effect="fadeIn" time="0" color="black" edge="0xffffff" wait="false"]
[mtext text="ざわ････" layer=1 x="700" y="150" size="80" in_effect="fadeIn" time="10" color="black" edge="0xffffff" wait="false"]
[mtext text="ざわ･･･" layer=1 x="140" y="300" size="50" in_effect="fadeIn" time="30" color="black" edge="0xffffff" wait="false"]
[mtext text="ざわ･･" layer=1 x="900" y="350" size="90" in_effect="fadeIn" time="50" color="black" edge="0xffffff" ]

ん〜、何だろう。この感覚は、[p]

. . . . .[l][r]
まぁ、一旦気にしないことにしよう。[l][r]
よっぽど大事なことなら、後で思い出すだろう。[p]

とりあえず"K-LLM"のダッシュボードでも見て、今日やるべき課題でも確認するか。[p]

[image layer=1 storage=LoginPage.png visible=true width=960 height=624 x=160 y=96 time=500]

まずは、ログインしよう。[p]

@layopt layer=message0 visible=false

[button graphic="LoginButton.png" target=*DashBoard width=210 height=53 x=535 y=473]
[s]

*DashBoard
[cm]
[camera x=0 y=0 time=0]
[image layer=1 storage=DashBoard.png visible=true width=960 height=624 x=160 y=96 time=200]

@layopt layer=message0 visible=true

[wait time=100]

. . . . . . . . . . . . . . .[p]

@layopt layer=message0 visible=false

[layermode_movie video="concentration-line03-bk.mp4" width=640 height=360]
[camera layer=1 wait=false zoom=2 x=360 y=50 ease_type=ease-in time=400]

@layopt layer=message0 visible=true

[font size=36]
いや、朝9時締め切りの実験レポートあるんだけど!?[l][r]
完全に忘れてたぁぁ[p]
[resetfont]

[free_layermode time=400]
[camera layer=1 zoom=1 x=0 y=0 time=400]
[reset_camera]

いや、待てよ。[l][r]
まだ間に合うかもしれない。[l][r]
今何時だっけ？[p]
. . . . . . . . . . . . . . .[p]

@layopt layer=message0 visible=false

[camera layer=1 wait=false zoom=2 x=360 y=-300 ease_type=ease-in time=400]
[layermode_movie video="concentration-line03-bk.mp4" width=640 height=360]

@layopt layer=message0 visible=true

[font size=36]
いや、今8:58なんだけど!?[l][r]
締め切りまであと2分しかないんだけど！?[p]
[resetfont]

[free_layermode time=400]
[camera layer=1 zoom=1 x=0 y=0 time=400]
[reset_camera]

. . . . .[l][r]
まずは、冷静にならないと。[p]

自分のタイピングスピードには自信がある。[l][r]
「諦めたらそこで試合終了」って誰かも言ってたし。[l][r]
今からでもワンチャンあるかもしれない。[p]

よし、レポートを書き上げるぞ！[l][r]
[jump target=*rule]
[s]

*rule
[cm]
@layopt layer=message0 visible=false
[image layer=1 storage=Rule.png visible=true width=1280 height=720 time=400]

[button graphic="WriteButton.png" target=*report width=236 height=62 x=650 y=550]

[s]

*report
[cm]
[freeimage layer=1]
@layopt layer=message0 visible=false

[html name=container]
<!-- 画面中央にタイマーとランダムな単語を出題 -->
<div id="content">
  <p id="timer">残り時間: 120秒</p>
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
  { kanji: "完全導電性", roman: ["kanzendoudensei","kanzenndoudensei"] },
  { kanji: "相転移現象", roman: ["soutennigenshou","soutennigennshou","soutennigensyou","soutennigennsyou"] },
  { kanji: "マイスナー効果", roman: ["maisuna-kouka"] },
  { kanji: "完全反磁性", roman: ["kanzenhanjisei","kannzennhannjisei","kanzenhanzisei","kannzennhannzisei"] },
  { kanji: "侵入深さ", roman: ["sinnnyuuhukasa","shinnnyuufukasa"] },
  { kanji: "渦糸構造", roman: ["uzuitokouzou"] },
  { kanji: "磁束量子", roman: ["jisokuryoushi","jisokuryousi"] },
  { kanji: "磁束のピン止め", roman: ["jisokunopindome","jisokunopinndome"] },
  { kanji: "ゼロ磁場冷却", roman: ["zerojibareikyaku"] },
  { kanji: "磁場中冷却", roman: ["jibatyuureikyaku","jibachuureikyaku"] },
  { kanji: "強誘電体", roman: ["kyouyuudentai"] },
  { kanji: "チタン酸バリウム", roman: ["titansanbariumu","chitannsannbariumu"] },
  { kanji: "ペロブスカイト構造", roman: ["perobusukaitokouzou"] },
  { kanji: "ランダウの現象論", roman: ["randaunogenshouronn","randaunogensyouron"] },
  { kanji: "光ファイバ", roman: ["hikarifaiba"] },
  { kanji: "マルチモードファイバ", roman: ["marutimo-dofaiba", "maruchimo-dofaiba"] },
  { kanji: "シングルモードファイバ", roman: ["singurumo-dofaiba", "shingurumo-dofaiba"] },
  { kanji: "伝送損失", roman: ["densousonsitu","densousonshitsu"] },
  { kanji: "散乱損失", roman: ["sanransonsitu","sanransonshitsu","sannrannsonnsitu","sannrannsonnshitsu"] },
  { kanji: "吸収損失", roman: ["kyuushuusonshitsu","kyuusyuusonsitu"] },
  { kanji: "モード分散", roman: ["mo-dobunsann", "mo-dobunnsann"] },
  { kanji: "フーリエ変換", roman: ["fu-riehenkann", "fu-riehennkann","hu-riehenkann","hu-riehennkann"] },
  { kanji: "アナログデジタル変換", roman: ["anarogudejitaruhenkann","anarogudejitaruhennkann","anarogudezitaruhenkann","anarogudezitaruhennkann"] },
  { kanji: "デジタルアナログ変換", roman: ["dejitaruanaroguhenkann","dejitaruanaroguhennkann","dezitaruanaroguhenkann","dezitaruanaroguhennkann"] },
  { kanji: "標本化定理", roman: ["hyouhonkateiri","hyouhonnkateiri"] },
  { kanji: "パワースペクトル", roman: ["pawa-supekutoru"] },
  { kanji: "サンプルホールド回路", roman: ["sanpuruho-rudokairo","sannpuruho-rudokairo"] },
];

// 現在の問題番号
let currentQuestionIndex = 1;

// 現在の正解数
let correctCount = 0;

// タイマー
let timeLeft = 120;
let timerInterval;

// レポートのスコア、および評価を計算する関数
const calculateGrade = () => {
  TYRANO.kag.variable.sf.score = TYRANO.kag.variable.sf.lefttime * 200; // スコア計算
  const leftTime = TYRANO.kag.variable.sf.lefttime;

  // 残り時間に応じた評価
  if (leftTime >= 51) {
    TYRANO.kag.variable.sf.grade = "S";
  } else if (leftTime >= 31) {
    TYRANO.kag.variable.sf.grade = "A";
  } else if (leftTime >= 11) {
    TYRANO.kag.variable.sf.grade = "B";
  } else {
    TYRANO.kag.variable.sf.grade = "C";
  }
};

// タイマーを停止する関数
const stopTimer = () => {
  if (timerInterval) {
    clearInterval(timerInterval);
    timerInterval = null;
  }
  // 残り時間をスコアとして保存
  TYRANO.kag.variable.sf.lefttime = timeLeft;
  calculateGrade(); // スコアと評価を計算
};

// テキストボックスにフォーカスを当てる
const focusInput = () => $('#user_input').focus();

// 出題リストを作成
const createQuestionList = () => {
  const questionList = [];
  const randomPool = [...randomWords]; // ランダム単語のコピー

  for (let i = 1; i <= 2; i++) {
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
終わった！締め切りまでにレポートを書き上げた！[p]
まだあと[emb exp="sf.lefttime"]秒残ってる！[l][r]
スコアは[emb exp="sf.score"]だ！[l][r]
評価は[emb exp="sf.grade"]だ！[p]

@layopt layer=message0 visible=false

[html name=container]
<div style="width: auto; margin: 20px auto; padding: 20px; border: 2px solid #333; border-radius: 10px; background-color: #f5f5f5;">
  <h1 style="text-align: center; color: #4caf50;">実験レポート フィードバック</h1>
  <p style="font-size: 18px; line-height: 1.6; color: #333;">
    実験レポートお疲れ様でした。<br>
    締め切りまでの残り時間は、 <strong style="color: #ff5722;">[emb exp="sf.lefttime"] 秒</strong> でした。<br>
    スコアは <strong style="color: #2196f3;">[emb exp="sf.score"]</strong> です。
  </p>
  <h2 style="text-align: center; color: #673ab7;">実験レポート評価: <span style="font-size: 28px; font-weight: bold; color: #e91e63;">[emb exp="sf.grade"]</span></h2>
  <hr style="margin: 20px 0; border: none; border-top: 2px solid #ccc;">

  <!-- ランキング登録フォーム -->
  <div style="text-align: center; margin-top: 20px;">
    <p style="font-size: 16px; color: #555;">ランキングに登録するにはプレイヤー名を入力してください:</p>
    <input type="text" id="player_name" placeholder="プレイヤー名を入力" style="font-size: 18px; padding: 5px; width: 80%; max-width: 300px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 5px;">
    <button onclick="submitScore()"
            style="background-color: #2196f3; color: white; font-size: 18px; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
      ランキングに登録
    </button>
    <p id="submission_status" style="font-size: 16px; color: green; display: none; margin-top: 10px;">スコアが登録されました！</p>
  </div>

  <!-- 戻るボタン -->
  <div style="text-align: center; margin-top: 20px;">
    <button onclick="TYRANO.kag.ftag.startTag('jump', {target: '*end'})"
            style="background-color: #4caf50; color: white; font-size: 18px; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
      戻る
    </button>
  </div>
</div>

<script>
function submitScore() {
  const playerName = document.getElementById("player_name").value.trim();
  const score = TYRANO.kag.variable.sf.score;
  const time = TYRANO.kag.variable.sf.lefttime;
  const grade = TYRANO.kag.variable.sf.grade;
  const statusMessage = document.getElementById("submission_status");

  if (!playerName) {
    alert("プレイヤー名を入力してください！");
    return;
  }

  fetch("https://calico-jeweled-stone.glitch.me/result", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      player_name: playerName,
      score: score,
      time: time,
      grade: grade
    })
  })
    .then(response => {
      if (response.ok) {
        statusMessage.style.color = "green";
        statusMessage.textContent = "スコアが登録されました！";
        statusMessage.style.display = "block";
      } else {
        throw new Error("スコアの登録に失敗しました。");
      }
    })
    .catch(error => {
      console.error(error);
      statusMessage.style.color = "red";
      statusMessage.textContent = "スコアの登録に失敗しました。";
      statusMessage.style.display = "block";
    });
}
</script>
[endhtml]
[s]


*end
[cm]
@layopt layer=message0 visible=true
無事レポートを提出できた。[l][r]
一安心だ。[l][r]
【 GOOD END 】[p]

[jump target=*start]
[s]



*timeout
[cm]
@layopt layer=message0 visible=true
(時計は9:00を指している)[l][r]
時間切れだ...[l][r]
あぁ、遅レポが確定してしまった...[p]

自分のタイピングスピードを過信するのはもうやめよう。[l][r]
何事も計画的に進める、そう心に誓った。[p]

【 BAD END 】[l][r]

[button graphic="RetryButton.png" target=*rule width=236 height=62 x=335 y=400]
[button graphic="RestartButton.png" target=*start width=236 height=62 x=760 y=400]

[s]




