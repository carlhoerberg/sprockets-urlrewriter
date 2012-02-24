require 'sprockets' 
require 'pathname' 
require 'uri' 
 
module Sprockets 
  class UrlRewriter < Processor 
    def evaluate(context, locals) 
      rel = Pathname.new(context.logical_path).parent 
      data.gsub /url\(['"]?([^\s)]+\.[a-z]+)(\?\d+)?['"]?\)/ do |url| 
        unless URI.parse($1).absolute?
          new_path = rel.join Pathname.new($1)
          url = "url(#{new_path})"
        end

        url
      end 
    end 
  end 
end
