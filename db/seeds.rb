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
  {category_medium_id: 1, occupation_id: 1, name: "テストユーザ（1）", email: "aa@exam.com", password: "aaaaaa", telephone_number: "11111111111",
   address: 1, introduction: "テストユーザ（1）の自己紹介文になります。", member_status: 1, display_status: true, valid_status: true,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_1.png")), filename: "user_1.png", content_type: "image/jpeg")},
  
  {category_medium_id: 2, occupation_id: 2, name: "テストユーザ（2）", email: "bb@exam.com", password: "bbbbbb", telephone_number: "22222222222",
   address: 2, introduction: "テストユーザ（2）の自己紹介文になります。", member_status: 1, display_status: false, valid_status: true,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_2.png")), filename: "user_2.png", content_type: "image/jpeg")},
  
  {category_medium_id: 3, occupation_id: 3, name: "テストユーザ（3）", email: "cc@exam.com", password: "cccccc", telephone_number: "33333333333",
   address: 3, introduction: "テストユーザ（3）の自己紹介文になります。", member_status: 1, display_status: true, valid_status: false,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_3.png")), filename: "user_3.png", content_type: "image/jpeg")}
  
  {category_medium_id: 2, occupation_id: 2, name: "テストユーザ（4）", email: "dd@exam.com", password: "dddddd", telephone_number: "44444444444",
   address: 4, introduction: "テストユーザ（4）の自己紹介文になります。", member_status: 1, display_status: true, valid_status: true,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_4.png")), filename: "user_4.png", content_type: "image/jpeg")},
   
  {category_medium_id: 3, occupation_id: 3, name: "テストユーザ（5）", email: "ee@exam.com", password: "eeeeee", telephone_number: "55555555555",
   address: 5, introduction: "テストユーザ（5）の自己紹介文になります。", member_status: 1, display_status: true, valid_status: true,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_5.png")), filename: "user_5.png", content_type: "image/jpeg")},
   
  {category_medium_id: 4, occupation_id: 4, name: "テストユーザ（6）", email: "ff@exam.com", password: "ffffff", telephone_number: "66666666666",
   address: 6, introduction: "テストユーザ（6）の自己紹介文になります。", member_status: 1, display_status: true, valid_status: true,
   icon: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/user_6.png")), filename: "user_6.png", content_type: "image/jpeg")},
  ])

posts = Post.create!([
  {user_id: 1, category_medium_id: 1, category_motif_id: 1, category_style_id: 1, title: "テスト投稿（1）",introduction: "テスト投稿（1）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_1.jpeg")), filename: "post_1.jpeg", content_type: "image/jpeg")},
  
  {user_id: 2, category_medium_id: 2, category_motif_id: 2, category_style_id: 2, title: "テスト投稿（2）",introduction: "テスト投稿（2）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_2.jpeg")), filename: "post_2.jpeg", content_type: "image/jpeg")},
  
  {user_id: 3, category_medium_id: 3, category_motif_id: 3, category_style_id: 3, title: "テスト投稿（3）",introduction: "テスト投稿（3）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_3.jpeg")), filename: "post_3.jpeg", content_type: "image/jpeg")},
  
  {user_id: 4, category_medium_id: 2, category_motif_id: 2, category_style_id: 2, title: "テスト投稿（4）",introduction: "テスト投稿（4）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_4.jpeg")), filename: "post_4.jpeg", content_type: "image/jpeg")},
  
  {user_id: 5, category_medium_id: 3, category_motif_id: 3, category_style_id: 3, title: "テスト投稿（5）",introduction: "テスト投稿（5）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_5.jpeg")), filename: "post_5.jpeg", content_type: "image/jpeg")},
  
  {user_id: 1, category_medium_id: 1, category_motif_id: 2, category_style_id: 3, title: "テスト投稿（6）",introduction: "テスト投稿（6）の紹介文になります。", display_status: true,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/post_6.jpeg")), filename: "post_6.jpeg", content_type: "image/jpeg")}
  ])