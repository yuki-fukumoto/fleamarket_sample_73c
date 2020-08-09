$(document).on("turbolinks:load", function () {
  // When selected main category, this method start.
  $(document).on("change", ".category_0", function () {
    // $(".form_category").eq(2).remove();
    // $(".form_category").eq(1).remove();

    var ancestry = $(this).find("option:selected").val();
    $.ajax({
      type: "get",
      url: "/categories/get_child",
      data: {
        ancestry: ancestry,
      },
      dataType: "json",
    }).done(function (categories) {
      var html = "";
      var htmlPrompt = "";

      if (categories.length == 0) {
        html = `<option value>メインカテゴリを選んでください</option>`;
        htmlPrompt = `<option value>メインカテゴリを選んでください</option>`;
      } else {
        html = `<option value>サブカテゴリ1を選ぶ</option>`;

        // html += `<div class="container category_1__container"><div class="title"></div><div class="column form_category"><select name="item[category_id]" id="item[category_id]" class="category_1 text_box"><option value="${ancestry}">サブカテゴリを選ぶ</option>`;

        $.each(categories, function (i, category) {
          html += `<option value="${category.id}" ancestry="${category.ancestry}">${category.name}</option>`;
        });
        htmlPrompt = `<option value>サブカテゴリ1を選んでください</option>`;
      }

      // if (categories.length() == 0) {
      //   `<option value>メインカテゴリを選んでください</option>`;
      // } else {
      // }
      // html += `</select></div></div>`;
      $(".category_1").empty();
      $(".category_2").empty();
      $(".category_1").append(html);
      $(".category_2").append(htmlPrompt);
      // $(".form_category").eq(1).hide().fadeIn(300);
    });
  });

  // When selected sub category, this method start.
  $(document).on("change", ".category_1", function () {
    // $(".form_category").eq(2).remove();
    var ancestry =
      $(this).find("option:selected").attr("ancestry") +
      "/" +
      $(this).find("option:selected").val();

    $.ajax({
      type: "get",
      url: "/categories/get_child",
      data: {
        ancestry: ancestry,
      },
      dataType: "json",
    }).done(function (categories) {
      var html = "";
      html = `<option value>サブカテゴリ2を選ぶ</option>`;

      if (categories.length == 0) {
        html = `<option value>サブカテゴリ1を選んでください</option>`;
        htmlPrompt = `<option value>サブカテゴリ1を選んでください</option>`;
      } else {
        html = `<option value>サブカテゴリ2を選ぶ</option>`;

        // html += `<div class="container category_2__container"><div class="title"></div><div class="column form_category"><select name="item[category_id]" id="item[category_id]" class="category_1 text_box"><option value="${ancestry}">サブカテゴリを選ぶ</option>`;

        $.each(categories, function (i, category) {
          html += `<option value="${category.id}" ancestry="${category.ancestry}">${category.name}</option>`;
        });
      }

      // html += `</select></div></div>`;
      $(".category_2").empty();
      $(".category_2").append(html);
      // $(".form_category").eq(2).hide().fadeIn(300);
    });
  });
});
