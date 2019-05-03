#!/bin/bash
echo -ne '\n' | nohup xvfb-run -a java -Dwebdriver.chrome.driver=/usr/bin/chromedriver -jar selenium-server-standalone*.jar &
sleep 5
echo "Selenium is up and running"
