{% from "graylog/map.jinja" import graylog_map with context %}

# Make sure the service is running and restart the service unless
# restart_service_after_state_change is False
service-graylog-server:
  service.running:
    - name: {{ graylog_map.service_name }}
    - enable: True
    - require:
      - pkg: graylog-server
      - file: /etc/sysconfig/graylog-server
      - file: /etc/graylog/server/server.conf
{% if graylog_map.restart_service_after_state_change == True %}
    - watch:
      - pkg: graylog-server
      - file: /etc/sysconfig/graylog-server
      - file: /etc/graylog/server/server.conf
{% endif %}
