$(document).on("turbolinks:load", function () {

  var count = $(".js-text").text().replace(/\n/g, "改行").length;
  var now_count = 150 - count;
  if (count > 150) {
    $(".js-text-count").css("color", "red");
  }
  $(".js-text-count").text("残り" + now_count + "文字");

  $(".js-text").on("keyup", function () {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 150 - count;

    if (count > 150) {
      $(".js-text-count").css("color", "red");
    } else {
      $(".js-text-count").css("color", "black");
    }
    $(".js-text-count").text("残り" + now_count + "文字");
  });
});