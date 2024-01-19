bin/rails g scaffold User firstName:string lastName:string username:string password:string bio:text gender:integer phoneNo:string profileImageURL:string --force

bin/rails g scaffold Topic topic:string topicImageURL:string --force

bin/rails g scaffold Post user:references topic:references title:string tags:string contentType:integer content:text contentImageURL:string --force
