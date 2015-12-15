# RHG-epub
Ruby Hacking Guide HTML to EPUB



[Ruby Hacking Guide 「Rubyソースコード完全解説」](http://i.loveruby.net/ja/rhg/book/)のHTML版をEPUB形式に変換するスクリプトです。  
[makimoto / rhg-mobi.rb](https://gist.github.com/makimoto/7064473)をベースにしています。


# 必要なもの

*   Ruby Hacking Guide のHTML版。  
[『Rubyソースコード完全解説』サポートページ](http://i.loveruby.net/ja/rhg/)からHTMLのアーカイブをダウンロードしておきます。

*   Pandoc  
HTMLからEPUBへの変換は[Pandoc](http://pandoc.org/installing.html)を使用しますので、あらかじめインストールしておいてください。


# EPUB形式へ変換する

*   `rhg_epub.rb`と`rhg_epub.css`をRHG-HTML版を展開したディレクトリにコピー。
*   `rhg_epub.rb`スクリプトを実行

```
> ruby rhg_epub.rb
combine HTML => all_epub.html
convert HTML to EPUB
process is complete => ruby_hacking_guide.epub
```

*   作成した`ruby_hacking_guide.epub`をEPUBリーダーで閲覧。


# EPUBリーダー

EPUBの閲覧にはFirefoxのアドオンEPUBReaderがおすすめです。

*   <strong>EPUBReader :: Add-ons for Firefox</strong>:  
<a href="https://addons.mozilla.org/ja/firefox/addon/epubreader/" target="_blank">https://addons.mozilla.org/ja/firefox/addon/epubreader/</a>


RHGをFirefoxのEPUBReaderで開いたスクリーンショットです

<img alt="screenshot" src="https://github.com/icm7216/RHG-epub/raw/master/screenshot/rhg_epub.png" width="500px">


# 感謝

*   [『Rubyソースコード完全解説』サポートページ](http://i.loveruby.net/ja/rhg/)
*   [Ruby Hacking Guide を Kindle で読めるようにする - Stats of the Rivers](http://makimoto.hatenablog.com/entry/2013/10/20/Ruby_Hacking_Guide_%E3%82%92_Kindle_%E3%81%A7%E8%AA%AD%E3%82%81%E3%82%8B%E3%82%88%E3%81%86%E3%81%AB%E3%81%99%E3%82%8B)
