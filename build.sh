rm *.gem
rm -fr test/dummy/log/*.log
rm -fr test/standalone/log/*.log
rm -fr test/dummy/tmp/cache
rm -fr test/standalone/tmp/cache
gem build rails_db.gemspec