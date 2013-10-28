set :application, 'testdeploy'
set :repo_url, 'git@github.com:excid3/testdeploy.git'
set :deploy_to, '/home/deploy/testdeploy'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'
end
