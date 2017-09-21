salt-formula-graylog
================

Deploys and managed Graylog servers.

NOTE: Currently pretty specific to RHEL/Fedora systems.

Requirements
================

- mongodb
- elasticsearch
- firewalld/iptables should permit ports if used (hint: use another formula to achieve this automatically)

The packages state can be configured to install package dependencies that may not actually be pulled in by the graylog-server package currently, e.g. OpenJDK 8.0

Available states
================

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

.. contents::
    :local:

``repo``
------------
Uses pkgrepo.managed to manage /etc/yum.repos.d/graylog.repo
Instals Graylog RPM signing public key for verification purposes

``graylog-package``
------------
Install graylog and additional prerequisite packages

``graylog-plugins``
------------
Installs third party Graylog plugin files to the plugin directory

``graylog-config``
------------
Manageds the following files:
- /etc/sysconfig/graylog-server
- /etc/graylog/server/server.conf

``graylog-service``
------------
Enables startup on boot and ensures graylog-server service is running

