task :default => :publish

desc "Publish my blog."
task :publish do
  puts "publishing your article(s)..."
  `ruby termblr.rb`
  puts "Posted!!"
end

desc "Create Markdown file"
task :new_post do
  puts "crate new post"
  post_ext = 'md'
  today = Time.now.strftime('%Y-%m-%d')
  filename = "./memo/#{today}.#{post_ext}"
  open(filename, 'w') do |post|
    post.puts "## やったこと"
    post.puts "※やったこと"
    post.puts "## Keep"
    post.puts "※良かったこと"
    post.puts "## Problem"
    post.puts "※注意すること"
    post.puts "## Try"
    post.puts "※次回やること"
  end
end
