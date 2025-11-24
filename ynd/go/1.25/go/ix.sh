{% extends '//ynd/go/1.25/base.sh' %}

{% block install %}
rm ${tmp}/src/pkg/tool/cover{{target.exe_suffix}}
mv ${tmp}/src/* ${out}
{% endblock %}