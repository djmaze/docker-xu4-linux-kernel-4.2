# Linux kernel 4.2 for ODROID-XU4

This Docker image must be run on an armhf machine. It builds the [experimental 4.2 kernel](http://odroid.com/dokuwiki/doku.php?id=en:xu4_building_kernel) for the ODROID-XU4.

The stock Kernel config is adjusted so it can run Docker. See the [patch script](adjust-kernel-config) for details.

## How to get the kernel

When running the image, the kernel, firmwarme files and modules are written to the `/target` folder in the container. So you can just bind-mount a directory as a volume for the output:

    docker build -t xu4-linux-kernel-4.2 .
    docker run -it -v $PWD/output:/target xu4-linux-kernel-4.2

Afterwards, the `./output` directory will contain all the artifacts.
