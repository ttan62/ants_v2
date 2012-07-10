namespace :db do
    desc "Erase and fill database"
    task :populate => :environment do
        require 'populator'
        Project.populate 20 do |project|
            project.name = Populator.words(1..3).titleize
            project.description = Populator.sentences(2..10)
            project.user = "Test"
        end
    end
end
