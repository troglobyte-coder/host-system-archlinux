FROM archlinux:base

ENV DEBIAN_FRONTEND noninteractive
ENV LANG 'C.UTF-8'
ENV CI 1

RUN pacman -Syu --noconfirm \
    && pacman -Syu --noconfirm \
       python \
       python-setuptools \
       python-wheel \
       python-pip \
       sudo \
       clang \
       gcc11 \
       git \
       ccache \
       cppcheck \
       pkg-config \
       mesa \
       gtk4 \
       ncurses \
       python-pyqt6

RUN pip3 -q install --upgrade pip \
    && python3 -m pip -q install \
       meson==0.62.0 \
       ninja==1.10.0.post2 \
       cmake==3.18.2.post1 \
       pytest==6.1.2 \
       pytest-mock==3.3.1 \
       pytest-xdist==2.1.0
