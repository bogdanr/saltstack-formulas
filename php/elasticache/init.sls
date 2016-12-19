/usr/lib/php/20151012/amazon-elasticache-cluster-client.so:
  file.managed:
    - source: salt://php/elasticache/amazon-elasticache-cluster-client.so
    - mode: 644
    - user: root
    - group: root

/etc/php/7.0/mods-available/memcached.ini:
  file.managed:
    - source: salt://php/elasticache/memcached.ini
    - mode: 644
    - user: root
    - group: root

/etc/php/7.0/cli/conf.d/20-memcached.ini:
  file.symlink:
    - target: /etc/php/7.0/mods-available/memcached.ini

/etc/php/7.0/apache2/conf.d/20-memcached.ini:
  file.symlink:
    - target: /etc/php/7.0/mods-available/memcached.ini

