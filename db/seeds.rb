# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@exam.com",password: "adminpass")

occupations = Occupation.create!([
  {name: "学生(デザイン系)"},
  {name: "学生(非デザイン系)"},
  {name: "会社員(デザイン系)"},
  {name: "会社員(非デザイン系)"},
  {name: "プロ"},
  {name: "その他"}
  ])

category_media = CategoryMedium.create!([
  {name: "絵画"},
  [name: "デジタル"],
  {name: "写真"},
  [name: "彫刻・立体"]
  ])

category_motifs = CategoryMotif.create!([
  {name: "人物"},
  [name: "建物"],
  {name: "自然"},
  [name: "動物"]
  ])

category_styles = CategoryStyle.create!([
  {name: "ソロ"},
  [name: "チーム"],
  [name: "コラボ"]
  ])

users = User.create!([
  {category_medium_id: 1, occupation_id: 1, name: "たつや", email: "aa@exam.com", password: "aaaaaa", telephone_number: "11111111111",
   address: 1, introduction: "大学で絵画を専攻しています。", member_status: 1, display_status: true, valid_status: true,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_1.png")), filename: "user_1.png", content_type: "image/jpeg")},

  {category_medium_id: 2, occupation_id: 2, name: "涼太", email: "bb@exam.com", password: "bbbbbb", telephone_number: "22222222222",
   address: 2, introduction: "大学で経済学を学んでいます。", member_status: 1, display_status: false, valid_status: true,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_2.png")), filename: "user_2.png", content_type: "image/jpeg")},

  {category_medium_id: 3, occupation_id: 3, name: "みゆき", email: "cc@exam.com", password: "cccccc", telephone_number: "33333333333",
   address: 3, introduction: "Webデザイン会社に勤めています。", member_status: 1, display_status: true, valid_status: false,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_3.png")), filename: "user_3.png", content_type: "image/jpeg")},

  {category_medium_id: 2, occupation_id: 2, name: "あらた", email: "dd@exam.com", password: "dddddd", telephone_number: "44444444444",
   address: 4, introduction: "高校生です。", member_status: 1, display_status: true, valid_status: true,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_4.png")), filename: "user_4.png", content_type: "image/jpeg")},

  {category_medium_id: 3, occupation_id: 3, name: "正人", email: "ee@exam.com", password: "eeeeee", telephone_number: "55555555555",
   address: 5, introduction: "イラストレーターをしています。", member_status: 1, display_status: true, valid_status: true,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_5.png")), filename: "user_5.png", content_type: "image/jpeg")},

  {category_medium_id: 4, occupation_id: 4, name: "あきと", email: "ff@exam.com", password: "ffffff", telephone_number: "66666666666",
   address: 6, introduction: "飲食関連の営業をしています。", member_status: 1, display_status: true, valid_status: true,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_6.png")), filename: "user_6.png", content_type: "image/jpeg")},
  ])

posts = Post.create!([
  {user_id: 1, category_medium_id: 1, category_motif_id: 3, category_style_id: 1, title: "テスト投稿（1）",introduction: "テスト投稿（1）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_1.jpg")), filename: "post_1.jpg", content_type: "image/jpeg")},

  {user_id: 2, category_medium_id: 2, category_motif_id: 2, category_style_id: 2, title: "テスト投稿（2）",introduction: "テスト投稿（2）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_2.png")), filename: "post_2.png", content_type: "image/jpeg")},

  {user_id: 3, category_medium_id: 3, category_motif_id: 3, category_style_id: 3, title: "テスト投稿（3）",introduction: "テスト投稿（3）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_3.jpg")), filename: "post_3.jpg", content_type: "image/jpeg")},

  {user_id: 4, category_medium_id: 2, category_motif_id: 2, category_style_id: 2, title: "テスト投稿（4）",introduction: "テスト投稿（4）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_4.png")), filename: "post_4.png", content_type: "image/jpeg")},

  {user_id: 5, category_medium_id: 3, category_motif_id: 3, category_style_id: 3, title: "テスト投稿（5）",introduction: "テスト投稿（5）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_5.jpg")), filename: "post_5.jpg", content_type: "image/jpeg")},

  {user_id: 1, category_medium_id: 1, category_motif_id: 2, category_style_id: 3, title: "テスト投稿（6）",introduction: "テスト投稿（6）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_6.jpg")), filename: "post_6.jpg", content_type: "image/jpeg")}
  ])