#!/bin/bash
java \
 -Dwebdriver.chrome.driver=/path/to/chromedriver \
 -Dwebdriver.edge.driver=/path/to/MicrosoftWebDriver \
 -Dwebdriver.ie.driver=/path/to/IEDriverServer \
 -jar /path/to/selenium-server-standalone-3.3.1.jar
