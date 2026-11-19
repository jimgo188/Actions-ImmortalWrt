# 修复 luci-app-ssr-plus 依赖 bind-dig 的问题
sed -i 's/+bind-dig//' feeds/helloworld/luci-app-ssr-plus/Makefile || true
find feeds -name "Makefile" -path "*/luci-app-ssr-plus/*" -exec sed -i 's/+bind-dig//' {} \; || true

# 修复 mihomo 打包阶段的 upx 路径问题
# helloworld 的 mihomo 用 $(STAGING_DIR_HOST)/bin/upx 压缩，但 feeds.conf.default 里
# packages feed 排在前面，upx/host 会解析成 immortalwrt/packages 的 upx，
# 它安装在 staging_dir/hostpkg/bin/upx，导致 Error 127: No such file or directory
sed -i 's#\$(STAGING_DIR_HOST)/bin/upx#$(STAGING_DIR_HOSTPKG)/bin/upx#g' \
  feeds/helloworld/mihomo/Makefile 2>/dev/null || true
