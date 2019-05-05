#!/bin/bash

# newSession
#   新しいセッションを開始します。
#
function newSession() {
    local BROWSER=$1
    local RESPONSE=$(echo '{"desiredCapabilities":{},"requiredCapabilities":{}}' | http POST localhost:9515/session)

    local SESSION_ID=$(echo ${RESPONSE} | jq -r .sessionId)
    echo ${SESSION_ID}
}

# maximizeWindow
#  Webブラウザのウィンドウを最大化します。
#     $1 セッションID
#
function maximizeWindow() {
    local SESSION_ID=$1
    local RESPONSE=$(http POST localhost:9515/session/${SESSION_ID}/window/maximize)
}


# go
#   指定したURLへ飛びます。
#     $1 セッションID
#     $2 URL
#
function goURL() {
    local SESSION_ID=$1
    local URL=$2

    local RESPONSE=$(echo '{"url":"'${URL}'"}' | http POST localhost:9515/session/${SESSION_ID}/url)
}

# getTitle
#   タイトルを取得します。
#     $1 セッションID
function getTitle() {
    local SESSION_ID=$1
    local RESPONSE=$(http GET localhost:9515/session/${SESSION_ID}/title)
    local TITLE=$(echo ${RESPONSE} | jq -r .value)
    echo ${TITLE}
}

