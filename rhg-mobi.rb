#!/usr/bin/env ruby

file = File.open("index.html", "r:iso-2022-jp:UTF-8")
content = file.read

all_html = <<HTML
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="Author" content="Aoki Minero">
<title>Ruby Hacking Guide</title>
</head>
<body>
HTML

content.scan(%r[<li><a href="(.*?)">(.*?)</a>]) do |filename, title|
  chap = File.open(filename, "r:iso-2022-jp:UTF-8", undef: :replace)
  html = chap.read
  html.sub!(/^.+?<h1>/m, %q[<h1 class="chapter">])
  html.sub!(/^.+?<h2>はじめに<\/h2>/m, %q[<h1 class="chapter">はじめに</h1>])

  html.gsub!(/<h2>/, "<h3>")
  html.sub!(%r[</body>.*]m, '')
  all_html << html
end

all_html << '</body></html>'

puts all_html

