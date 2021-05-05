10.times do |i|
  Post.create(titre: "Post numéro #{i}",
              description: "Description bidon numéro #{i}",
              published: false,
              published_at: rand(1..10).days.ago)
end