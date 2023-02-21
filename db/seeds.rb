# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

events = [{:title => "Shooting Star", :description => "Stars will be flying ...",
           :created_at => nil, :updated_at => nil, :happens_at => DateTime.parse("20220817 19:00"),
           :tag => "Star", :optimal_location => "Pikes Peak", :public_bool => true},
          {:title => "Mars Viewing", :description => "Come see Mars on it's ...",
           :created_at => nil, :updated_at => nil, :happens_at => DateTime.parse("20220912 19:00"),
           :tag => "Planet", :optimal_location => "Pikes Peak", :public_bool => true},
          {:title => "Rocket Launching", :description => "Check out a model rocket ...",
           :created_at => nil, :updated_at => nil, :happens_at => DateTime.parse("20221119 13:00"),
           :tag => "Rocket", :optimal_location => "UCCS", :public_bool => true}]

events.each do |event|
  Event.create!(event)
end
