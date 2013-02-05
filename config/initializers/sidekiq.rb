if Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = { :url => "redis://redistogo:c8be192a5eac7bd3ec5cfa2be0576cff@barreleye.redistogo.com:9205/" }
  end
end
