### 1. JDK 설치
```bash
# 1. src 폴더로 이동 (없으면 생성)
mkdir -p /c/src
cd /c/src

# 2. OpenJDK 다운로드 (curl 사용)
curl -O https://download.java.net/java/GA/jdk21/fd227225501a4c40873d0c0c7a03e980/35/GPL/openjdk-21_windows-x64_bin.zip

# 3. 압축 풀기
unzip openjdk-21_windows-x64_bin.zip

# 4. 환경 변수 등록 (현재 세션용) - 나중에는 윈도우 환경변수에 추가해야 함
export JAVA_HOME="/c/src/jdk-21"
export PATH="$JAVA_HOME/bin:$PATH"
```

### 2. Android Command Line Tools 설치
```bash
# 1. 폴더 생성
mkdir -p /c/src/android-sdk/cmdline-tools

# 2. 도구 다운로드
cd /c/src/android-sdk/cmdline-tools
curl -O https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip

# 3. 압축 풀기
unzip commandlinetools-win-11076708_latest.zip

# 4. 폴더 구조 맞추기 (이걸 안 하면 에러가 납니다)
mv cmdline-tools latest
mkdir -p /c/src/android-sdk/cmdline-tools/latest
# (위 과정에서 폴더 구조가 android-sdk/cmdline-tools/latest/bin... 이 되도록 정리해야 함)
```

### 3. SDK 구성 요소 다운로드 (sdkmanager)
```bash
# 1. 도구 위치로 이동
cd /c/src/android-sdk/cmdline-tools/latest/bin

# 2. 필수 패키지 설치 (중간에 y/n 나오면 y 입력)
# - platform-tools: adb 등 포함
# - build-tools: 앱 빌드용
# - platforms: 안드로이드 OS 버전
./sdkmanager.bat --sdk_root="C:/src/android-sdk" "platform-tools" "build-tools;34.0.0" "platforms;android-34"
```
> **오류 시 버전 변경 필요**

### 4.  Flutter와 Android SDK 연결
```bash
flutter config --android-sdk "C:/src/android-sdk"
flutter config --jdk-dir "C:/src/jdk-21"
```

### 5. 환경변수 설정
  1. Windows 검색창에 "시스템 환경 변수 편집"
  2. 환경 변수 버튼 클릭
  3. 시스템 변수 섹션에 Path 편집 (java, SDK, flutter)
  4. Flutter\bin 경로 입력 (예시 : C:\src\flutter\bin)
  5. 경로 확인
    Git Bash 사용 시 Bash 재시작
```
which flutter
flutter --version
# 경로 확인 시 성공
```

### 6. 라이선스 승인 (CLI)
```bash
flutter doctor --android-licenses
# 이후 나오는 모든 질문에 y 입력
```

### 7. 최종 확인
```bash
flutter doctor

# App 실행 (chrome 선택)
flutter run
```