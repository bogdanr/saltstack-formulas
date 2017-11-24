# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "monit/map.jinja" import monit with context %}

{{ monit.service.name }}:
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: {{ monit.config }}
      - file: {{ monit.config_includes }}/mail
      - file: {{ monit.config_includes }}/modules
