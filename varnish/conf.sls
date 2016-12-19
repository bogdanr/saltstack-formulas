{% from "varnish/map.jinja" import varnish with context -%}
{% from "varnish/macros.jinja" import files_switch with context -%}
{% set settings = salt['pillar.get']('varnish', {}) -%}


include:
  - varnish


# This state ID is going to have just a "require" instead of a "watch"
# statement because of:
#
# a) the varnish service is defined as reload=true and to actually apply changes
#    in this config file it's necessary a restart
# b) restart is potentially dangerous because it deletes the cache, so it's
#    preferrable to trigger an explicit and controlled restart after changing
#    this file
#
# As you probably know, to run a restart of the service you could use something
# like: salt 'varnish-node*' service.varnish restart.
{{ varnish.config }}:
  file:
    - managed
    - source: {{ files_switch( settings.get('prefix', 'varnish'), ['/etc/default/varnish.jinja']) }}
    - template: jinja
    - require:
      - pkg: varnish
    - require_in:
      - service: varnish


# Below we deploy the vcl files and we trigger a reload of varnish
{% for file in settings.get('vcl', {}).get('files', ['default.vcl']) %}
/etc/varnish/{{ file }}:
  file:
    - managed
    - makedirs: true
    - source: {{ files_switch( settings.get('prefix', 'varnish'), ['/etc/varnish/' ~ file,
                                          '/etc/varnish/' ~ file ~ '.jinja']) }}
    - template: jinja
    - require:
      - pkg: varnish
    - watch_in:
      - service: varnish
{% endfor %}


# Below we delete the "absent" vcl files and we trigger a reload of varnish
{% for file in settings.get('vcl', {}).get('files_absent', []) %}
/etc/varnish/{{ file }}:
  file:
    - absent
    - require:
      - pkg: varnish
    - watch_in:
      - service: varnish
{% endfor %}
