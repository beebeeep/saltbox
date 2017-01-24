nginx:
  pkg:
    - installed
    - name: nginx-full
  service:
    - running
    - reload: True
    - require:
      - pkg: nginx          # note that requirement mentions state declaration and _ID_, not actual pkg name


{% for site in pillar.get('sites', []) %}
site-{{site}}:
  file.managed:
    - source: salt://files/nginx-site.conf
    - template: jinja
    - mode: 0644
    - user: root
    - group: root
{% endfor %}
