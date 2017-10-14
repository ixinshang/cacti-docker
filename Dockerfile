#name of container: cacti
FROM ubuntu:16.04

RUN apt-get update && apt-get install -yq cacti \
                                          snmpd \
                                          cacti-spine \
                                          python-netsnmp \
                                          libnet-snmp-perl \
                                          snmp-mibs-downloader \
                   && mysql_install_db > /dev/null 2>&1 \
                   && touch /var/lib/mysql/.EMPTY_DB \
                   && apt-get clean \
                   && rm -rf /tmp/* /var/tmp/* \
                   && rm -rf /var/lib/apt/lists/*

EXPOSE 80 443 161

