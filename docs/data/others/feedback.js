// ランキングスコアを登録
function submitScore() {
    const playerNameInput = document.getElementById("player_name");
    const submitButton = document.getElementById("submit_button");
    const statusMessage = document.getElementById("submission_status");

    const playerName = playerNameInput.value.trim();
    const score = TYRANO.kag.variable.sf.score;
    const time = TYRANO.kag.variable.sf.lefttime;
    const grade = TYRANO.kag.variable.sf.grade;

    if (!playerName) {
        alert("プレイヤー名を入力してください！");
        return;
    }

    // ボタンを無効化し、状態を「登録中」に変更
    submitButton.disabled = true;
    submitButton.textContent = "登録中...";
    statusMessage.style.color = "gray";
    statusMessage.style.display = "block";
    statusMessage.textContent =
        "20秒ほど時間が掛かる場合があります。お待ちください。";

    // フェッチで非同期リクエストを送信
    fetch("https://calico-jeweled-stone.glitch.me/result", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            player_name: playerName,
            score: score,
            time: time,
            grade: grade,
        }),
    })
        .then(function (response) {
            if (response.ok) {
                // 登録成功時
                statusMessage.textContent = "ランキングに登録済です！";
                statusMessage.style.color = "red";
                statusMessage.style.display = "block";

                // ボタンの状態を変更し再押下不可に
                submitButton.textContent = "ランキング登録済";
                submitButton.disabled = true;
            } else {
                throw new Error("スコアの登録に失敗しました。");
            }
        })
        .catch(function (error) {
            console.error(error);

            // エラーメッセージ表示
            statusMessage.textContent = "スコアの登録に失敗しました。";
            statusMessage.style.color = "red";
            statusMessage.style.display = "block";

            // ボタンを再度有効化
            submitButton.disabled = false;
            submitButton.textContent = "ランキングに登録";
        });
}

// イベントリスナーを登録
document.addEventListener("DOMContentLoaded", function () {
    const submitButton = document.getElementById("submit_button");
    if (submitButton) {
        submitButton.addEventListener("click", submitScore);
    }
});
