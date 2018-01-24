#$ rails db:reset

#users
user = User.create! :username => 'brockcp', :email => 'brockcp@me.com', :password => 'helloo', :password_confirmation => 'helloo'
user = User.create! :username => 'ocbrock', :email => 'brock@ocwebworks.com', :password => 'helloo', :password_confirmation => 'helloo'
user = User.create! :username => 'gmailbrock', :email => 'brockpatterson@gmail.com', :password => 'helloo', :password_confirmation => 'helloo'
user = User.create! :username => 'elmerfud', :email => 'elmerfud@fudster.com', :password => 'helloo', :password_confirmation => 'helloo'


#posts
post = Post.create! :post_title => 'Would or Could', :post_body => "I am really struggling to understand the differences between would and could", :user_id => 1
post = Post.create! :post_title => '\'What\'s up?\'', :post_body => "A guy walked past me the other day and said \'what\'s up?\' I had no idea what to say. If anyone can answer this I would really appreciate it.", :user_id => 2
post = Post.create! :post_title => 'I Before E Except After C', :post_body => "Can anyone explain the reason or derivation of this rule. It is driving me crazy. If you dont know, then how about a funny made up answer. Anything...", :user_id => 3
post = Post.create! :post_title => 'Why get \'in\' a car but \'on\' a train?', :post_body => "Why do you say \'in\' a car and \'on\' a train. They are both autos, right? That makes no sense.", :user_id => 3


#comments
comment = Comment.create! :comment_body => "Could often means can but in a formal way, whereas could oftens means can\'t.", :post_id => 1, :user_id => 1
comment = Comment.create! :comment_body => "I agree with brockcp. I will vote his answer.", :post_id => 1, :user_id => 2
comment = Comment.create! :comment_body => "I have a different take on this. Suppose...", :post_id => 1, :user_id => 3


puts "Hey, put that trowel down, your DB has been seeded!"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
