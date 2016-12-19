/usr/lib/php/20151012/stats.so:
  file.managed:
    - source: salt://php/stats/stats.so
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: php

/etc/php/7.0/mods-available/stats.ini:
  file.managed:
    - source: salt://php/stats/stats.ini
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: php

/etc/php/7.0/cli/conf.d/20-stats.ini:
  file.symlink:
    - target: /etc/php/7.0/mods-available/stats.ini

/etc/php/7.0/apache2/conf.d/20-stats.ini:
  file.symlink:
    - target: /etc/php/7.0/mods-available/stats.ini

