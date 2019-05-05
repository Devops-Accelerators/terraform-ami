cd ./artifactory-oss-6.9.1/bin
echo -ne '\n' | nohup sh artifactory.sh &
sleep 5
echo 'Please wait for 2 mins for the servicce to start'
sleep 90
