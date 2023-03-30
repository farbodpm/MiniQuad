ARG VARIANT=22.04
FROM ubuntu:${VARIANT}
ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Arguments
ARG TOOLCHAIN_VERSION=1.63.0.2
ARG ESP_IDF_VERSION=v4.4.2
ARG ESP_BOARD=esp32,esp32s2,esp32s3
ARG INSTALL_RUST_TOOLCHAIN=install-rust-toolchain.sh

# Install dependencies
RUN apt-get update \
    && apt-get install -y git curl gcc clang ninja-build libudev-dev unzip xz-utils \
    python3 python3-pip python3-venv libusb-1.0-0 libssl-dev pkg-config libtinfo5  libpython2.7 \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# Set users
WORKDIR /root

# Install Rust toolchain, extra crates and esp-idf
ENV PATH=${PATH}:/root/.cargo/bin:/root/opt/bin

ADD  ./install-rust-toolchain.sh \
    /root/${INSTALL_RUST_TOOLCHAIN}
COPY  ./dirnet.patch \
    /root/dirnet.patch

RUN chmod a+x ${INSTALL_RUST_TOOLCHAIN} \
    && ./${INSTALL_RUST_TOOLCHAIN} \
    --extra-crates "ldproxy cargo-espflash" \
    --clear-cache "YES" --export-file ~/export-esp.sh \
    --esp-idf-version "${ESP_IDF_VERSION}" \
    --minified-esp-idf "YES" \
    --build-target "${ESP_BOARD}"



# Activate ESP environment
RUN echo "source /root/export-esp.sh" >> ~/.bashrc \
    && echo "alias vi=/usr/local/bin/nvim" >> ~/.bashrc \
    && echo "alias vim=/usr/local/bin/nvim" >> ~/.bashrc

SHELL ["/bin/bash", "-c"]
CMD [ "/bin/bash", "-c" ]

