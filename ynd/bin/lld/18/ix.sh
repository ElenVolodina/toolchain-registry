{% extends '//bin/clang/t/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/18/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/zstd
{{super()}}
{% endblock %}

{% block bld_tool %}
lib/llvm/18/tblgen
{% if linux %}
bin/muslstack
{% endif %}
{{super()}}
{% endblock %}

{% block llvm_targets %}
lld
{% endblock %}

{% block configure %}
export PYTHON3=$(command -v python3)
echo ${PYTHON3}
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_INCLUDE_BENCHMARKS=OFF
LLVM_INCLUDE_TESTS=OFF
Python3_EXECUTABLE=${PYTHON3}
{% endblock %}

{% block install %}
{{super()}}
{% if linux %}
muslstack -s 8388608 ${out}/bin/lld
{% endif %}
{% endblock %}
