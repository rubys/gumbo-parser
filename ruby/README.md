GumboParser - a Ruby binding to the Gumbo HTML5 parser.
===========

At the moment, this is a proof of concept, allowing a Ruby program to invoke
the Gumbo HTML5 parser and access the result as a Nokogiri parsed document.

Usage:
-----

```ruby
require './gumbo_parser'
doc = GumboParser.parse(string)
```

Notes:
-----

* The parse function takes a string and passes it to the
<code>gumbo_parse_with_options</code> method, using the default options.
The resulting Gumbo parse tree is the walked, producing a Nokogiri parse tree.
The original Gumbo parse tree is then destroyed, and the Nokogiri parse tree
is returned. 

* Instead of uppercase element names, lowercase element names are produced.

* Instead of returning 'unknown' as the element name for unknown tags, the
original tag name is returned verbatim.

* Producing a proper gem is planned in the near future, at the moment, this is
merely a library.  Hence, the temporary need for a path in the `require` 
statement.

* Nothing meaningful is done with the `GumboDocument` struct, i.e., no
Nokogiri `EntityDecl` is produced.

Installation:
============

* Build and install the gumbo-parser C library

* Change directory into the `ruby` subdirectory

* Execute `rake`

