
# 🛠️ Pintos 프로젝트

## 📚 프로젝트 개요

Pintos는 운영체제의 기본 개념을 학습하고 직접 구현해보는 교육용 프로젝트입니다. 이 레포지토리는 Pintos의 다양한 기능을 구현하고 협업을 통해 OS의 동작 원리를 이해하는 것을 목표로 합니다.

---

## 📂 레포지토리 구조

```
📦 pintos-study
├── src/            # Pintos 소스 코드
├── study/           # 프로젝트 문서 및 회의록
│   ├── weekly_reports/   # 주간 작업 보고서
│   └── coding_conventions.md # 코딩 컨벤션
├── tests/          # 테스트 코드
└── README.md       # 레포지토리 개요
```

---

## 🚀 시작하기

### 1. **필수 도구 설치**

- **Linux 환경** (권장)
  - Docker base (AMD64)

### 2. **레포지토리 클론**

```bash
git clone https://github.com/CSPCLAB/pintos_master.git
cd pintos-master
```

### 3. **빌드 및 실행**

1. 환경 설정 스크립트 실행:

   ```bash
   ./start_pintos.sh
   ```

1. 프로젝트 디렉터리로 이동:

   ```bash
   cd src/threads
   ```

2. 빌드:

   ```bash
   make
   ```

3. 실행:

   ```bash
   pintos run alarm-multiple
   ```

---

## 🧑‍💻 협업 규칙

- **브랜치 전략**:
  - `main`: 항상 동작 가능한 상태의 코드 유지
  - `dev`: 주요 기능 병합 전에 사용
  - `feature/[이름]/[작업내용]`: 개인 작업 브랜치
- **커밋 메시지**:
  - Conventional Commits 스타일 사용
  - 예: `feat: Implement thread initialization`
- **코딩 스타일**:
  - 세부 규칙은 [컨벤션 규칙](study/coding_conventions.md) 참고

---

## 📖 문서

- [코딩 컨벤션](study/coding_conventions.md)
- [주간 보고서](study/weekly_reports/)
- [문서](study/)

---

## 🧪 테스트

모든 구현은 테스트를 통해 검증해야 합니다. 테스트 코드는 `tests/` 디렉터리에 작성합니다.

### 테스트 실행

1. 디렉터리로 이동:

   ```bash
   cd src/tests
   ```

2. 테스트 실행:

   ```bash
   pintos run <test-name>
   ```

---
