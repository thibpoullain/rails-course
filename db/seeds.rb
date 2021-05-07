Author.destroy_all
Post.destroy_all

3.times do |i|
  Author.create(email: "author#{i}@test.com", password: 'Azertyuiop')
end

Author.all.each do |author|
  10.times do
    Post.create(titre: "Post du turfu",
                description: "Description que je lirai pas de toute façon j'ai piscine",
                published: false,
                published_at: rand(1..10).days.ago,
                author: author,
                categories: %w(dev ops tech business game).sample)
  end
end