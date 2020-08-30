// 各項目が空ならsubmitボタンが押せない
$(document).on('turbolinks:load', function(){
  $("#submit").on("click", function () {
    if ($('.preview_image_box').length === 0 ) {
      alert("画像を1枚以上入力してください！");
      $(this).focus();
      return false;
    }
    if ($(".titlename").val() === "") {
      alert("商品名を入力してください！");
      $(this).focus();
      return false;
    }
    if ($(".explanation").val() === "") {
      alert("説明を入力してください！");
      $(this).focus();
      return false;
    }
    if ($(".category_0").val() === "") {
      alert("カテゴリーを選択してください！");
      $(this).focus();
      return false;
    }
    if ($(".category_1").val() === "") {
      alert("サブカテゴリー１を選択してください！");
      $(this).focus();
      return false;
    }
    if ($(".category_2").val() === "") {
      alert("サブカテゴリー２を選択してください！");
      $(this).focus();
      return false;
    }
    if ($(".condition").val() === "yyy") {
      alert("商品の状態を選択してください！");
      $(this).focus();
      return false;
    }
    if ($(".shipping_pay").val() === "") {
      alert("配送料の負担を選択してください！");
      $(this).focus();
      return false;
    }
    if ($(".shipping_area").val() === "xxx") {
      alert("発送元の地域を選択してください！");
      $(this).focus();
      return false;
    }
    if ($(".shipping_period").val() === "") {
      alert("発送までの日数を選択してください！");
      $(this).focus();
      return false;
    }
    if ($(".price").val() === "") {
      alert("販売価格を入力してください！");
      $(this).focus();
      return false;
    }
  });
});  