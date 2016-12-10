namespace :deploy do

desc "Post-deployment and promotion processes"
  task release: :environment do
    Rake::Task["db:migrate"].execute
  end
end
