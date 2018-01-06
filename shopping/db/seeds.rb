# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Kind.create name: "未分類"
User.create email: "admin@gmail.com", password: "123123", password_confirmation: "123123", name: "張CC", nickname: "張CC", phone: "test", phone_memo: "test", is_admin: true