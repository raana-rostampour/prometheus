#!/bin/bash
echo request_failure_count
read request_failure_count
echo request_success_count
read request_success_count
echo action
read action
echo region
read region
text_file_collector_path=/opt/prometheus/node_exporter/textfile_collector/request_"$action"_"$region".prom

### important lines for sending TYPE
echo -e "# HELP request total number of success and fail requests .\n# TYPE request counter" > $text_file_collector_path

echo  "request{service=\"cloud\", region=\"$region\",status=\"failed\",action=\"$action\"} $request_failure_count" >> $text_file_collector_path
echo  "request{service=\"cloud\" , region=\"$region\",status=\"successed\",action=\"$action\"} $request_success_count" >> $text_file_collector_path
