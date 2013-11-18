namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
     User.create!(name: 'admin',
                          email: 'italiandealings@gmail.com',
                          password: 'foobar',
                          password_confirmation: 'foobar',
                          admin: true)
    @mission = Mission.create!(name: 'IDEA-ER4',
                          description: 'The Idea-ER4 Emergency Response System 
                          is in charge to identify all incidents in the area of 
                          interest and activate and monitor the appropriate assets for the 
                          quickly resolution of the incidents')
    @role = Role.create!(name: 'CEO', mission_id: @mission.id, head: true)
    User.create!(name: 'CEO',
                          email: 'ceo@idea.com',
                          password: 'foobar',
                          password_confirmation: 'foobar',
                          admin: true,
                          role_id: @role.id)
    @context = Context.create!(name: 'IDEA-ER4 Live Context')
    @geosmap = Geosmap.create!(name: 'IDEA-ER4 Live Default Map', centerlat:'24.0',
                                 centerlng:'57.0', zoom:'12', maptype:'ROADMAP')
    @context.mission = @mission
    @geosmap.context = @context
    @context.save
    @geosmap.save
    @context = Context.create!(name: 'IDEA-ER4 Training Context')
    @geosmap = Geosmap.create!(name: 'IDEA-ER4 Training Default Map', centerlat:'24.0',
                                 centerlng:'57.0', zoom:'12', maptype:'ROADMAP')
    @context.mission = @mission
    @geosmap.context = @context
    @context.save
    @geosmap.save
    @context = Context.create!(name: 'IDEA-ER4 Planning Context')
    @geosmap = Geosmap.create!(name: 'IDEA-ER4 Planning Default Map', centerlat:'24.0',
                                 centerlng:'57.0', zoom:'12', maptype:'ROADMAP')
    @context.mission = @mission
    @geosmap.context = @context
    @context.save
    @geosmap.save
  end
end