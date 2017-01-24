mongodb:
  pkg:
    - installed
    - name: mongodb-server
  service:
    - running
    - require:
      - pkg: mongodb
