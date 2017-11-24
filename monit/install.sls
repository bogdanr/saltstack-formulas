# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "monit/map.jinja" import monit with context %}

monit_pkg:
  pkg.installed:
    - name: {{ monit.pkg }}
