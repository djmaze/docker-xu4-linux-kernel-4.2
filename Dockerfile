FROM armhfbuild/buildpack-deps:jessie

RUN apt-get update \
 && apt-get -y install bc dpkg-dev

RUN git clone --depth 1 https://github.com/tobetter/linux -b odroidxu4-v4.2
WORKDIR linux

RUN make odroidxu4_defconfig
COPY adjust-kernel-config /linux/adjust-kernel-config
RUN ./adjust-kernel-config

RUN make
CMD cp arch/arm/boot/zImage arch/arm/boot/dts/exynos5422-odroidxu4.dtb /target/ && make modules_install INSTALL_MOD_PATH=/target

# Alternatively, try to build Debian packages
#RUN make deb-pkg
#CMD cp /*.deb /target/
