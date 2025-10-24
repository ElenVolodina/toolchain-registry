{% extends '//ynd/go/1.25/base.sh' %}

{% block build_tool %}false{% endblock %}

{% block install %}
mv ${tmp}/src/* ${out}
{% endblock %}