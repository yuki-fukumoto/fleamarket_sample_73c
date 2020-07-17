FactoryBot.define do
  factory :user do
    sequence(:id) {|n| n}
    sequence(:email) {|n| "#{n}Shokason@school.com"}
    password {"amerika-ikitai"}
    nickname {"Shoin Yoshida"}
    firstname {"松蔭"}
    lastname {"吉田"}
    firstname_read {"しょういん"}
    lastname_read {"よしだ"}
    birthday {"2000-9-20"}
  end
end
