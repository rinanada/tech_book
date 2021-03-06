# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'tech_book'
set :repo_url, 'https://github.com/rinanada/tech_book.git'
set :branch, 'master'
set :deploy_to, '/home/rina/tech_book'
set :rbenv_ruby, '2.3.1'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :keep_releases, 5
set :log_level, :debug


# set :linked_files, fetch(:linked_files, []).push('config/settings.yml')
# 保持するバージョンの個数(※後述)



namespace :deploy do
  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end


  desc "Restart application"
  task :restart do
    invoke "unicorn:restart"
  end

  after :publishing, :restart
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end

