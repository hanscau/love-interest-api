bin/rails g scaffold User firstName:string lastName:string username:string password:string bio:text gender:integer phoneNo:string profileImageURL:string --force

bin/rails g scaffold Topic topic:string topicImageURL:string --force

bin/rails g scaffold Post user:references topic:references title:string tags:string contentType:integer content:text contentImageURL:string --force

bin/rails g scaffold Comment user:references post:references commentText:text --force

bin/rails g scaffold Reply user:references comment:references replyText:text --force

bin/rails g scaffold PostLike user:references post:references --force

bin/rails g scaffold CommentLike user:references comment:references --force

bin/rails g scaffold ReplyLike user:references reply:references --force

bin/rails g scaffold InterestRelation user:references user:references --force