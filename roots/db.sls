mongodb:
  pkg:
    - installed
    - name: mongodb-server
  service:
    - running
    - require:
      - pkg: mongodb

/etc/mongodb.conf:
  file.replace:
    - pattern: bind_ip.*
    - repl: bind_ip = {{ grains.get('ipv4')|join(', ') }}
    - watch_in:
      - service: mongodb

