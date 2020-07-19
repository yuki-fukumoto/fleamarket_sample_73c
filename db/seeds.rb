# Category.create(name: "シャワーヘッドz")
# Category.create(name: "浴槽")
# toilet = Category.create(name: "便器")
# toilet_jap = toilet.children.create(name: "和式")
# toilet_eu = toilet.children.create(name: "洋式")
# toilet_christ = toilet.children.create(name: "ウォシュレット")
# toilet_jap.children.create([{name: "ピンク色"}, {name: "ボットン"}, {name: "水洗"}])
# toilet_eu.children.create([{name: "イギリス"}, {name: "フランス"}, {name: "ドイツ"}])
# toilet_christ.children.create([{name: "ビデ"}, {name: "勢いよく水が出る"}, {name: "人肌"}])

main1 = Category.create(name: "レディース")
  sub1_1 = main1.children.create(name: "トップス")
    sub1_1_1 = sub1_1.children.create(name: "Tシャツ/カットソー(半袖/袖なし)")
    sub1_1_2 = sub1_1.children.create(name: "Tシャツ/カットソー(七分/長袖)")
    sub1_1_3 = sub1_1.children.create(name: "シャツ/ブラウス(半袖/袖なし)")

  sub1_2 = main1.children.create(name: "ジャケット/アウター")
    sub1_2.children.create(name: "テーラードジャケット")
    sub1_2.children.create(name: "ノーカラージャケット")
    sub1_2.children.create(name: "")

  sub1_3 = main1.children.create(name: "パンツ")
    sub1_3.children.create(name: "デニム/ジーンズ")
    sub1_3.children.create(name: "ショートパンツ")
    sub1_3.children.create(name: "カジュアルパンツ")


main2 = Category.create(name: "インテリア・住まい")
  sub2_1 = main2.children.create(name: "キッチン/食器")
    sub2_1.children.create(name: "食器")
    sub2_1.children.create(name: "調理器具")
    sub2_1.children.create(name: "収納/キッチン雑貨")


  sub2_2 = main2.children.create(name: "ベッド/マットレス")
    sub2_2.children.create(name: "")
    sub2_2.children.create(name: "")
    sub2_2.children.create(name: "")


  sub2_3 = main2.children.create(name: "ソファ/ソファベッド")
    sub2_3.children.create(name: "")
    sub2_3.children.create(name: "")
    sub2_3.children.create(name: "")


main3 = Category.create(name: "本・音楽・ゲーム")
  sub3_1 = main3.children.create(name: "本")
    sub3_1.children.create(name: "")
    sub3_1.children.create(name: "")
    sub3_1.children.create(name: "")

  sub3_2 = main3.children.create(name: "漫画")
    sub3_2.children.create(name: "")
    sub3_2.children.create(name: "")
    sub3_2.children.create(name: "")

  sub3_2 = main3.children.create(name: "雑誌")
  sub3_1.children.create(name: "")
  sub3_1.children.create(name: "")
  sub3_1.children.create(name: "")

