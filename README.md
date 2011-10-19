Example usage
=============

    gem install sprockets-urlrewriter

In config.ru

    map '/assets' do
      s = Sprockets::Environment.new
      s.append_path 'assets/css'
      s.append_path 'assets/js'
      s.append_path 'vendor/js'
      s.register_preprocessor 'text/css', Sprockets::UrlRewriter
      s.cache = Sprockets::Cache::FileStore.new("tmp/sprockets")
      run s
    end

