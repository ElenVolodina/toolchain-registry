{% extends '//ynd/go/1.25/base.sh' %}

{% block step_build %}
{{super()}}

rm ${tmp}/src/pkg/tool/cover{{target.exe_suffix}}
{% endblock %}

{% block install %}
mv ${tmp}/src/* ${out}
{% endblock %}