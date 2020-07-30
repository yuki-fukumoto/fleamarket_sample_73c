$(document).on("turbolinks:load", function () {
  $(function () {
    // 1枚目の小画像をアクティブに変更
    $(".thumbnails").first().addClass("active"); 
    // 小画像にマウスが乗ればイベント発火
    $('.thumbnails').mouseover(function () { 
      // マウスが乗った画像のPATHを取得
      image_url = $(this).attr("src"); 
      // メイン画像をマウスが乗った画像に変更
      $(".main_image").attr("src", image_url).hide().fadeIn(); 
      // 1枚目の小画像のアクティブを無効化
      $(".thumbnails.active").removeClass("active");
      // マウスが乗った小画像をアクティブに変更 
      $(this).parent().addClass("active"); 
    });
  });
})