# waitByTitle
#   タイトルが指定された値になるまで待ちます。
#     $1 セッションID
#     $2 タイトルの値
#
function waitByTitle() {
    local SESSION_ID=$1
    local VALUE=$2
    local RESPONSE=""

    if [ $# -eq 1 ] ; then
        VALUE=""
    elif [ $# -gt 2 ] ; then
        VALUE=$(echo $@ | sed -e "s/^${SESSION_ID} //")
    fi

    echo ${VALUE} >&2
    local TITLE=""

    while [ "${TITLE}" != "${VALUE}" ];
    do
        local RESPONSE=$(http GET localhost:9515/session/${SESSION_ID}/title)
	TITLE=$(echo ${RESPONSE} | jq -r .value );
    done
}

# findElementByName
#   指定された要素を取得します。
#     $1 セッションID
#     $2 locator
#
function findElementByName() {
    local SESSION_ID=$1
    local SELECTOR='name'
    local LOCATOR=$2
    local RESPONSE=""
    local STATE=""

    while [ "${STATE}" != 0 ]
    do
        RESPONSE=$(echo "{\"using\":\"${SELECTOR}\",\"value\":\"${LOCATOR}\"}" | http POST localhost:9515/session/${SESSION_ID}/element)
        STATE=$(echo ${RESPONSE} | jq -r .status)
    done

    local ELEMENT_ID=$(echo ${RESPONSE}  | jq .value | jq -r .ELEMENT)

    echo ${ELEMENT_ID}
}

# findElementByPartialLinkText
#   指定された要素を取得します。
#     $1 セッションID
#     $2 locator
#
function findElementByPartialLinkText() {
    local SESSION_ID=$1
    local SELECTOR="partial link text"
    local LOCATOR=$2

    local RESPONSE=""
    local STATE=""

    while [ "${STATE}" != 0 ]
    do
        RESPONSE=$(echo "{\"using\":\"${SELECTOR}\",\"value\":\"${LOCATOR}\"}" | http POST localhost:9515/session/${SESSION_ID}/element)
        STATE=$(echo ${RESPONSE} | jq -r .status)
    done

    local ELEMENT_ID=$(echo ${RESPONSE}  | jq .value | jq -r .ELEMENT)

    echo "${ELEMENT_ID}"
}

# findElementByLinkText
#   指定された要素を取得します。
#     $1 セッションID
#     $2 locator
#
function findElementByLinkText() {
    local SESSION_ID=$1
    local SELECTOR="link text"
    local LOCATOR=$2

    local RESPONSE=""
    local STATE=""

    while [ "${STATE}" != 0 ]
    do
        RESPONSE=$(echo "{\"using\":\"${SELECTOR}\",\"value\":\"${LOCATOR}\"}" | http POST localhost:9515/session/${SESSION_ID}/element)
        STATE=$(echo ${RESPONSE} | jq -r .status)
    done

    local ELEMENT_ID=$(echo ${RESPONSE}  | jq .value | jq -r .ELEMENT)

    echo "${ELEMENT_ID}"
}

# findElementByCSSselector
#   指定された要素を取得します。
#     $1 セッションID
#     $2 locator
#
function findElementByCSSselector() {
    local SESSION_ID=$1
    local SELECTOR='css selector'
    local LOCATOR=$2

    local RESPONSE=""
    local STATE=""

    while [ "${STATE}" != 0 ]
    do
        RESPONSE=$(echo "{\"using\":\"${SELECTOR}\",\"value\":\"${LOCATOR}\"}" | http POST localhost:9515/session/${SESSION_ID}/element)
        STATE=$(echo ${RESPONSE} | jq -r .status)
    done

    local ELEMENT_ID=$(echo ${RESPONSE}  | jq .value | jq -r .ELEMENT)

    echo "${ELEMENT_ID}"
}

# clickElement
#   指定された要素をクリックします。
#     $1 セッションID
#     $2 クリックする要素のELEMENT_ID
#
function clickElement() {
    local SESSION_ID=$1
    local ELEMENT_ID=$2

    local RESPONSE=$(http POST localhost:9515/session/${SESSION_ID}/element/${ELEMENT_ID}/click)
}

# sendKeysToElement
#   指定された要素へ打鍵データを送ります。
#     $1 セッションID
#     $2 要素のELEMENT_ID
#     $3 打鍵データ
#
function sendKeysToElement() {
    local SESSION_ID=$1
    local ELEMENT_ID=$2
    local KEYDATA=$3

    if [ $# -eq 2 ] ; then
        KEYDATA=" "
    elif [ $# -gt 3 ] ; then
        KEYDATA=$(echo $@ | sed -e "s/^${SESSION_ID} ${ELEMENT_ID} //")
    fi
    local RESPONSE=$(echo "{\"value\":[\"${KEYDATA}\"]}" | http POST localhost:9515/session/${SESSION_ID}/element/${ELEMENT_ID}/value)
}

#switchToParentFrame
#   親のフレームへ移動します。
#     $1 セッションID
#
function switchToParentFrame() {
    local SESSION_ID=$1
    local RESPONSE=$(http POST localhost:9515/session/${SESSION_ID}/frame/parent)
}

# switchToFrame
#   指定されたフレームへ遷移します。
#     $1 セッションID
#     $2 ELEMENT ID
#
function switchToFrame() {
    local SESSION_ID=$1
    local ELEMENT_ID=$2

    local RESPONSE=""
    local STATE=""
    
    #一度クリックしておく
    RESPONSE=$(http POST localhost:9515/session/${SESSION_ID}/element/${ELEMENT_ID}/click)
    
    while [ "${STATE}" != 0 ]
    do
        RESPONSE=$(echo "{\"id\":{\"ELEMENT\":\"${ELEMENT_ID}\"}}" | \
                                 http POST localhost:9515/session/${SESSION_ID}/frame)
        STATE=$(echo ${RESPONSE} | jq -r .status)
    done
}

# executeScript
#   指定されたJavascriptを実行させます。
#     $1 セッションID
#     $2 実行するJavascript
#
function executeScript() {
    local SESSION_ID=$1
    local SCRIPT=$2

    local RESPONSE=$(echo '{"script":"'${SCRIPT}'", "args":[]}' | http POST localhost:9515/session/${SESSION_ID}/execute/sync)
}

# deleteSession
#   指定されたセッションを終了させます。
#     $1 セッションID
#
function deleteSession() {
    local SESSION_ID=$1

    local RESPONSE=$(http DELETE localhost:9515/session/${SESSION_ID})
}
