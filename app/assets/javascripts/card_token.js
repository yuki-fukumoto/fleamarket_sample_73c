// DOM読み込みが完了したら実行
document.addEventListener("DOMContentLoaded", (e) => {
  Payjp.setPublicKey("pk_test_91e3960108d6cf0addff2d8c");

  // ボタンのイベントハンドリング
  const btn = $("#token");
  // var preventEvent = true;

  $("#new_creditcard").on("submit", function (e) {
    e.preventDefault();

    // カード情報生成
    let card = {
      number: document.getElementById("card_number").value,
      cvc: document.getElementById("cvv").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value,
    };

    console.log(card);

    // トークン生成
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        $.ajax({
          type: "post",
          url: "/creditcards",
          data: {
            creditcard: {
              token: response.id,
            },
          },
        });
      } else {
        $.ajax({
          type: "post",
          url: "/creditcards",
          data: {
            creditcard: {
              token: response.id,
            },
          },
          dataType: "json",
        }).done(function () {
          $("#token").prop("disabled", false);
          $(".notice").empty();
          $(".notice").append("クレジットカードの登録に失敗しました");
        });
      }
    });
  });
});
