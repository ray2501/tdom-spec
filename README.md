# tdom-spec

openSUSE RPM spec for tdom, source code is from [tDOM](http://tdom.org/index.html) and RPM spec is from openSUSE website.

tDOM combines high performance XML data processing with easy and powerful [Tcl](http://www.tcl.tk/) scripting functionality.
tDOM should be one of the fastest ways to manipulate XML with a scripting language and uses very few memory:
for example, the DOM tree of the XML recommendation in XML (160K) needs only about 450K of memory.

Notice: This RPM spec enables html5 option and link to gumbo html parser.
It is possible no gumbo html parser library in package repositories,
then it is necessary to remove gumbo related item at RPM spec or
user needs add package repository source to get gumbo development files.

