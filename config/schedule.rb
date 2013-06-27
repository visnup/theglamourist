set :output, '/u/apps/theglamourist/shared/log/cron.log'

every 1.hour do
  runner 'Post.sync!'
end

every 1.week do
  runner 'Post.sync! 10'
end

# Learn more: http://github.com/javan/whenever
