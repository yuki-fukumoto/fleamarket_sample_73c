$(document).on("turbolinks:load", function () {
  $("input[type=file]").change(function () {
    $(".img").html("");
    $(".image_message").remove();

    var files = $(this).prop("files");

    var image_count = 1;
    var file_type = ["image/jpeg", "image/jpg", "image/png", "image/gif"];
    var img_message = `<div class="image_message">画像を変更する</div>`;
    $(".image_upload").append(img_message);

    $(files).each(function (i, file) {
      if (image_count > 5) {
        return false;
      }
      if (file && file_type.indexOf(file.type) == -1) {
        alert("保存できない形式のファイルが含まれています");
        $(this).val("");
        $(".img");
        return;
      }

      var reader = new FileReader();
      reader.readAsDataURL(file);

      var img_src = `<img width="200" height="200">`;

      reader.onload = function () {
        img_src = `<img src="${reader.result}" class="image_area">`;
        $(".img").append(img_src);
      };

      image_count = image_count + 1;
    });
  });
  $("#submit").on("click", function () {
    if ($(".blind").val() === "") {
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
    console.log($(".category_0").val() === "");
    if ($(".condition").val() === "yyy") {
      alert("コンディションを選択してください！");
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
