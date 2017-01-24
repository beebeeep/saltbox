nginx:
  pkg:
    - installed
    - name: nginx-full
  service:
    - running
    - reload: True
    - require:
      - pkg: nginx          # note that requirement mentions state declaration and _ID_, not actual pkg name


{% for site, settings in pillar.get('sites', []).items() %}
/etc/nginx/sites-enabled/{{site}}.conf:
  file.managed:
    - source: salt://files/nginx-site.conf
    - template: jinja
    - context:
        site: {{site}}
        settings: {{settings}}
    - mode: 0644
    - user: root
    - group: root
    - watch_in:
      - service: nginx
      - cmd: test_config
{% endfor %}

test_config:
  cmd.wait:
    - name: nginx -t

