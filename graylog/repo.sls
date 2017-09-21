{% from "graylog/map.jinja" import graylog_map with context %}

/etc/pki/rpm-gpg/RPM-GPG-KEY-graylog:
  file.managed:
    - source: salt://graylog/files/RPM-GPG-KEY-graylog
    - user: root
    - group: root
    - mode: 0644

graylog-repo:
  pkgrepo.managed:
    - name: graylog
    - humanname: graylog
    - baseurl: https://packages.graylog2.org/repo/el/stable/{{ graylog_map.repo_version }}/$basearch/
    - gpgcheck: 1
    - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-graylog
    - require:
      - file: /etc/pki/rpm-gpg/RPM-GPG-KEY-graylog
