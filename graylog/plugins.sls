{% from "graylog/map.jinja" import graylog_map with context %}

# Manage graylog plugins
{% for plugin in graylog_map.plugins %}
{{ graylog_map.plugin_dir }}/{{ plugin }}:
  file.managed:
    - source: salt://graylog/files/{{ plugin }}
    - user: graylog
    - group: graylog
    - mode: '0644'
{% endfor %}
