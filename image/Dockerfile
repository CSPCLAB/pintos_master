# 베이스 이미지
FROM ubuntu:18.04

# 필요한 패키지 설치 및 gosu 설치
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    bash \
    build-essential \
    gdb \
    gcc \
    emacs \
    vim \
    nano \
    qemu \
    wget \
    xorg-dev \
    libncursesw5 \
    libncurses5-dev \
    dos2unix \
    expect \
    rsync \
    gosu \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# 작업 디렉터리 생성 및 설정
WORKDIR /pintos

# 환경 변수 설정
ENV PINTOS_HOME=/pintos
ENV PATH=/pintos/src/utils:$PATH

# 엔트리포인트 스크립트 복사 및 실행 권한 설정
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 기본 명령
ENTRYPOINT ["/entrypoint.sh"]
