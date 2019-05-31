%w[
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
  config/initializers/application.yml
].each { |path| Spring.watch(path) }
