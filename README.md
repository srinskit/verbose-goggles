# verbose-goggles
ES cluster

Pre-requisites for ELK cluster deployment-

1) Create ca-certificate:- create a certs directory (for volume mounting) and use docker-compose to deploy create-ca.yml. Add the generated ca-certificate to docker secret named es-ca-cert. If the ca cert has a password, add the password to docker secrets as well named es-ca-pass

2) Create kibana-keystore:- Log inside a Kibana container and run commands "bin/kibana-keystore create", "bin/kibana-keystore add elasticsearch.username" and "bin/kibana-keystore elasticsearch.password" input the username(kibana_system) and password(same as being set in curl/wget command for kibana user creation) when prompted. To copy the keystore to host m/c use "docker cp <containerID>:/usr/share/kibana/data/kibana.keystore .". Add the keystore to docker secrets named kibana_keystore
