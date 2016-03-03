# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = [{:title => 'Badnami 101', :rating => '5/5', :instructor => 'Munni'},
      	  {:title => 'Jawani 101', :rating => '4.5/5', :instructor => 'Sheela'},
      	  {:title => 'Dumb Ways to Break a Leg', :rating => '1/5', :instructor => 'Zain Butt'},
      	  {:title => 'Poondi', :rating => '4.9/5', :instructor => 'Haither Ahmad'},
      	  {:title => 'Pulling Your Beard', :rating => '2.4/5', :instructor => '6-Apr-1968'},
      	  {:title => 'How to Lose A Friend', :rating => '0.5/5', :instructor => 'Fizzah Amjad'},
      	  {:title => 'Islam ki Baatain', :rating => '4/5', :instructor => 'Maulana Tulha'}
  	 ]

courses.each do |course|
  Course.create!(course)
end
