{% extends '//ynd/go/1.25/base.sh' %}

{% set build_pack %}true{% endset %}

{% block tool_folder_name %}
{% if linux and x86_64 %}
    linux_amd64
{% elif linux and aarch64 %}
    linux_arm64
{% elif darwin and x86_64 %}
    darwin_amd64
{% elif darwin and arm64 %}
    darwin_arm64
{% elif mingw32 %}
    windows_amd64
{% endif %}
{% endblock %}

{% block step_build %}
{{super()}}

echo "jdkslad"
ls /
echo "jsdlsda"

export GOOS={{target.os}}
export GOARCH={{target.go_arch}}
bin/go build -o pkg/tool/ ./src/cmd/pack
echo "jfkdlf"
pwd

echo ${out}
{% endblock %}

{% block install %}
echo "dkjslakddddddddddddd"
echo ${tmp}
mkdir testerout
cp -r ${tmp}/pkg/tool/* ${out}/testerout/
{% endblock %}
