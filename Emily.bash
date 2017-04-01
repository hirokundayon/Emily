#!/usr/bin/bash

SCRIPT_DIR=$(cd $(dirname $0);pwd)
. ${SCRIPT_DIR}/EmilySub.bash

BROWSER=$1

#ウィンドウオープン
SESSION_ID=$(newSession "${BROWSER}")

#ウィンドウ最大化
maximizeWindow ${SESSION_ID}

#Googleを開く
URL='http://www.google.co.jp/'

goURL ${SESSION_ID} ${URL}

waitByTitle ${SESSION_ID} "Google"

#"OSC Fukuoka 太宰府"を検索

SELECTOR='name'
LOCATOR='q'

ELEMENT_ID=$(findElementByName ${SESSION_ID} q)
key='OSC Fukuoka 太宰府\n'

sendKeysToElement ${SESSION_ID} ${ELEMENT_ID} "${key}"

#検索結果が表示されるまで待つ
TITLE_VALUE='OSC Fukuoka 太宰府 - Google 検索'
waitByTitle "${SESSION_ID}" "${TITLE_VALUE}"

#OSC2011 Fukuoka のレポートを表示させる 
LOCATOR="太宰府にて開催！！"
ELEMENT_ID=$(findElementByPartialLinkText ${SESSION_ID} "${LOCATOR}")

clickElement ${SESSION_ID} ${ELEMENT_ID}

#レポートが表示されるまで待つ
TITLE_VALUE="OSC2011 Fukuoka 太宰府にて開催！！"
TITLE=$(waitByTitle ${SESSION_ID} "${TITLE_VALUE}")

#写真をクリック
LOCATOR="img[title='仏様に見守られながらのLT']"

ELEMENT_ID=$(findElementByCSSselector ${SESSION_ID} "${LOCATOR}")
clickElement ${SESSION_ID} ${ELEMENT_ID}

#写真が表示されるまで待つ
TITLE_VALUE="仏様に見守られながらのLT"
TITLE=$(waitByTitle ${SESSION_ID} "${TITLE_VALUE}")

#写真をクリック
LOCATOR="a[href='https://www.ospn.jp/press/wp-content/uploads/2011/12/LT.jpg']"

ELEMENT_ID=$(findElementByCSSselector ${SESSION_ID} "${LOCATOR}")
clickElement ${SESSION_ID} ${ELEMENT_ID}


#10秒表示
sleep 10s;

#ウインドウを閉じる
deleteSession ${SESSION_ID}

