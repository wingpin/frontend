$redis = Redis.new(:host => Settings.redis.host, :port => Settings.redis.port, :password => Settings.redis.password )
