require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "全属性のバリデーション" do
    let(:item) {FactoryBot.build(:item)}
    subject{item}
    context "すべての情報が入力されている場合" do
      it {is_expected.to be_valid}
    end
  end

  describe "imageのバリデーション" do
    let(:item) {FactoryBot.build(:item, image: image)}
    context "登録される" do
      subject{item}
      context "画像が入力されている" do
        let(:image) {[ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/_test.jpg'), 'spec/factories/_test.jpg') ]}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{item.errors[:image]}
      before do
        item.valid?
      end
      context "画像が１枚も入力されていない" do
        let(:image) {nil}
        it {is_expected.to include("は1枚以上は登録してください")}
      end
    end
  end

  describe "nameのバリデーション" do
    let(:item) {FactoryBot.build(:item, name: name)}
    context "登録される" do
      subject{item}
      context "nameが入力されている" do
        let(:name) {"留魂録"}
        it {is_expected.to be_valid}
      end
      context "文字数が40文字" do
        let(:name) {"萺蔥葆荲ゲ莳ミ蓎薿せ蘇荈E薄蔬蘉蕳荍葎葒藢薓茠藟苉荄菰蓙薐菤藯蓖葒蔢蓆蘕茶萔萠葔"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{item.errors[:name]}
      before do
        item.valid?
      end
      context "nameがない" do
        let(:name) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "文字数が41文字" do
        let(:name) {"薫蕪藧ぉ蘜菈蘑茍蒏は萂蔩茡蓾蔶蘱え荕莁荃茬荊萷萲虊蕊苢蕙萺リ荑ん苊萰莽萼萨ぅ蔹づ蕋"}
        it {is_expected.to include("は40文字以内で入力してください")}
      end
    end
  end

  describe "explanatinoのバリデーション" do
    let(:item) {FactoryBot.build(:item, explanation: explanation)}
    context "登録される" do
      subject{item}
      context "explanationが入力されている" do
        let(:explanation) {"留魂録"}
        it {is_expected.to be_valid}
      end
      context "文字数が1000文字" do
        let(:explanation) {"薳ゴ苝芹蕯蒾み蕉ら蔣萾た薂薘荒莇芈い葾萡艼芅薂蒓蔠葊ャ芝萚蒇薨艹萊艺苾蕾藶藃ス茢莝蔆蘱芖藠M菰蒫蔥蕧荼莜ぽ苉蕷苠A蒦若蓻荐蔑ず莑ね蓥苩葁イ英蔣蔥3茝苄荜ぴ萃j菈葐薨芦茎葰萒芏茳蕦蔽艻H虂芼苣虄ゎ荡蔆芎蓬葹葒蓦茹荨茟虀莉藧薜蓼蕫菠苞萡蘛虇葰5葋葾蒵莻莛葒薸ぃ葹莏芋葁どHf蓨荨芐藪葝萪蘆菓芕た菝萨葜藷蓶芶蓴藖蔀ず蔨も艽苘莚萓蘔蓩a藒茢蔱薔蓳茰茎葚葠蔲B蒉荭萑ウ萙菶葀蓶も蒝藣薥蔑ぽ苈蒴蓱薕芞芻薀莲莠荱萤萧获蕽蔅萔萇茓莚萗茣荓芛蘽茈蘠艼蔖葱藞ヺ虄モ葨ヸ茑莟葜蒔7菙萈蕯蘰ば蔯蕼荇蕬芏莱蘌葮藦葔ス茭菰莧薓ヘヵ2蒶藯苒蒸あ苜ゲチ荚蒫蒹蔼菧藜蔠蘦蓂苢莥ヒ薷茝xぬ蕩葸蕷蔺2荕苖蔘蓛薥蕆藶蔸蒂iC蔉菆萁蒊パ蕋莺藓蒄蕚葇葁苽虃萞藑a萴葭萚蔪薰ソ荖葜董葍薡メ茦蓥蘌芊菧蕉薾の菺蓓芐蓂芣蔷ニば茭荃薽蕔b蔶蓣a蕉薣萒菽萸萴ウ蓅蔀蔌ゆろぃ蓇蔫J蘦萍薴菓菰萶蘮蕰藰い蕶菊蒇菟蓝ァ蓤蔺ゅ藬も虁蒟蓍藵莽xぇ蘎蕙萧ィグガせチ蕎蔯苾x芵芇芰薞花苯蘵蕡t菚薸芀莡萔か薦蕪荶薢蒠薡薷蒆ロ蒜葎蓍荜茑苿ズ蒷蒍芦苺藗莢づ葴蘇虌し藗菍荅藞苄薥蘉葁蔁葁蒩藉若蓫莣i薚薵蘢葃ほ藶蓐蘠虋荏グ蔫蒌莥ウス蔤ぴ蕐营茻荎苫蓥茣Gざ萒艾け蘲荇苗董菙葚虈蓄苠荊ラ荠莱蔙蒳ん蔦茱莕苛茞蘴虅薉ェ藃荸茶ハだ莈蔞薵蒻葉蕺苵蓨藃蘁苲ろ藂9c茰蕶菇苑萹莌蒩萗の蔑A苚藸莽萯ズ芇デ苄ェヨ蒇蒏薻菾苰ら蓹萸蔍オ苕茾蓈ゥ葹荌T薆芪蘨茒虁薀菡菀そ蓃芟蓚菵薤苂苨蒟菫蒓wヅ茫る蔙蒾荑苜葮蕠荦苗萔葎萨蔑蕟蕸菂シ薞芧ぇり虇ぷ蓌蕍薿蓊荍菰菟虀蒏f蒣葼蒞しユ菸荤莚莏蘴薜蘜菬蒫蒒蔫ガ蔒藐荺茊わぱ虇ノ蔩ウ苹蓳茳芓莡あ蘏lす蒐7k蔿茕蒽蔻蒜グ芰ョけ芑薓蘿蓦蕺ハペ芼蓣荅虆芀葸蓚莄ケ葦T芁葮ョ薊芦ぢニみ蒇蕗芍蘝ヺ蔁ゾ藚萹茇蕹ダ蔪菅べ茍葋藳菉ス葔菁菳葇蔩茪蓡ぶミ藤苢薜茫蓖蕽菉荸蔲菆蒘g蕧蔞荦蓌っ葺蒻薬菢ぽ芅薹薖9蕞ぐ葳蒄c蔓茿蔇菟虈薇药コ莖ス蕨葰葥ユ荐ヹ蕅苉芻ヨ莉芿苎蘢苼菤L荂苨葷蕃薋荸葋葹荔葶uァ芚苮薸菧蒵藲d茚芕べ葽かぃ蕝蕓芏Q薔蓕艺蔬萬蒗ぅ莜葰萁蘅菘莉荕蘯藥苪苷苣モ蒞茕荲プぇよ苾蘑蕫蓨菩菒藘蓷て莻J苊葭蔣蕌葓薢蕕蘧蒐葟蓹薺Z荟苘芬蘞菀蒹茻虂蔮蒝薵さ茋荖芪莌菕ベ蒚蕦茗葮藣蒾荱蒦蘿ビ芊蒇萟艿芪で艺菮f菡蓀蕁葵蘋葬ヲ蕇フ荔蔌萂葇蕐f节p蔡蓏ん菢ヶ蘧萼莋菠藻rx芜苁i蕭茺蓎蒼藢荇虈苄薃蒤苧蒼セ萌蔯薾フラ虉藮k藶蔌菤ラ蔳菃蔄薊荖リ蘸萝芍蓃蕜莳苺蔟荟蓬蒖蓥菌萻蔍蘔莛蔶蕉蔔蒧葒荷8蔱荨蘌ゐシ蒁蓩藣よ"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{item.errors[:explanation]}
      before do
        item.valid?
      end
      context "explanationがない" do
        let(:explanation) {nil}
        it {is_expected.to include("が空欄です")}
      end
      context "文字数が1001文字" do
        let(:explanation) {"薚莯蕠葶萧蕅蘜藪蓜萊蓋萊苸蕸蔠菜ュ薁葂蔱蘼ロ苭菿菧菐Z菀茜蔡蓋エ虊莡蒯莢莿テ菧菫蔮蔊菐蘆葆葶荜虅み蘧莐芠蓾2タ蘑萄菀ざ苡菊茻茠蒒萊蒅艼ゎノ茸ず蒣荀苦茚芁蒫蒥ピ蒶薙荖薛茦ェ藗よ萦薘菮ハ荄蓾菆芡葡蓁茏苙蔂荋薪蔧蘞菓u萛ゑ芻芊芞u萊荭蔥虈菝葨菕蒥ぎ藡蔺芊蒼へ蓌ごg萠蘤茈莴茴荅蔋芸蘗蓦萚薯菞薷蘁蕙范蔳萩蓞ガ萡藖萡芖蒛カ葹荿蒢ァ葙ち蓦藱蕩ヅ茪ぎ荲艺芤萡蒏蓡蔿藐荚苤蔡葹ほ苇ゲ蔡茕苫菧蒸萋ぱ蓺莒茳蔨菺キ菌菔芮葼菝ッ葓ど茛藲そ薙蓭菮蘴芐蒥薻获蓝薪蘠茆菔蕷芵萿莁蕢苫蘸虆荄茙茪荦莵葫蓆ぱ葯蕬荾し蔲蕦荚莑だ葧荼し茤荍萶じ苫蕌む茴萆ヨ虄ミ蓌薸葋荴蒢莡菑葕薘ゲ蘗芯葔蘧葴蕬ヌ葛苫苝蕼艽蘗萹ね蓃薣茣荇ゑら蒰蕣菬蓁蔔荅P蘛9藠葈苢艸蓗h蒯荪菿蔙菕蘆蘮6蔲蘏茵e葧蔧莽J蕺ウ莆芙ん蕔苞虅蕰荐蒩藑荙菁さ蘭蓄ヹラ蘍葕シ苙茱V藐蕛茄艹蒏Q菲蘏ょ蓳ザB茭ヨ莎莋7茣藚藬蓚ず蓉蓄蔣蕓藟カぶ藸茱菃蘪茹莡蓙蘝蓁蓙芞蔘薦苽藲蘷蓮茹葾萕蕓蒯葸菋芕菒蒎虈葷ね莴蔖蔰芖つ菲菥蘰m蔔荞落莫K蓠薢虋蘳び萴萵ケ葄蘄莋莶葦オ蔥蔻芦薹蘂藅蓻蘄蕥蕫菭蔌ペヌ蒰薕若マsそ薩薤菞苉芹ジ蘘芈ぁ苃蔕蔶芣ざ茊茾蕜芫r荛茛蓥茯蕠荟蕣茩蘲蘅萷蔚茉藝茱ラ荑蔀苽藨萼蔰蕌荛ヮ蓥莩蓽苃蒾ィ茟莃w蓥F菅芃萮ぽ芮蔃蒠茑荧9葘荕蒒薺范シ莾葺蓹蓎菔茊荴苔蔍h蔿茲藯ヹプ菱苠艹苙菠ぷ蔥a菤芟苫ヹ荢萷菊萠芟茛薞蕈蓈萹艻藃ィ苆藼莇ヴま萁虄莖ぎ葆蒪苓董藘茀蕽n薢芟莡菶芮っ萿萪芑茩蓈蓔茬莄蔃藅蒡薗蕙茕ニ虇菤萫莄蓁蘴蘗蔎もゕ菋蕜蘊虌Q蔣莝莖芋茨茨薻茨茰蔏c葝蓌蓬蔣苂荄蓷蘤蕋藴荋葜薃う莖蓼虇荽葏づ蘥蕘蓥菰藷荡蒛だ荖し蔹薁せ蘏ズ芭蓳ギ薜茈葓萱苷茂苘Q5蘀葠藠萸萾苁萳艾蔉蒻蘂萂フ苾0蒔蒞藁萳藫蕝e蒤薲プ蘇莳莲荻茙莠ミ菟萐莾タZ藿蔉2ぢ藝菅蕎藹蒂葖葚d蘫藿芆薋9蕺ブ葢莴蓠蘢を蕵ぞ芝お苽藊荛芄キ薝蔴蘿蓇蕮菀葓葕茬虁蔦蔭菅芰キ蓆に藨ヹぉ薰蕹葵メ薪か芮薄薬蕞茢7茒ヴ蓵ぃ藈蓚荿菏薤荝蒨ヂべ蕨萿蘣蔩芤荡ん莎蓲苷莢芽パぜ蓫芐若薸芧薽蕷蘆葕菚蓨苇つ蕉蓚萎萫ヰ葴さ藛薺WB蘚菣菠蘒葼蒦萦葸ゲ虉茩1蕮荈藆蘠蒛L蕽薊萻蕆芠萄蘞莐蓇ゔ菨菡蒁若苶蔲萳蘦薬蔭藏荗萟q茲藃莍蕾レ萇莅芙藰苟萃菚薒蓈蔎蓓藺葰菱蔁べ荒s蘟蔥莹蕚菐藏茣蘸藡茊苓葬葛萒菷萼萩蕍び薳蔺薨蓷ポ蔵藩L蓃菓茱E蒮薃萃蓲菻萝茥蕱萅蒾蘬蓢范萦蕋藙藉荖蘞荜蒘蓃葫荸蓜蘛菵萅芯蓌苼菶蓡茫菢藄莙ト萠萶莯茊蒋蘤蕿茾薯薕菕蘌茿M萖苅茚芯葼芝荩菝苌茟荞蘾ヴ薲藺Mマ蘄葨ゾ蒧莚茮茑"}
        it {is_expected.to include("は1000文字以内で入力してください")}
      end
    end
  end

  describe "categoryのバリデーション" do
    let(:item) {FactoryBot.build(:item, category_id: category_id)}
    category = FactoryBot.create(:category)
    context "登録される" do
      subject{item}
      context "categoryが入力されている" do
        let(:category_id) {category.id}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{item.errors[:category_id]}
      before do
        item.valid?
      end
      context "categoryが入力されていない" do
        let(:category_id) {nil}
        it {is_expected.to include("は少なくともメイングループから1つ選択してください")}
      end
    end
  end

  describe "conditionのバリデーション" do
    let(:item) {FactoryBot.build(:item, condition: condition)}
    context "登録される" do
      subject{item}
      context "conditionが入力されている" do
        let(:condition) {"bit_damaged"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{item.errors[:condition]}
      before do
        item.valid?
      end
      context "conditionが空欄である" do
        let(:condition) {nil}
        it {is_expected.to include("が空欄です：システムエラーのため管理者に連絡してください")}
      end
      context "conditionが選択されていない" do
        let(:condition) {"yyy"}
        it {is_expected.to include("が選択されていません")}
      end
    end
  end
  describe "shipping_areaのバリデーション" do
    let(:item) {FactoryBot.build(:item, shipping_area: shipping_area)}
    context "登録される" do
      subject{item}
      context "shipping_areaが入力されている" do
        let(:shipping_area) {"yamaguchi"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{item.errors[:shipping_area]}
      before do
        item.valid?
      end
      context "shipping_areaが空欄である" do
        let(:shipping_area) {nil}
        it {is_expected.to include("が空欄です：システムエラーのため管理者に連絡してください")}
      end
      context "shipping_areaが選択されていない" do
        let(:shipping_area) {"xxx"}
        it {is_expected.to include("が選択されていません")}
      end
    end
  end
  describe "shipping_payのバリデーション" do
    let(:item) {FactoryBot.build(:item, shipping_pay: shipping_pay)}
    context "登録される" do
      subject{item}
      context "shipping_payが入力されている" do
        let(:shipping_pay) {"customer"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{item.errors[:shipping_pay]}
      before do
        item.valid?
      end
      context "shipping_payが入力されていない" do
        let(:shipping_pay) {nil}
        it {is_expected.to include("が空欄です：システムエラーのため管理者に連絡してください")}
      end
    end
  end

  describe "priceのバリデーション" do
    let(:item) {FactoryBot.build(:item, price: price)}
    context "登録される" do
      subject{item}
      context "価格が300" do
        let(:price) {"300"}
        it {is_expected.to be_valid}
      end
      context "価格が9,999,999" do
        let(:price) {"9999999"}
        it {is_expected.to be_valid}
      end
    end
    context "登録されない" do
      subject{item.errors[:price]}
      before do
        item.valid?
      end
      context "priceがない" do
        let(:price) {nil}
        it {is_expected.to include("を入力してください")}
      end
      context "価格が299" do
        let(:price) {"299"}
        it {is_expected.to include("価格は¥300~9,999,999の範囲で設定してください")}
      end
      context "価格が10,000,000" do
        let(:price) {"10000000"}
        it {is_expected.to include("価格は¥300~9,999,999の範囲で設定してください")}
      end
    end
  end

  describe "brandのバリデーション" do
    let(:item) {FactoryBot.build(:item, brand_id: brand_id)}
    context "登録される" do
      subject{item}
      context "brandが入力されていない" do
        let(:brand_id) {nil}
        it {is_expected.to be_valid}
      end
    end
  end

  describe '#search' do

    before do
      # @item             = build(:item)
      # @item.save
      # @other_item       = build(:other_item)
      # @other_item.save
      @item = FactoryBot.create(:item, name: "バッグ")
      @other_item = FactoryBot.create(:item, name: "かばん")
    end

    # "バッグ"で検索した場合
    it "@itemが検索結果に出てくること" do
      expect(Item.search("バッグ")).to include(@item)
    end

    it "@other_itemが検索結果に出てこないこと" do
      expect(Item.search("バッグ")).to_not include(@other_item)
    end

    # # "カバン"で検索した場合
    it "検索結果がないこと" do
      expect(Item.search("カバン")).to be_empty
    end

    # # 検索していない場合
    it "検索ワードがない場合、全レコードを出力すること" do
      expect(Item.search("")).to include(@item, @other_item)
    end
  end
end
