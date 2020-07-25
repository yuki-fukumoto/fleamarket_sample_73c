// DOM読み込みが完了したら実行
document.addEventListener("DOMContentLoaded", (e) => {
  // payjp.jsの初期化
  Payjp.setPublicKey("pk_test_91e3960108d6cf0addff2d8c");

  // ボタンのイベントハンドリング
  const btn = document.getElementById("token");
  // var preventEvent = true;

  btn.addEventListener("click", (e) => {
    e.preventDefault();

    // カード情報生成
    let card = {
      number: document.getElementById("card_number").value,
      cvc: document.getElementById("cvv").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value,
    };

    // トークン生成
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        // 出力（本来はサーバへ送信）
        document.getElementById("card_token").innerHTML = response.card.id;
        $.ajax({
          type: "post",
          url: "/creditcards",
          data: {
            creditcard: {
              card_id: response.card.id,
            },
          },
        });
      }
    });
  });
});
