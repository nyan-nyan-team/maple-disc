# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.create!(
    artist_name: '加藤ミリヤ'
)

Genre.create!(
    genre_name: 'POP'
)

Label.create!(
    label_name: 'avex'
)

Product.create!(
    artist_id: 1,
    genre_id: 1,
    label_id: 1,
    title: 'タイトルだよ',
    amount: '金額だよ',
    status: 'ステータスだよ',
    release: '発売日だよ',
    explanation: '曲の説明とか'
)

EndUser.create!(
    last_name: 'ラスト',
    first_name: 'ファストネーム',
    last_name_kana: 'ラストかな',
    first_name_kana: 'ファストかな',
    main_postal_code: '333333',
    main_address: 'メイン県メイン市テスト333',
    phone_number: '09033333333',
    password: 'ramen0141',
    email: 'ramen0141@test'
)

CartProduct.create!(
    end_user_id: 1,
    product_id: 1,
    quantity: '5'
)