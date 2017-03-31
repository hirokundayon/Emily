# Selenium WebDriverを動かすbashスクリプトの動かし方
<div style="text-align: right;">
東平洋史
</div>

1. はじめに  
   この資料は Selenium WebDriver を動かすbashスクリプト Emily.bash の動かし方を記述したものです。このbashスクリプトは次の手順で、太宰府で開かれたOSC2011 Fukuokaのレポートを表示させます。  
   1. Webブラウザを起動します。  
   2. Googleのページを表示します。  
   3. 「OSC Fukuoka 太宰府」をキーに検索します。  
   4. 「OSC2011 Fukuoka 太宰府にて開催！！」の記事へのリンクをクリックします。  
   5. 表示されたLTの写真をクリックします。  
   6. 表示されたLTの写真をクリックします。  
   7. 10秒待ちます。  
   8. 起動したWebブラウザを終了させます。  
2. 準備  
    1. Selenium Standalone Serverのダウンロード  
     次のURLから必要なファイルを取得します。   
    <http://www.seleniumhq.org/download/>   
    + Selenium Standalone Server  
    + Google Chrome Driver  
    + The Internet Explorer Driver Server  
    + Mozilla GeckoDriver  
    + Microsoft Edge Driver  

3. Selenium Standalone Serverの起動  
   Selenium Standalone Serverを起動します。  
   なお、各ファイルへのパス(/path/to)は予め適切なものに変更してください。  
4. bashスクリプトの起動  
   以上で準備完了です。bashスクリプトを起動しましょう。  
   1. Google Chromeを起動する場合  
   `$ Emily.bash`  
   または  
   `$ Emily.bash chrome`  
   2. Internet Explorerを起動する場合  
   `$ Emily.bash ie`  
   3. Mozilla Firefoxを起動する場合  
   `$ Emily.bash firefox`  
   4. Microsoft Edgeを起動する場合  
   `$ Emily.bash edge`  
5. 参考文献  
   1. WebDriver  
      Living Document  
      W3C Editor's Draft 28 April 2016  
      <https://w3c.github.io/webdriver/webdriver-spec.html>  
   2. How To Manually Install Oracle Java on a Debian or Ubuntu VPS   
      <https://www.digitalocean.com/community/tutorials/how-to-manually-install-oracle-java-on-a-debian-or-ubuntu-vps>
   3. Bash on WindowsにOracle java8をインストール   
      <http://qiita.com/pontaa/items/273e9d5200619c6bfdb1>
   4. Seleniumの薄っすい話4:俺と非公式バインディング  
      <http://qiita.com/hiroshitoda/items/5fa5292ceb1e3e8a9610>  
   5. bashでWebブラウザ(Selenium WebDriver)を動かした話
      <https://www.slideshare.net/hirofumitouhei/bashwebselenium-webdriver>  
   6. OSC2011 Fukuoka 太宰府にて開催！！  
      <https://www.ospn.jp/press/20111219osc2011-fukuoka-report.html>  
