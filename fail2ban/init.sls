{% from "fail2ban/map.jinja" import fail2ban with context %}

fail2ban:
  {% if fail2ban.use_pip %}
  pip.installed:
    - name: git+https://github.com/fail2ban/fail2ban.git@0.9.4
  service.running:
    - name: {{ fail2ban.service }}
    - enable: True
  {% else %}
  pkg.installed:
    - name: {{ fail2ban.package }}
  service.running:
    - name: {{ fail2ban.service }}
    - enable: True
    - require:
      - pkg: fail2ban
  {% endif %}