#!/usr/bin/env ruby

# epub-stylesheet
EPUB_CSS = 'rhg_epub.css'
# output file name
HTML_OUT = 'all_epub.html'
EPUB_OUT = 'ruby_hacking_guide.epub'

file = File.open("index.html", "r:iso-2022-jp:UTF-8")
content = file.read

all_html = <<HTML
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="author" content="Minero Aoki">
<meta name="language" content="ja">
<link rel="stylesheet" type="text/css" href=#{EPUB_CSS}>
<title>Ruby Hacking Guide</title>
</head>
<body>
HTML

# add TOC
body = %r[<body>(.*)</body>]m.match(content).to_a[1]
body.gsub!(%r[(<li><a href=")(.*?)(.html)(">)]){$1 + "#" +$2 + $4}
all_html << body

content.scan(%r[<li><a href="(.*?)">(.*?)</a>]) do |filename, title|
  id = filename.slice(/[a-zA-Z]+/)
  chap = File.open(filename, "r:iso-2022-jp:UTF-8", undef: :replace, :replace => "?")

  html = chap.read

  html.sub!(%r[^.+?<h1>]m, %Q[<h1 id="#{id}" class="chapter">])
  html.sub!(%r[^.+?<h2>はじめに</h2>]m, %Q[<h1 id="#{id}" class="chapter">はじめに</h1>]) if filename == "preface.html"

  # fix the <td> elements of table
  html.gsub!(%r[<td>(?!<td>)(.*?)(<td>)]){'<td>' + $1 + '</td>'}
  html.gsub!(%r[<td><td>]){'<td></td>'}
  # fix the line 1520 of module.html by XML parser error of EPUBReader.
  html.sub!(%r[U牙.*?S頏著]){'U牙..S頏著'} if filename == "module.html"

  html.sub!(%r[</body>.*]m, '')
  all_html << html
end

all_html << '</body></html>'

puts "combine HTML => #{HTML_OUT}"
File.open(HTML_OUT, "w"){|w| w.puts all_html }

puts "convert HTML to EPUB"
system("pandoc -f html -t epub #{HTML_OUT} -o #{EPUB_OUT} --css=#{EPUB_CSS}")

puts "process is complete => #{EPUB_OUT}"