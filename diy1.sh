# 修复 luci-app-ssr-plus 依赖 bind-dig 的问题
sed -i 's/+bind-dig//' feeds/helloworld/luci-app-ssr-plus/Makefile || true
find feeds -name "Makefile" -path "*/luci-app-ssr-plus/*" -exec sed -i 's/+bind-dig//' {} \; || true
