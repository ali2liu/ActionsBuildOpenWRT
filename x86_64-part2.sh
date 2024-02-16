#!/bin/bash

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# ==========openclash===========
#cd package
#git clone --depth=1 --filter=blob:none --sparse https://github.com/vernesong/OpenClash.git
#cd OpenClash
#git sparse-checkout set luci-app-openclash

# Custom patch
cd openwrt
cp $GITHUB_WORKSPACE/912-skipping-wrong-addresses-causes-service-to-exit.patch ./build_dir/target-x86_64_musl/dnsmasq-full/dnsmasq-2.88/
patch -p1 < ./build_dir/target-x86_64_musl/dnsmasq-full/dnsmasq-2.88/912-skipping-wrong-addresses-causes-service-to-exit.patch
