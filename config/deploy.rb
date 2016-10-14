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
  after :publishing, :restart

  desc "Restart application"
  task :restart do
    invoke "unicorn:restart"
  end
end

