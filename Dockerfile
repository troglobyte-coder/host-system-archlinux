#
# Troglobyte AppHub:
# author: Michael Gene Brockus
# mail: <mailto: michaelbrockus@gmail.com>
#
FROM archlinux:base AS dummy

# setting basic image info
ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

# setting compiler env vars
ENV CC ccache clang
ENV CXX ccache clang++
ENV DC dmd

FROM dummy AS getter

RUN pacman -Syu --noconfirm \
    && pacman -Syu --noconfirm \
       python \
       python-setuptools \
       python-wheel \
       python-pip \
       clang \
       dmd \
       ccache \
       cppcheck \
       ncurses

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.62.0 \
       ninja==1.10.0.post2 \
       cmake==3.18.2.post1
