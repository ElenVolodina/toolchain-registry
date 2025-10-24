{% extends '//die/std/ix.sh' %}

{% block go_version %}
1.25.0
{% endblock %}

{% block step_patch %}
(base64 -d | patch -p1) << EOF
{{ix.load_file('//go/1.25/old-coverage.diff') | b64e}}
EOF
{% endblock %}

{% block fetch %}
echo "jdkslad"
echo "fetching"
echo {{self.archive_name().strip()}}
https://go.dev/dl/go{{self.go_version().strip()}}.{{self.archive_name().strip()}}
sha:{{self.archive_hash().strip()}}
{% endblock %}

{% block step_build %}
sed -i 's/GOTOOLCHAIN=auto/GOTOOLCHAIN=local/g' go.env
rm -r "test/fixedbugs/issue27836.dir"
{% endblock %}
