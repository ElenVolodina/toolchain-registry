{% extends '//ynd/go/1.25/base.sh' %}

{% block build_tool %}true{% endblock %}

{% block step_build %}
{{super()}}

{% if mingw32 %}
export GOOS="windows"
export GOARCH="amd64"
{% else %}
export GOOS={{target.os}}
export GOARCH={{target.go_arch}}
{% endif %}

mkdir bin/tools
bin/go build -o bin/tools ./src/cmd/pack
{% endblock %}

{% block install %}
mkdir -p ${out}/pkg/tool/{{self.tool_folder_name().strip()}}
cp -r ${tmp}/src/bin/tools/* ${out}/pkg/tool/{{self.tool_folder_name().strip()}}
{% endblock %}