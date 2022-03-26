# ZFS for EL9

OpenZFS packages built for EL9 based distros. Tested on CentOS Stream 9.

## Getting Started

```
curl -L -o /etc/yum.repos.d/zfs-el9.repo https://github.com/ThisIsQasim/zfs-el9/raw/main/zfs-el9.repo
yum install -y zfs
```
or if you are running on a kernel that doesn't have a `kmod` package available use `dkms`

```
curl -L -o /etc/yum.repos.d/zfs-el9.repo https://github.com/ThisIsQasim/zfs-el9/raw/main/zfs-el9.repo
yum install -y epel-release
yum install -y zfs zfs-dkms
```

## Building RPMs

If you want to compile packages for your running kernel yourself
```
ZFS_VERSION=2.1.4
docker build --build-arg ZFS_VERSION=${ZFS_VERSION} -t zfs .
docker run --rm -it -v $PWD:/host/ zfs cp -r /zfs/ /host/
```
