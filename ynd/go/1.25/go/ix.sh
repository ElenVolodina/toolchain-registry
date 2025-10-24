{% extends '//ynd/go/1.25/base.sh' %}

{% set build_pack %}false{% endset %}

{% block install %}
mv ${tmp}/src/* ${out}
{% endblock %}