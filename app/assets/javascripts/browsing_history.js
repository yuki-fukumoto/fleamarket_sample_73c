;(function() {
  $(document).on("turbolinks:load", function() {
    let item = "",
      itmes = "",
      split = [];
    // item.nameで商品名称を取得
    item = "#{{@item.name}}";
    // Cookieからproduct_namesに関するデータを取得します。
    items = Cookies.get("item_names");
    // undefinedでなければデータがproduct_nameに入っている。
    if (items != undefined) {
      items = items + "," + item;
      split = items.split(",");
      // 重複を除去します。
      dup = split.filter(function(a, c, b) {
        return b.indexOf(a) === c;
      });
      Cookies.set("item_names", dup.join(","));
    } else {
      Cookies.set("item_names", item);
    }
  });
}.call(this));