require 'sprockets' 
require 'pathname' 
require 'uri' 
 
module Sprockets 
  class UrlRewriter < Processor 
    def evaluate(context, locals) 
      # FIXME: Accessing logical_path instance variable directly instead of
      # using public method, since the public method incorrectly chops paths
      # with periods in them: https://github.com/sstephenson/sprockets/pull/299
      #
      # logical_path = context.logical_path
      logical_path = context.instance_variable_get(:@logical_path)

      rel = Pathname.new(logical_path).parent
      data.gsub /(?<=[:\s])url\(['"]?([^\s)]+\.[a-z]+)(\?\d+)?['"]?\)/i do |url| 
        next url if URI.parse($1).absolute?
        new_path = rel.join Pathname.new($1)
        "url(#{new_path}#{$2})"
      end 
    end 
  end 
end
