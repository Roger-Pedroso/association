puts "Destroying existing records..."
User.destroy_all
Debt.destroy_all
Person.destroy_all

User.create email: 'admin@admin.com', password: '111111'

puts "Usuário criado:"
puts "login admin@admin.com"
puts "111111"

50.times do
    User.create!(
      email: Faker::Internet.email,
      password: Faker::Internet.password(min_length: 10, max_length: 20),
      reset_password_token: Faker::Internet.password(min_length: 10, max_length: 20),
    )
  end

user_ids = User.pluck(:id)

100.times do
Person.create!(
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    national_id: CPF.generate,
    active: Faker::Boolean.boolean,
    user_id: user_ids.sample,
 
)
end

person_ids = Person.pluck(:id)

500.times do
Debt.create!(
    person_id: person_ids.sample, 
    amount: Faker::Number.decimal(l_digits: 2),
    observation: Faker::Quotes::Shakespeare.hamlet_quote,
)
end
