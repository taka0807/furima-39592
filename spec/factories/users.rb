FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    last_name             { "さとう" }
		first_name            { "たろう" }
		furigana_last_name    {'タナカ'}
		furigana_first_name   {'タロウ'}
		birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
# 実際に保存される内容を記載する。last_name とhurigana_lastは英語表記,Fakerを使用してしまっていた。


# 最終課題はemailだけFakerを導入すれば良い

# FactoryBot.define do
#   factory :user do
#     nickname              {'test'}
#     email                 {'test@example'}
#     password              {'000000'}
#     password_confirmation {'000000'}
# 		last_name             {'aaaaa'}
# 		first_name            {'aaaaa'}
# 		furigana_last_name    {'aaaaa'}
# 		furigana_first_name   {'aaaaa'}
# 		birthday              {'2022-08-02'}
#   end
# end