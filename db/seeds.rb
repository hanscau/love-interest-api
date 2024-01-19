# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.find_or_create_by!(firstName:"Bob",
            lastName:"Smith",
            username:"bobsmith",
            bio:"I am a person",
            gender:0,
            phoneNo:"1234567890",
            profileImageURL:"https://api.dicebear.com/7.x/big-ears/png?seed=Cleo")

User.find_or_create_by!(firstName:"Alice",
            lastName:"Johnson",
            username:"alicejohnson",
            bio:"I love coding",
            gender:1,
            phoneNo:"0987654321",
            profileImageURL:"https://api.dicebear.com/7.x/big-ears/png?seed=Alex")

User.find_or_create_by!(firstName:"John",
            lastName:"Doe",
            username:"johndoe",
            bio:"I am a software engineer",
            gender:0,
            phoneNo:"9876543210",
            profileImageURL:"https://api.dicebear.com/7.x/big-ears/png?seed=Max")

User.find_or_create_by!(firstName:"Emma",
            lastName:"Smith",
            username:"emmasmith",
            bio:"I love reading",
            gender:1,
            phoneNo:"0123456789",
            profileImageURL:"https://api.dicebear.com/7.x/big-ears/png?seed=Lily")

Topic.find_or_create_by!(topic:"Pottery", topicImageURL:"https://picsum.photos/800/300")
Topic.find_or_create_by!(topic:"Photography", topicImageURL:"https://picsum.photos/800/300")
Topic.find_or_create_by!(topic:"Cooking", topicImageURL:"https://picsum.photos/800/300")
Topic.find_or_create_by!(topic:"Dancing", topicImageURL:"https://picsum.photos/800/300")

Post.find_or_create_by!(title:"Pottery for beginners", 
                        tags:"#pottery#beginner",
                        contentType: 0,
                        content:"This is a post about pottery", 
                        contentImageURL:"", 
                        topic_id:1, 
                        user_id:1) 

Post.find_or_create_by!(title:"Photography tips", 
                        tags:"#photography#tips",
                        contentType: 0,
                        content:"Here are some photography tips", 
                        contentImageURL:"", 
                        topic_id:2, 
                        user_id:2) 

Post.find_or_create_by!(title:"Delicious recipes", 
                        tags:"#cooking#recipes",
                        contentType: 1,
                        content:"Check out these delicious recipes", 
                        contentImageURL:"https://picsum.photos/800/300", 
                        topic_id:3, 
                        user_id:3) 

Post.find_or_create_by!(title:"Learn to dance", 
                        tags:"#dancing#learn",
                        contentType: 1,
                        content:"Join our dance classes and learn to dance", 
                        contentImageURL:"https://picsum.photos/800/300", 
                        topic_id:4, 
                        user_id:4) 

Post.find_or_create_by!(title:"Pottery techniques", 
                        tags:"#pottery#techniques",
                        contentType: 1,
                        content:"Learn advanced pottery techniques", 
                        contentImageURL:"https://picsum.photos/800/300", 
                        topic_id:1, 
                        user_id:1) 
  