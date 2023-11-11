FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password}
    password_confirmation {password}
		last_name             { Faker::Name.last_name }
		first_name            { Faker::Name.first_name }
		furigana_last_name    {'aaaaa'}
		furigana_first_name   {'aaaaa'}
		birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end


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