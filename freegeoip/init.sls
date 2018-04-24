/usr/local/bin:
  archive.extracted:
    - source: salt://freegeoip/freegeoip-3.5.gz
    - archive_format: tar
    - mode: 755
    - source_hash: 2a6f818c436dcb9f34cd1e282395d43c
    - enforce_toplevel: False
#    - overwrite: True

freegeoip.service:
  file.managed:
    - name: /etc/systemd/system/freegeoip.service
    - source: salt://freegeoip/freegeoip.service
  module.wait:
    - name: service.systemctl_reload
    - watch:
      - file: /etc/systemd/system/freegeoip.service
  service.running:
    - enable: True
    - require:
      - file: freegeoip.service

