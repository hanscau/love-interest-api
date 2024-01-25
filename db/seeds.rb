# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Topic.find_or_create_by!(topic:"Pottery", topicImageURL:"https://www.thecrucible.org/wp-content/uploads/2021/12/claypots-g4a085aedc_1920.jpeg")
Topic.find_or_create_by!(topic:"Photography", topicImageURL:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgZGra7-QjZgjVyw4GuUCGM9-JbdXcGmfLUA&usqp=CAU")
Topic.find_or_create_by!(topic:"Cooking", topicImageURL:"https://www.foodandwine.com/thmb/O2ZjV3L_cNcz258bkrDgrYPanD0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/What-Is-Chaos-Cooking-TikToks-Latest-Obsession-FT-BLOG0723-be130eb8cffe400eb13ccfbe47de733a.jpg")
Topic.find_or_create_by!(topic:"Dancing", topicImageURL:"https://static.vecteezy.com/system/resources/previews/009/373/613/non_2x/abstract-banner-design-with-silhouettes-of-people-dancing-free-vector.jpg")

Topic.find_or_create_by!(topic:"Gaming", topicImageURL:"https://www.ubp.com/files/live/sites/ubp/files/image/banner_newsroom/200124_Vignette_Web_Detail.jpg")
Topic.find_or_create_by!(topic:"Gym", topicImageURL:"https://www.coinstreet.org/sites/default/files/styles/banner_image/public/2023-06/Colombo%20centre%20gym%20weights.jpg?itok=Fh89o5ZM")
Topic.find_or_create_by!(topic:"Programming", topicImageURL:"https://ecampusontario.pressbooks.pub/app/uploads/sites/2109/2021/11/programming-gb0e197598_1920.jpg")
Topic.find_or_create_by!(topic:"Flowers", topicImageURL:"https://img.freepik.com/free-photo/natures-beauty-captured-colorful-flower-close-up-generative-ai_188544-8593.jpg?size=626&ext=jpg&ga=GA1.1.632798143.1706054400&semt=sph")

Topic.find_or_create_by!(topic:"Food", topicImageURL:"https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg/800px-Good_Food_Display_-_NCI_Visuals_Online.jpg")
Topic.find_or_create_by!(topic:"Movie", topicImageURL:"https://c4.wallpaperflare.com/wallpaper/22/762/507/film-movie-filmmaker-movie-director-wallpaper-preview.jpg")
Topic.find_or_create_by!(topic:"Music", topicImageURL:"https://variety.com/wp-content/uploads/2022/07/Music-Streaming-Wars.jpg?w=1000&h=563&crop=1")
Topic.find_or_create_by!(topic:"Sports", topicImageURL:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1iBbb4momQgc7mrV3sBZbkoyiB2g1VIMQyA&usqp=CAU")
Topic.find_or_create_by!(topic:"Travel", topicImageURL:"https://www.thebeijinger.com/sites/default/files/thebeijinger/blog-images/265699/10-common-travel-mistakes-you-can-avoid.jpg")

