require 'minitest/autorun'
require './lib/sprockets-urlrewriter'

describe 'UrlRewriter' do
  class FakeContext
    attr_accessor :logical_path
  end

  it 'finds relatives urls and makes them absolut' do
    ctx = FakeContext.new
    ctx.logical_path = "/assets/css/jada.css"
    css = "body { background-url: url('bg.jpg?1232') }"
    ur = Sprockets::UrlRewriter.new { css }
    result = ur.evaluate ctx, {}
    assert_equal "body { background-url: url(/assets/css/bg.jpg) }", result
  end

  it 'leaves absolute URLs as is' do
    ctx = FakeContext.new
    ctx.logical_path = "/assets/css/jada.css"
    css = "body { background-url: url('http://example.com/bg.jpg?1232') }"
    ur = Sprockets::UrlRewriter.new { css }
    result = ur.evaluate ctx, {}
    assert_equal css, result
  end
end
