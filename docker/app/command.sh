rm -f tmp/pids/server.pid

yarn install --check-files

bundle check || bundle install --binstubs=$BUNDLE_BIN

bundle exec rails db:prepare && bundle exec rails s -p 3000 -b 0.0.0.0
