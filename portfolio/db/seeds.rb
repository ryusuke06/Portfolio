# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
Admin.create!(
  email: 'test@test.com',
  password: 'testtest',
  )

Category.create!(
  name:"tests"
  )

Test.create!(
  category_id: "1",
  title: "test",
  caption:"testtesttest",
  disclose: "true"
  )

Detail.create!(
  test_id:"1",
  question:"test１",
  first_answer:"選択肢１",
  second_answer:"選択肢２"
  )

Detail.create!(
  test_id:"1",
  question:"test１ー１",
  first_answer:"選択肢１",
  second_answer:"選択肢２"
  )

Detail.create!(
  test_id:"1",
  question:"test１ー２",
  first_answer:"選択肢１",
  second_answer:"選択肢２"
  )

Detail.create!(
  test_id:"1",
  question:"test１ー１ー１",
  first_answer:"選択肢１",
  second_answer:"選択肢２"
  )

Result.create!(
  test_id:"1",
  title:"test",
  caption:"testtest",
  youtube_url:"https://www.youtube.com/watch?v=rBosauaQUtk",
  pattern:"111"
  )
=end