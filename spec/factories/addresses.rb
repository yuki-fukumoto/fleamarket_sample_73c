FactoryBot.define do
  factory :address do
    firstname {"吉田"}
    lastname {"松蔭"}
    firstname_read {"よしだ"}
    lastname_read {"しょういん"}
    first_zip {"758"}
    last_zip{"0011"}
    prefecture {"山口県"}
    city {"萩市"}
    address_line {"椿東1537"}
    building {"松陰神社"}
    room {"102"}
    first_telephone {"010"}
    second_telephone {"2345"}
    third_telephone {"6789"}
    association :user
  end
end
