$:.push('.', 'ext')

require 'lib/gumbo-parser'
require 'test/unit'

class TestGumbo < Test::Unit::TestCase
  def setup
    @buffer = <<-EOF.gsub(/^    /, '')
    <html>
      <head>
        <meta charset="utf-8"/>
        <title>hello world</title>
      </head>
      <body>
        <h1>hello world</h1>
        <main>
          <span>content</span>
        <main>
        <!-- test comment -->
        <form>
          <textarea>foo<x>bar</textarea>
        </form>
      </body>
    </html>
    EOF
    @doc = GumboParser.parse(@buffer)
  end

  def test_element_text
    assert_equal "content", @doc.at('span').text
  end

  def test_element_cdata
    assert_equal "foo<x>bar", @doc.at('textarea').text.strip
  end

  def test_attr_value
    assert_equal "utf-8", @doc.at('meta')['charset']
  end

  def test_comment
    assert_equal " test comment ", @doc.xpath('//comment()').text
  end

  def test_unknown_element
    assert_equal "main", @doc.at('main').name
  end
end
