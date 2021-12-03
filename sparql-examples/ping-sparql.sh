#!/bin/bash -x

curl 'http://0.0.0.0:13030/$/ping?_=0.9918838759565747' \
  -H 'Connection: keep-alive' \
  -H 'Accept: */*' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  --insecure
