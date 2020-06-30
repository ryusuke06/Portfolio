# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#=begin
Admin.create!(
  email: 'test@test.com',
  password: 'testtest',
  )
#=end

#使い方
Category.create!(
  name:"使い方"
  )

Category.create!(
  name:"ソフトウェア"
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
  youtube_url:"https://www.youtube.com/watch?v=y6ischb4cHU",
  patterns:["111"]
  )

Result.create!(
  test_id:"1",
  title:"もしかして全ルート観ようとしてます？",
  caption:"最後の最後にありがとうございます、、でも何も説明できてないのでここで説明します。二者択一の問題を１〜３問続けて最も適した（と思われる）提案をするwebアプリです。
  答え方が違っても同じ結果が出たりします（ちなみに遊び方診断は全４ルートあります）",
  youtube_url:"https://www.youtube.com/watch?v=y6ischb4cHU",
  patterns:["112"]
  )

Result.create!(
  test_id:"1",
  title:"楽しんでいただけましたか？",
  caption:"例えばこの遊び方診断でも全４ルートあったりします。本旨からは逸れますがこっちならどんな答えになるだろうって遊び方もできます！",
  youtube_url:"https://www.youtube.com/watch?v=y6ischb4cHU",
  patterns:["121","122","211","212"]
  )

Result.create!(
  test_id:"1",
  title:"ありがとうございます！！",
  caption:"まっすぐここまで来て頂けたということはもう説明することはありません！ぜひ他の診断も遊んで頂けたら幸いです！！（この遊び方診断は全４ルートあります）",
  youtube_url:"https://www.youtube.com/watch?v=y6ischb4cHU",
  patterns:["22"]
  )

#オンライン飲み会
Test.create!(
  category_id: "2",
  title: "あなたがオンライン飲み会に使うソフトは？",
  caption:"初めてのオンライン飲み会。人数は？時間は？デバイスは？答えていただけるとソフトを提案いたします。
ささっと決めて楽しく飲んでみませんか？",
  disclose: "disclose"
  )

Detail.create!(
  test_id:"2",
  question:"同時に飲む人数は？",
  first_answer:"８人より少ない",
  second_answer:"８人以上"
  )

Detail.create!(
  test_id:"2",
  question:"画質とアカウントを作る必要がない手軽さどっちが大事？（画質は顔が認識できる程度という基準）",
  first_answer:"画質",
  second_answer:"手軽さ"
  )

Detail.create!(
  test_id:"2",
  question:"４０分間/回数無制限になってもバーチャル背景を使ってみたい人はいる？",
  first_answer:"はい！",
  second_answer:"いない！"
  )

Detail.create!(
  test_id:"2",
  question:"使用端末がスマホの人はいる？",
  first_answer:"はい",
  second_answer:"いいえ"
  )

Result.create!(
  test_id:"2",
  title:"Skype",
  caption:"Skypeはmicrosoft社で開発されているソフトです。通信音質に難があったり人によってはアカウントを作る必要があったりしますが時間無制限なので時間を忘れてビデオ通話ができます！ただ飲むだけならこれで決まり！
https://www.skype.com/ja/",
  youtube_url:"https://www.youtube.com/watch?v=y6ischb4cHU",
  patterns:["111","22"]
  )

Result.create!(
  test_id:"2",
  title:"たくのむ",
  caption:"たくのむはアカウントを作らずに7人までであれば無料で参加できます。唯一画質だけは荒いですが他は完璧！他には飲み会専用ツールだけあって出前サービス、バーチャル背景（PCのみ）などがあります。ぜひご活用ください！
https://tacnom.com/",
  youtube_url:"https://www.youtube.com/watch?v=y6ischb4cHU",
  patterns:["12"]
  )

Result.create!(
  test_id:"2",
  title:"LINE",
  caption:"通信音質に難があったりしますが大多数の人がアカウントを持っておりPC版は１２人同時接続可能です！（スマホ版は４人まで）時間無制限なので時間を忘れてビデオ通話ができます！",
  youtube_url:"https://www.youtube.com/watch?v=y6ischb4cHU",
  patterns:["112"]
  )

Result.create!(
  test_id:"2",
  title:"zoom",
  caption:"無料グループ通話は４０分/回数無制限ですが同時１００人接続可能でバーチャル背景も使えます！音質も良く安定してます！アカウントは主催者だけでOK!
https://zoom.us/",
  youtube_url:"https://www.youtube.com/watch?v=y6ischb4cHU",
  patterns:["21"]
  )
#=end
