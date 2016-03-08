# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = [{:title => 'Introduction to Programming', :rating => '4/5', :instructor => 'Zain Butt'},
      	  {:title => 'Data Structures', :rating => '4.5/5', :instructor => 'Ozair Asim'},
      	  {:title => 'Discrete Mathematics', :rating => '4.25/5', :instructor => 'Mahnoor Ijaz'},
      	  {:title => 'Algorithms', :rating => '4/5', :instructor => 'Mujtaba Ali Malik'},
      	  {:title => 'Computer Graphics', :rating => '4.4/5', :instructor => 'Fnu Tulha'},
      	  {:title => 'Software Engineering', :rating => '4.5/5', :instructor => 'Fahad Cheema'},
      	  {:title => 'Computer Networks', :rating => '5/5', :instructor => 'Moiz Imran'}
  	 ]

courses.each do |course|
  Course.create!(course)
end
