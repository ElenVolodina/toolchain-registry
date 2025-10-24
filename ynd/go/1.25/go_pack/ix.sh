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

export GOOS={{target.os}}
export GOARCH={{target.go_arch}}
bin/go build -o pkg/tool ./src/cmd/pack
sleep 360
{% endblock %}

{% block install %}
mkdir testerout
mv ${tmp}/pkg/tool/* ${out}/testerout
#cp ${tmp}/pkg/tool/pack{{target.exe_suffix}} ${out}/pkg/tool/{{self.tool_folder_name().strip()}}
{% endblock %}
