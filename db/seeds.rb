# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!({
#   email: 'admin@example.com',
#   password: 'password',
#   password_confirmation: 'password'}
# )

User.create!(
  [
    {
      id:1,
      email: 'yume@otoko',
      password: 'yumeotoko',
      password_confirmation: 'yumeotoko',
      name: '夢男'
    },
    {
      id:2,
      email: 'yume@onnna',
      password: 'yumeonnna',
      password_confirmation: 'yumeonnna',
      name: '夢女'
    },
    {
      id:3,
      email: 'eiga@otoko',
      password: 'eigaotoko',
      password_confirmation: 'eigaotoko',
      name: '映画男'
    },
    {
      id:4,
      email: 'eiga@onnna',
      password: 'eigaonnna',
      password_confirmation: 'eigaonnna',
      name: '映画女'
    }
  ]
)

Dream.create!(
  [
    {
      user_id: '1',
      emotion: '楽しい',
      title: '初夢',
      body: '一富士、二鷹、三茄子',
      start_time: DateTime.strptime('01/01/2021 10:00', '%m/%d/%Y %H:%M')
    },
    {
      user_id: '2',
      emotion: '楽しい',
      title: '初夢',
      body: '四扇、五煙草、六座頭',
      start_time: DateTime.strptime('01/01/2021 11:00', '%m/%d/%Y %H:%M')
    },
    {
      user_id: '3',
      emotion: '嫌気',
      title: '主人公',
      body: '映画の主人公になっていた。だが私は気づいていた、主人公になれたのは父親のコネだということに。',
      start_time: DateTime.strptime('01/02/2021 12:00', '%m/%d/%Y %H:%M')
    },
    {
      user_id: '4',
      emotion: '悲しい',
      title: 'ヒロイン',
      body: 'ヒロインになる夢をみた。だがそれは悲劇のヒロインだった。',
      start_time: DateTime.strptime('01/03/2021 13:00', '%m/%d/%Y %H:%M')
    },
    {
      user_id: '1',
      emotion: '恐い',
      title: '悪夢',
      body: '気がつくと崖に立っていて次の瞬間落ちてしまった。そこで目が覚めた。',
      start_time: DateTime.strptime('01/04/2021 14:00', '%m/%d/%Y %H:%M')
    },
    {
      user_id: '2',
      emotion: '怒り',
      title: 'イライラ',
      body: '高校の同級生と喧嘩をしていた。何度も言い合いをして腹立たしい夢だった。',
      start_time: DateTime.strptime('01/05/2021 15:00', '%m/%d/%Y %H:%M')
    },
    {
      user_id: '3',
      emotion: '楽しい',
      title: 'インタビュー',
      body: '気がつくとマイクを持っていて映画で特に思い入れのあるシーンについて聞かれていた。',
      start_time: DateTime.strptime('01/06/2021 16:00', '%m/%d/%Y %H:%M')
    },
    {
      user_id: '4',
      emotion: '楽しい',
      title: 'レッドカーペット',
      body: '東京国際映画祭に招かれてレッドカーペットイベントを体験していた。',
      start_time: DateTime.strptime('01/07/2021 17:00', '%m/%d/%Y %H:%M')
    },
    {
      user_id: '1',
      emotion: '楽しい',
      title: '空を飛ぶ',
      body: '時計が逆回りしていて夢だと気づいた。今ならできると思い空を飛ぶことができた。',
      start_time: DateTime.strptime('01/08/2021 18:00', '%m/%d/%Y %H:%M')
    },
    {
      user_id: '2',
      emotion: '楽しい',
      title: '部活',
      body: '高校時代の友人達と部活動をしている夢で、懐かしくて楽しかった。',
      start_time: DateTime.strptime('01/09/2021 19:00', '%m/%d/%Y %H:%M')
    },
    {
      user_id: '3',
      emotion: '楽しい',
      title: '新人賞',
      body: '主演映画の作品で新人賞を獲得して嬉しかった。',
      start_time: DateTime.strptime('01/10/2021 20:00', '%m/%d/%Y %H:%M')
    }
  ]
)
