# 🛠️ Pintos 프로젝트 코딩 컨벤션 규칙

## 📋 목차

1. [코드 스타일 기본 규칙](#1-코드-스타일-기본-규칙)
2. [함수 및 변수 이름 규칙](#2-함수-및-변수-이름-규칙)
3. [포매팅 규칙](#3-포매팅-규칙)
4. [주석 작성 규칙](#4-주석-작성-규칙)
5. [Git 커밋 메시지 규칙](#5-git-커밋-메시지-규칙)

---

## 1. **코드 스타일 기본 규칙**

- **코드 포매터**: `ms-vscode.cpptools`
  - 모든 코드 스타일을 **`ms-vscode.cpptools`**를 통해 통일합니다.
  - **`.vscode/settings.json`** 설정 파일로 저장 시 자동 포매팅을 활성화합니다:

    ```json
    {
      "editor.formatOnSave": true,
      "editor.defaultFormatter": "ms-vscode.cpptools",
      "[c]": {
        "editor.defaultFormatter": "ms-vscode.cpptools"
      },
      "[cpp]": {
        "editor.defaultFormatter": "ms-vscode.cpptools"
      }
    }
    ```

  - 팀원은 VSCode에서 이 설정을 유지하여 저장 시 포매팅이 적용되도록 합니다.

- **들여쓰기**:
  - **2 spaces**로 설정 (탭 금지).
  - 들여쓰기는 블록과 논리적 계층 구조를 명확히 하기 위한 것입니다.

- **최대 줄 길이**:
  - 한 줄의 길이는 **80 characters**를 초과하지 않습니다.
  - 길어진 코드는 적절히 줄바꿈합니다.

---

## 2. **함수 및 변수 이름 규칙**

### 2.1 **함수 이름 규칙**

- 함수 이름은 반드시 **명령형**으로 작성합니다.
  - 예: `initialize_thread()`, `calculate_priority()`, `schedule_next_thread()`
- 이름은 함수의 동작을 명확히 설명해야 합니다.
- 동사 + 목적어 형식을 권장합니다.

### 2.2 **변수 이름 규칙**

- 변수 이름은 **명사형**으로 작성합니다.
  - 예: `thread_id`, `ready_queue`, `file_name`
- 변수의 역할을 명확히 드러내며, **snake_case**를 사용합니다.

### 2.3 **상수 이름 규칙**

- 상수는 모두 **대문자**와 **언더스코어**로 작성합니다.
  - 예: `MAX_THREAD_COUNT`, `DEFAULT_PRIORITY`

---

## 3. **포매팅 규칙**

### 3.1 **블록 스타일**

- 모든 블록은 중괄호 `{}`로 감싸야 합니다.
- 중괄호는 같은 줄에 시작합니다:

  ```c
  if (condition) {
    perform_action();
  } else {
    handle_error();
  }


### 3.2 **줄바꿈 및 공백**

- **연산자** 주위에는 공백을 추가합니다:

  ```c
  int total = a + b - c;
  ```

- **함수 호출**에서 인수 사이에는 공백을 사용하지 않습니다:

  ```c
  perform_action(arg1, arg2, arg3);
  ```

- **제어문**과 소괄호 사이에는 공백을 사용하지 않습니다:

  ```c
  if (condition) {
    perform_action();
  }
  ```

### 3.3 **함수 선언**

- 함수 선언과 구현에서 반환형, 함수명, 매개변수는 각각 공백으로 구분합니다:

  ```c
  int calculate_priority(int thread_id);
  ```

- 여러 줄로 함수 매개변수를 작성할 때는 적절히 줄바꿈합니다:

  ```c
  void process_thread(
      int thread_id, 
      const char* thread_name, 
      int priority);
  ```

---

## 4. **주석 작성 규칙**

### 4.1 **파일 헤더 주석**

- 모든 소스 파일의 상단에는 파일 목적과 주요 기능을 설명하는 주석을 추가합니다:

  ```c
  /**
   * thread.c
   * 
   * Implements thread management, including initialization,
   * scheduling, and priority calculation.
   */
  ```

### 4.2 **함수 주석**

- 함수 선언 위에는 다음 형식으로 주석을 작성합니다:

  ```c
  /**
   * Calculates the priority of a thread.
   *
   * @param thread_id The ID of the thread.
   * @return The calculated priority as an integer.
   */
  int calculate_priority(int thread_id);
  ```

### 4.3 **코드 내 주석**

- 복잡하거나 중요한 로직에는 코드 내 주석을 추가합니다:

  ```c
  // Ready queue에서 가장 높은 우선순위의 스레드를 선택
  struct thread* next_thread = select_highest_priority_thread();
  ```

---

## 5. **Git 커밋 메시지 규칙**

### 5.1 **Conventional Commits 스타일**

- 커밋 메시지는 **Conventional Commits** 규칙을 따릅니다:

  ```
  <타입>: <변경 내용>
  
  <본문>
  ```

- **타입**:
  - `feat`: 새로운 기능 추가
  - `fix`: 버그 수정
  - `docs`: 문서 수정
  - `style`: 코드 포매팅, 세미콜론 누락 등 비즈니스 로직에 영향을 주지 않는 변경
  - `refactor`: 코드 리팩토링 (기능 변경 없음)
  - `test`: 테스트 코드 추가 또는 수정
  - `chore`: 기타 변경 사항 (빌드 설정, 패키지 업데이트 등)

### 5.2 **커밋 메시지 예시**

1. **기능 추가**:

   ```
   feat: Implement basic thread management

   - Added thread initialization function
   - Implemented thread scheduling logic
   ```

2. **버그 수정**:

   ```
   fix: Resolve race condition in thread priority calculation

   - Fixed a race condition occurring when multiple threads
     update the ready queue simultaneously.
   ```

---

## 📖 추가 참고사항

- **문서화 필수**:
  - 구현한 모든 함수와 모듈에 대해 적절한 주석을 작성합니다.
  - 변경 사항은 `docs/` 디렉터리에 기록합니다.
- **리뷰 프로세스**:
  - 모든 Pull Request는 최소 1명의 리뷰어가 승인한 후 병합합니다.

---
