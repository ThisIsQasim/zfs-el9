FROM quay.io/centos/centos:stream9
RUN dnf install --skip-broken -y \
       epel-release \
       gcc \
       make \
       autoconf \
       automake \
       libtool \
       rpm-build \
       kernel-rpm-macros \
       libtirpc-devel \
       libblkid-devel \
       libuuid-devel \
       libudev-devel \
       openssl-devel \
       zlib-devel \
       libaio-devel \
       libattr-devel \
       elfutils-libelf-devel \
       kernel-devel-$(uname -r) \
       python3 \
       python3-devel \
       python3-setuptools \
       python3-cffi \
       libffi-devel \
       https://kojihub.stream.centos.org/kojifiles/packages/ncompress/4.2.4.4/21.el9/x86_64/ncompress-4.2.4.4-21.el9.x86_64.rpm
RUN dnf install --skip-broken -y \
       --enablerepo=epel \
       --enablerepo=powertools \
       --enablerepo=crb \
       python3-packaging \
       dkms \
       libtirpc-devel
ARG ZFS_VERSION=2.1.4
RUN curl -LO https://github.com/openzfs/zfs/releases/download/zfs-${ZFS_VERSION}/zfs-${ZFS_VERSION}.tar.gz && \
    tar xzf zfs-${ZFS_VERSION}.tar.gz && \
    rm -rf zfs-${ZFS_VERSION}.tar.gz.
RUN cd zfs-${ZFS_VERSION} && \
    sed -i 's/CDDL/GPL/g' META && \
    ./configure && \
    make -j1 rpm-utils rpm-dkms rpm-kmod && \
    mkdir /zfs/ && mv *.rpm /zfs/
