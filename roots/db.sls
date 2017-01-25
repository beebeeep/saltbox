mongodb:
  pkg:
    - installed
    - name: mongodb-server
  service:
    - running
    - require:
      - pkg: mongodb
      - file: /etc/mongodb.conf

/etc/mongodb.conf:
  file.replace:
    - pattern: bind_ip.*
    - repl: bind_ip = {{ grain.get('ipv4')|join(', ') }}

