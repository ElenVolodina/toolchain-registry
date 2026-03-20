{% extends '//bin/ast-index/unwrap/ix.sh' %}

{% block pkg_name %}
ast-index
{% endblock %}

{% block version %}
3.29.1
{% endblock %}

{% block cargo_url %}
https://github.com/defendend/Claude-ast-index-search/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
aa9eedf13b2e0429f85dc8f195ab8edd0c0e34bbc9a5f2ae66190b05e0e1b4d7
{% endblock %}

{% block cargo_bins %}
ast-index
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/compiler
{% endblock %}

{% block bld_libs %}
lib/c
{{super()}}
{% endblock %}

{% block host_libs %}
lib/c
{{super()}}
{% endblock %}

{% block cargo_tool %}
bld/rust/88
{% endblock %}
