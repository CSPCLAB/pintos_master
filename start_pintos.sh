#!/bin/bash

# 사용자의 이름이나 고유한 값을 사용하여 컨테이너 이름 설정
USER_NAME=$(whoami)
CONTAINER_NAME="pintos_${USER_NAME}"
DOCKERFILE_PATH="./Dockerfile.runner"
IMAGE_NAME="custom-pintos"  # 새로 작성한 이미지 이름

# 호스트의 UID와 GID 가져오기
HOST_UID=$(id -u)
HOST_GID=$(id -g)

# Dockerfile 생성
cat <<EOF > ${DOCKERFILE_PATH}
# 베이스 이미지로 Ubuntu 18.04 사용
FROM ubuntu:18.04

# 빌드 인자: UID와 GID를 스크립트에서 전달받음
ARG UID
ARG GID

# 필요한 패키지 설치
RUN apt-get update \\
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \\
    bash \\
    build-essential \\
    gdb \\
    gcc \\
    emacs \\
    vim \\
    nano \\
    qemu \\
    wget \\
    xorg-dev \\
    libncursesw5 \\
    libncurses5-dev \\
    dos2unix \\
    expect \\
    rsync \\
 && apt-get clean \\
 && rm -rf /var/lib/apt/lists/*

# 호스트 사용자와 동일한 UID/GID로 사용자 생성
RUN groupadd -g \${GID} pintosgroup && \\
    useradd -m -u \${UID} -g pintosgroup pintosuser

# Pintos 소스 디렉터리 생성
RUN mkdir -p /pintos/src

# 작업 디렉터리 설정
WORKDIR /pintos

# 환경 변수 설정
ENV PINTOS_HOME=/pintos
ENV PATH=/pintos/src/utils:\$PATH

# 사용자 권한 설정
USER pintosuser

# 기본 명령
CMD ["bash"]
EOF

echo "Dockerfile 생성 완료."

# Docker 이미지 빌드
echo "Docker 이미지를 빌드합니다..."
docker build -t ${IMAGE_NAME} -f ${DOCKERFILE_PATH} --build-arg UID=${HOST_UID} --build-arg GID=${HOST_GID} .
if [ $? -ne 0 ]; then
    echo "Docker 이미지 빌드에 실패했습니다."
    exit 1
fi
echo "Docker 이미지(${IMAGE_NAME}) 빌드 완료."

# 기존 컨테이너가 있다면 삭제
EXISTING_CONTAINER=$(docker ps -a --filter "name=${CONTAINER_NAME}" --format "{{.ID}}")
if [ -n "$EXISTING_CONTAINER" ]; then
    echo "기존 컨테이너(${CONTAINER_NAME})가 존재합니다. 삭제를 진행합니다..."
    docker rm -f ${CONTAINER_NAME}
    echo "기존 컨테이너가 삭제되었습니다."
fi

# 컨테이너 실행
echo "컨테이너(${CONTAINER_NAME})를 실행합니다..."
docker run -itd \
    --name ${CONTAINER_NAME} \
    --hostname ${CONTAINER_NAME} \
    -v $(pwd):/pintos \
    -w /pintos \
    ${IMAGE_NAME} bash -c "TMOUT=0; exec bash"

if [ $? -ne 0 ]; then
    echo "컨테이너 실행에 실패했습니다."
    exit 1
fi

echo "컨테이너(${CONTAINER_NAME})가 성공적으로 실행되었습니다."

# 실행된 컨테이너로 bash 접속
docker exec -it ${CONTAINER_NAME} bash
