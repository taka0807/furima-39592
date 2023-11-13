FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password}
    password_confirmation {password}
		# last_name             { 'AAAAA' }
		# first_name            { 'AAAAA' }
    last_name             { "さとう" }
		first_name            { "たろう" }
		furigana_last_name    {'タナカ'}
		furigana_first_name   {'タロウ'}
    # furigana_last_name    {Faker::furigana_last_name}
		# furigana_first_name   {Faker::furigana_first_name}
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