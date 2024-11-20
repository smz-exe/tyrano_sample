// 即時実行関数 (IIFE) を使用
(function () {
    // ランキングデータを取得して表示
    async function fetchAndDisplayRanking() {
        const tableContainer = document.getElementById(
            "ranking-table-container"
        );

        if (!tableContainer) {
            console.error("ranking-table-containerが見つかりません");
            return;
        }

        try {
            console.log("fetchAndDisplayRanking開始");
            const response = await fetch(
                "https://calico-jeweled-stone.glitch.me/leaderboard"
            );
            if (!response.ok) {
                throw new Error("ランキングデータの取得に失敗しました");
            }

            const rankingData = await response.json();

            // leaderboardキーの中身を取得
            const leaderboard = rankingData.leaderboard;

            // データ形式が配列か確認
            if (!Array.isArray(leaderboard)) {
                throw new Error("取得したデータが配列ではありません");
            }

            // テーブルのHTMLを構築
            const tableHTML = `
          <table>
            <thead>
              <tr>
                <th>順位</th>
                <th>プレイヤー名</th>
                <th>スコア</th>
                <th>残り時間</th>
                <th>評価</th>
              </tr>
            </thead>
            <tbody>
              ${leaderboard
                  .map(
                      (player, index) => `
                  <tr>
                    <td>${index + 1}</td>
                    <td>${player.player_name}</td>
                    <td>${player.score}</td>
                    <td>${player.time} 秒</td>
                    <td>${player.grade}</td>
                  </tr>
                `
                  )
                  .join("")}
            </tbody>
          </table>
        `;

            // テーブルを表示
            tableContainer.innerHTML = tableHTML;
        } catch (error) {
            console.error(error);
            tableContainer.innerHTML = `<p class="loading" style="color: red;">ランキングの取得に失敗しました。再読み込みしてください。</p>`;
        }
    }

    // 関数を即時実行
    fetchAndDisplayRanking();
})();
