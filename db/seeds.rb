# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者
Admin.create(email: 'admin@admin', password: 'adminadmin')

# 利用シーン
Scene.create(name: 'デート', image: File.open('./app/assets/images/scenes/date.jpg'))
Scene.create(name: '一人旅', image: File.open('./app/assets/images/scenes/traveling_alone.jpg'))
Scene.create(name: '家族旅行', image: File.open('./app/assets/images/scenes/family_trip.jpg'))
Scene.create(name: 'ドライブ', image: File.open('./app/assets/images/scenes/drive.jpg'))

# ジャンル

# テーマパーク・レジャーランド
genre1_child_array = ['遊び', '学び', '体験', '食べ物']
genre1_grandchild_array = [['屋外', '屋内'], ['屋外', '屋内'], ['屋外', '屋内'], ['屋外', '屋内']]

parent = Genre.create(name: 'テーマパーク・レジャーランド', image: File.open('./app/assets/images/genres/theme_park.jpg'))
genre1_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  genre1_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 動物園・水族館
genre2_child_array = ['動物園', '水族館', '植物園']
genre2_grandchild_array = [['屋外', '屋内'], ['屋外', '屋内'], ['屋外', '屋内']]

parent = Genre.create(name: '動物園・水族館', image: File.open('./app/assets/images/genres/leisure_land.jpg'))
genre2_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  genre2_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 景観
genre3_child_array = ['山', '海', 'その他']
genre3_grandchild_array = [['昼', '夜'], ['昼', '夜'], ['昼', '夜']]

parent = Genre.create(name: '景観', image: File.open('./app/assets/images/genres/landscape.jpg'))
genre3_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  genre3_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 社寺
genre4_child_array = ['神宮', '神社', '寺院']

parent = Genre.create(name: '社寺', image: File.open('./app/assets/images/genres/shrine.jpg'))
genre4_child_array.each do |child|
  child = parent.children.create(name: child)
end

# 温泉
genre5_child_array = ['温泉', '銭湯', '足湯']
genre5_grandchild_array = [['屋外', '屋内'], ['屋外', '屋内'], ['屋外', '屋内']]

parent = Genre.create(name: '温泉', image: File.open('./app/assets/images/genres/hot_spring.jpg'))
genre5_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  genre5_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 公園・庭園
genre6_child_array = ['公園', '庭園']

parent = Genre.create(name: '公園・庭園', image: File.open('./app/assets/images/genres/garden.jpg'))
genre6_child_array.each do |child|
  child = parent.children.create(name: child)
end

# アウトドア
genre7_child_array = ['キャンプ場', 'バーベキュー場',  'スキー場', 'ゴルフ場', 'ハイキングコース', 'サイクリングコース']

parent = Genre.create(name: 'アウトドア', image: File.open('./app/assets/images/genres/outdoor.jpg'))
genre7_child_array.each do |child|
  child = parent.children.create(name: child)
end

# ショッピング
genre8_child_array = ['屋外', '屋内']

parent = Genre.create(name: 'ショッピング', image: File.open('./app/assets/images/genres/shopping.jpg'))
genre8_child_array.each do |child|
  child = parent.children.create(name: child)
end

# その他
genre9_child_array = ['城', '建造物', '祭り', 'その他']

parent = Genre.create(name: 'その他', image: File.open('./app/assets/images/genres/other.jpg'))
genre9_child_array.each do |child|
  child = parent.children.create(name: child)
end
