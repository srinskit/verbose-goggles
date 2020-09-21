#!/bin/bash

keystore="./keystores"
passwords="./passwords"

kibana-keystore create

cat $(pwd)

(cat "$passwords/kibana-system-username"; echo) | kibana-keystore add elasticsearch.username
(cat "$passwords/kibana-system-password"; echo) | kibana-keystore add elasticsearch.password

cp /usr/share/kibana/data/kibana.keystore "$keystore"
