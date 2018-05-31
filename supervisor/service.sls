# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "supervisor/map.jinja" import supervisor with context %}

supervisor.service:
  service.running:
    - name: {{ supervisor.service.name }}
    - enable: True
