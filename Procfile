web: bundle exec unicorn_rails -p $PORT -c ./config/unicorn.rb
worker: bundle exec sidekiq -q mailer -q default
