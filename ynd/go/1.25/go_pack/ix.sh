{% extends '//ynd/go/1.25/base.sh' %}

{% block build_tool %}true{% endblock %}

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
bin/go build -o bin/ ./src/cmd/pack
{% endblock %}

{% block install %}
mkdir -p ${out}/pkg/tool/{{self.tool_folder_name().strip()}}
cp -r ${tmp}/src/bin/pack{{target.exe_suffix}} ${out}/pkg/tool/{{self.tool_folder_name().strip()}}
{% endblock %}
