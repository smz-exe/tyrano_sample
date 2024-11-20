[loadcss file="./data/others/css/styles.css"]

*start
[cm]

[html name=container]
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ランキングページ</title>
</head>
<body>
  <div class="ranking-container">
    <h1>ランキング</h1>
    <div id="ranking-table-container">
      <p class="loading">ランキングを読み込んでいます...(20秒ほど時間がかかる場合があります)</p>
    </div>
    <button onclick="TYRANO.kag.ftag.startTag('jump',{storage:'first.ks', target: '*title'})"
            class="back-button">
      戻る
    </button>
  </div>
  <script src="./data/others/ranking.js"></script>
</body>
</html>
[endhtml]

