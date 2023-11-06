10.times do
  User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: '12345678',
      password_confirmation: '12345678'
  )
end

5.times do |index|
  Stub.create!(
      user: User.offset(rand(User.count)).first,
      title: "タイトル#{index}",
      memo: "メモ#{index}",
      category: Category.offset(rand(Category.count)).first,
      public: rand(2).even?
  )
end