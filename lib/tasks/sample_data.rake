namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    User.create!(name: 'admin',
                          email: 'italiandealings@gmail.com',
                          password: 'foobar',
                          password_confirmation: 'foobar',
                          admin: true)
    @mission = Mission.create!(name: 'Emergency Response System',
                          description: 'The Idea-ER4 Emergency Response System 
                          is in charge to identify all incidents in the area of 
                          interest and activate and monitor the appropriate assets for the 
                          quickly resolution of the incidents')
    @context = Context.create!(name: 'Emergency Response System Live Context')
    @geosmap = Geosmap.create!(name: 'Emergency Response System Live Default Map', centerlat:'24.0',
                                 centerlng:'57.0', zoom:'12', maptype:'ROADMAP')
    @context.mission = @mission
    @geosmap.context = @context
    @context.save
    @geosmap.save
    @context = Context.create!(name: 'Emergency Response System Training Context')
    @geosmap = Geosmap.create!(name: 'Emergency Response System Training Default Map', centerlat:'24.0',
                                 centerlng:'57.0', zoom:'12', maptype:'ROADMAP')
    @context.mission = @mission
    @geosmap.context = @context
    @context.save
    @geosmap.save
    @context = Context.create!(name: 'Emergency Response System Planning Context')
    @geosmap = Geosmap.create!(name: 'Emergency Response System Planning Default Map', centerlat:'24.0',
                                 centerlng:'57.0', zoom:'12', maptype:'ROADMAP')
    @context.mission = @mission
    @geosmap.context = @context
    @context.save
    @geosmap.save
    5.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(name: name,
                            email: email,
                            password: password,
                            password_confirmation: password)
                            
    end
  end
end