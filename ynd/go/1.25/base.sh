{% extends '//die/std/ix.sh' %}

{% block go_version %}
1.25.0
{% endblock %}

{% block step_patch %}
(base64 -d | patch -p1) << EOF
{{ix.load_file('//go/1.25/old-coverage.diff') | b64e}}
EOF
{% endblock %}
