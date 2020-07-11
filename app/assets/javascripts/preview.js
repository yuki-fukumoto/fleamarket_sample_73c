$(document).on("turbolinks:load", function () {
  $("input[type=file]").change(function () {
    $(".img").html("");
    var files = $(this).prop("files");

    var image_count = 1;
    var file_type = ["image/jpeg", "image/jpg", "image/png", "image/gif"];

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
        img_src = `<img src="${reader.result}" width="200" height="200">`;
        $(".img").append(img_src);
      };

      image_count = image_count;
    });
  });
});
