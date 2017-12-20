{% from "graylog/map.jinja" import graylog_map with context %}

{% if graylog_map.geolocation_db.manage == True and graylog_map.geolocation_db.source != '' %}
{% if graylog_map.geolocation_db.source_type == 'archive'  %}

graylog-geolocation-db:
  archive.extracted:
    - name: {{ graylog_map.lookup.locations.geolocation_db_path }}
    - source: {{ graylog_map.geolocation_db.source }}
    {% if graylog_map.geolocation_db.source_hash != '' and graylog_map.geolocation_db.source_hash_type != '' %}
    - source_hash: {{ graylog_map.geolocation_db.source_hash_type }}={{ graylog_map.geolocation_db.source_hash }}
    {% endif %}
    - skip_verify: {{ graylog_map.geolocation_db.skip_verify|default(False) }}
    - user: root
    - group: root
    - if_missing: {{ graylog_map.lookup.locations.geolocation_db_path }}/{{ graylog_map.geolocation_db.file_name }}
    - tar_options: {{ graylog_map.geolocation_db.tar_options }}

{% else %}

{# assumed to be non-archive file #}

graylog-geolocation-db:
  file.managed:
    - name: {{ graylog_map.lookup.locations.geolocation_db_path }}/{{ graylog_map.geolocation_db.file_name }}:
    - source: {{ graylog_map.geolocation_db.source }}
    {% if graylog_map.geolocation_db.source_hash != '' and graylog_map.geolocation_db.source_hash_type != '' %}
    - source_hash: {{ graylog_map.geolocation_db.source_hash_type }}={{ graylog_map.geolocation_db.source_hash }}
    {% endif %}
    - skip_verify: {{ graylog_map.geolocation_db.skip_verify|default(False) }}
    - user: root
    - group: root
    - mode: 0644

{% endif %}
{% endif %}
