Sprockets Url Rewriter
======================

Rewrites relative CSS urls to absolute ones, which means that you can include, for example jQuery UI, without any modifications into the asset pipeline. 

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

License terms
=============

Copyright (C) 2011 by Carl Hörberg

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
