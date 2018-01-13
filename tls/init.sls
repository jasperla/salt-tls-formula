# -*- coding: utf-8 -*-
# vim: ft=sls

{% set certs = salt['pillar.get']('tls:certs', {}) %}
{% set keys = salt['pillar.get']('tls:keys', {}) %}
{% set chains = salt['pillar.get']('tls:chains', {}) %}

{% for cert in certs.items() %}
{{ cert[0] }}:
  file.managed:
    - path: {{ cert[0] }}
    - user: {{ cert.user | default('root') }}
    - group: {{ cert.group | default('0') }}
    - mode: {{ cert.mode | default('0644') }}
    - contents_pillar: {{ 'tls:certs:' ~ cert[0] ~ ':content' }}
{% endfor %}

{% for key in keys.items() %}
{{ key[0] }}:
  file.managed:
    - user: {{ key.user | default('root') }}
    - group: {{ key.group | default('0') }}
    - mode: {{ key.mode | default('0600') }}
    - contents_pillar: {{ 'tls:keys:' ~ key[0] ~ ':content' }}
{% endfor %}

{% for chain in chains %}
{{ chain[0] }}:
  file.managed:
    - user: {{ chain.user | default('root') }}
    - group: {{ chain.group | default('0') }}
    - mode: {{ chain.mode | default('0644') }}
    - contents_pillar: {{ 'tls:chains:' ~ chain[0] ~ ':content' }}
{% endfor %}
