{% extends '//ynd/go/1.25/base.sh' %}

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


{% block fetch %}
https://go.dev/dl/go1.25.0.linux-amd64.tar.gz
sha:2852af0cb20a13139b3448992e69b868e50ed0f8a1e5940ee1de9e19a123b613
{% endblock %}

{% block step_build %}
sed -i 's/GOTOOLCHAIN=auto/GOTOOLCHAIN=local/g' go.env
rm -r "test/fixedbugs/issue27836.dir"

export GOOS={{target.os}}
export GOARCH={{target.go_arch}}
bin/go build -o bin/ ./src/cmd/pack
{% endblock %}

{% block install %}
mkdir -p ${out}/pkg/tool/{{self.tool_folder_name().strip()}}
cp -r ${tmp}/src/bin/pack ${out}/pkg/tool/{{self.tool_folder_name().strip()}}
{% endblock %}
