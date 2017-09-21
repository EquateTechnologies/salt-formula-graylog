{% from "graylog/map.jinja" import graylog_map with context %}

# Manage graylog server config file using template
/etc/graylog/server/server.conf:
  file.managed:
    - name: /etc/graylog/server/server.conf
    - source: salt://graylog/files/server.conf
    - template: jinja
    - user: root
    - group: graylog
    - mode: 0640
    - context:
      graylog_map: {{ graylog_map }}

# Manage graylog sysconfig file using template
/etc/sysconfig/graylog-server:
  file.managed:
    - source: salt://graylog/files/graylog-server.sysconfig
    - template: jinja
    - user: root
    - group: root
    - mode: '0644'
    - context:
      graylog_map: {{ graylog_map }}
