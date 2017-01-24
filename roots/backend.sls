uwgi:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: uwsgi

cacus:
  pkgrepo.managed:
      - name: 'deb http://cacus.northeurope.cloudapp.azure.com/debian common unstable'
      - key_url: http://cacus.northeurope.cloudapp.azure.com/cacus.gpg
