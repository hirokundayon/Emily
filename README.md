# Gooele Chromeを動かすbashスクリプトの動かし方
<div style="text-align: right;">
東平洋史
</div>

1. はじめに  
   この資料は Selenium WebDriver を動かすbashスクリプト Emily.bash の動かし方を記述したものです。このbashスクリプトは次の手順で、太宰府で開かれたOSC2011 Fukuokaのレポートを表示させます。なお、このスクリプトの名前は仮面ライダーにレギュラー出演した高見エミリーに因んでおります。   
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
    + Google Chrome Driver  
    2. httpieのインストール
    次のURLを参考にして下さい。   
    <https://github.com/jakubroztocil/httpie>
    3. jqのインストール
    次のURLを参考にして下さい。   
    <https://stedolan.github.io/jq/download/>
3. bashスクリプトの起動  
   以上で準備完了です。bashスクリプトを起動しましょう。  
   `$ Emily.bash`  
4. 参考文献  
   1. WebDriver  
      Living Document  
      W3C Editor's Draft 28 April 2016  
      <https://w3c.github.io/webdriver/webdriver-spec.html>  
   2. Seleniumの薄っすい話4:俺と非公式バインディング  
      <http://qiita.com/hiroshitoda/items/5fa5292ceb1e3e8a9610>  
   3. bashでWebブラウザ(Selenium WebDriver)を動かした話
      <https://www.slideshare.net/hirofumitouhei/bashwebselenium-webdriver>  
   4. OSC2011 Fukuoka 太宰府にて開催！！  
      <https://www.ospn.jp/press/20111219osc2011-fukuoka-report.html>  
   5. HTTPie: a CLI, cURL-like tool for humans
      <https://github.com/jakubroztocil/httpie>
   6. jq is a lightweight and flexible command-line JSON processor.
      <https://stedolan.github.io/jq/>
