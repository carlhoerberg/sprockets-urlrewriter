require 'minitest/autorun'
require './lib/sprockets-urlrewriter'

describe 'UrlRewriter' do
  let(:context) { FakeContext.new "/assets/css/jada.css" }
  let(:rewriter) { Sprockets::UrlRewriter.new { @css } }
  subject { rewriter.evaluate context, {} }

  it 'finds relatives urls and makes them absolute' do
    @css = "body { background-url: url('bg.jpg?1232') }"
    assert_equal "body { background-url: url(/assets/css/bg.jpg) }", subject
  end

  it 'leaves absolute URLs as is' do
    @css = "body { background-url: url('http://example.com/bg.jpg?1232') }"
    assert_equal @css, subject
  end
end

class FakeContext
  attr_accessor :logical_path
  def initialize(lpath)
    @logical_path = lpath
  end
end
