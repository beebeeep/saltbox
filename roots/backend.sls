uwsgi:
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

python-ct:
  pkg:
    - installed
    - require:
      - pkgrepo: cacus
      - pip: pymongo

pymongo:
  pip:
    - installed

ct-grabber:
  cron.present:
    - user: root
    - minute: '*/30'
    - require:
      - pkg: python-ct

