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
=end

Category.create!(
  name:"使い方"
  )

Test.create!(
  category_id: "1",
  title: "使い方",
  caption:"実際に遊んでみましょう！回答によってで問題が続いたり続かなかったりします！",
  disclose: "disclose"
  )

Detail.create!(
  test_id:"1",
  question:"２択の繰り返しであなたの目的に適したと思われる提案をします（当社比）",
  first_answer:"わからない",
  second_answer:"わかった"
  )

Detail.create!(
  test_id:"1",
  question:"わかったって言って頂けたら次に続きます！",
  first_answer:"わからない",
  second_answer:"わかった！！！"
  )

Detail.create!(
  test_id:"1",
  question:"現在は管理者のみですが問題作成の自由度も高くなるように設計してます。例えば質問の答え方が違っても同じ答えにたどり着いたりします！",
  first_answer:"ほんとに？",
  second_answer:"すごい！"
  )

Detail.create!(
  test_id:"1",
  question:"何も説明できないまま終わりそうです。。。",
  first_answer:"わからない",
  second_answer:"わかった！！！！！！"
  )

Detail.create!(
  test_id:"1",
  question:"現在は管理者のみですが問題作成の自由度も高くなるように設計してます。例えば質問の答え方が違っても同じ答えにたどり着いたりします！",
  first_answer:"わかった！",
  second_answer:"すごい！"
  )

Detail.create!(
  test_id:"1",
  question:"ほんとにほんとです！あと問題数が１〜３問で作れたりします！（数行足せば問題数増やすこともできます）",
  first_answer:"わかった！",
  second_answer:"すごい！"
  )

Result.create!(
  test_id:"1",
  title:"そんなひどい",
  caption:"全部いいえと答えるあなたはRPG全ルートやりこむタイプですね？何も説明できなかったのでここで説明しますと二者択一の問題を１〜３問続けて最も適した（と思われる）提案をするwebアプリです。
  答え方が違っても同じ結果が出たりします（ちなみに遊び方診断は全４ルートあります）",
  youtube_url:"https://youtu.be/pN_MLt0Xv30",
  patterns:["111"]
  )

Result.create!(
  test_id:"1",
  title:"もしかして全ルート観ようとしてます？",
  caption:"最後の最後にありがとうございます、、でも何も説明できてないのでここで説明します。二者択一の問題を１〜３問続けて最も適した（と思われる）提案をするwebアプリです。
  答え方が違っても同じ結果が出たりします（ちなみに遊び方診断は全４ルートあります）",
  youtube_url:"https://youtu.be/pN_MLt0Xv30",
  patterns:["112"]
  )

Result.create!(
  test_id:"1",
  title:"楽しんでいただけましたか？",
  caption:"例えばこの遊び方診断でも全４ルートあったりします。本旨からは逸れますがこっちならどんな答えになるだろうって遊び方もできます！",
  youtube_url:"https://youtu.be/pN_MLt0Xv30",
  patterns:["121","122","211","212"]
  )

Result.create!(
  test_id:"1",
  title:"ありがとうございます！！",
  caption:"まっすぐここまで来て頂けたということはもう説明することはありません！ぜひ他の診断も遊んで頂けたら幸いです！！（この遊び方診断は全４ルートあります）",
  youtube_url:"https://youtu.be/pN_MLt0Xv30",
  patterns:["22"]
  )
#=end