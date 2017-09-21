{% from "graylog/map.jinja" import graylog_map with context %}

# install dependencies
{% for package in graylog_map.package_dependencies %}
graylog_package_dep_{{ package }}:
  pkg.installed:
    - name: {{ package }}
{% endfor %}

# install the actual server package
graylog-server:
  pkg.installed:
    - name: {{ graylog_map.package_name }}
{% if graylog_map.package_version != '' %}
    - version: {{ graylog_map.package_version }}
{% endif %}
{% if graylog_map.package_dependencies != [] %}
    - require:
{% for package in graylog_map.package_dependencies %}
      - pkg: graylog_package_dep_{{ package }}
{% endfor %}
{% endif %}
