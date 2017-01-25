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
      - file: /etc/ct.yml

/etc/ct.yml:
  file.serialize:
    - mode: 0644
    - formatter: yaml
    - dataset:
        db:
          host: {{ pillar.get('dbs', 'localhost') }}
          port: 27017
