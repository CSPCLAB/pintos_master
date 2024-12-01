#!/bin/bash

# 실행 시 전달받은 UID/GID (기본값은 1000)
HOST_UID=${HOST_UID:-1000}
HOST_GID=${HOST_GID:-1000}

# 호스트 GID가 없으면 추가
if ! getent group ${HOST_GID} >/dev/null; then
    groupadd -g ${HOST_GID} hostgroup
fi

# 호스트 UID가 없으면 추가
if ! id -u ${HOST_UID} >/dev/null 2>&1; then
    useradd -u ${HOST_UID} -g ${HOST_GID} -m hostuser
fi

# 소유권 변경 (필요한 경우)
chown -R ${HOST_UID}:${HOST_GID} /pintos

# 사용자로 전환
export HOME=/home/hostuser
exec gosu ${HOST_UID}:${HOST_GID} bash -c "TMOUT=0; exec bash"
