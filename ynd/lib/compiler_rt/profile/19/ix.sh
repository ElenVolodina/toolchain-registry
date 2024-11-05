{% extends '//lib/compiler_rt/t/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/19/ver.sh' %}
{% endblock %}

{% block cmake_flags %}
{{super()}}
COMPILER_RT_BUILD_BUILTINS=OFF
COMPILER_RT_EXCLUDE_ATOMIC_BUILTIN=OFF
COMPILER_RT_BUILD_SANITIZERS=OFF
COMPILER_RT_BUILD_XRAY=OFF
COMPILER_RT_BUILD_LIBFUZZER=OFF
COMPILER_RT_BUILD_PROFILE=ON
COMPILER_RT_BUILD_CTX_PROFILE=OFF
COMPILER_RT_BUILD_MEMPROF=OFF
COMPILER_RT_BUILD_XRAY_NO_PREINIT=OFF
COMPILER_RT_BUILD_ORC=OFF
COMPILER_RT_CAN_EXECUTE_TESTS=OFF
COMPILER_RT_EXTERNALIZE_DEBUGINFO=OFF
COMPILER_RT_DEFAULT_TARGET_TRIPLE={{target.gnu.three}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
{% endblock %}

{% block env %}
export LDFLAGS="-resource-dir=${out} \${LDFLAGS}"
{% endblock %}
