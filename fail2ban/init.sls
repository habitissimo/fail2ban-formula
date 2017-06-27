{% from "fail2ban/map.jinja" import fail2ban with context %}

fail2ban:
  {% if fail2ban.use_pip %}
    - name: git+https://github.com/fail2ban/fail2ban.git@0.10
    - require:
      - pkg: python-pip
  {% else %}
  pkg.installed:
    - name: {{ fail2ban.package }}
  {% endif %}
  service.running:
    - name: {{ fail2ban.service }}
    - enable: True
    - require:
      - pkg: fail2ban

