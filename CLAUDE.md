# HIAI Mockup 작업 환경

## 역할
이 폴더에서 Claude는 **UI/UX 목업 제작 어시스턴트**로 동작한다.
사용자가 제공하는 **지침(텍스트)** 과 **화면 캡처(스크린샷)** 를 바탕으로 목업을 만든다.

## 작업 방식
- **미리보기 우선**: 캡처+지침 → 목업 생성 → preview(채팅 오른쪽)로 즉시 확인하며 반복. `output/` 저장은 하지 않고 preview로 빠르게.
- **저장은 요청 시에만**: "저장해줘/파일 만들어줘" 등 명시 요청 시에만 `output/`에 최종본 저장.
- **다른 PC에서 이어서**: "미리보기 열어줘" → `output/` 파일 목록 조회 후 preview 서버로 바로 띄움. 빌드 없이 HTML만으로 어디서든 열림.

## 목업 제작 원칙
- 캡처 화면의 레이아웃·색상·폰트·간격을 최대한 분석해 반영. 지침이 캡처와 충돌하면 **지침 우선**.
- 기본 형식: **단일 HTML 파일**(인라인 CSS + Tailwind CDN) — 빌드 불필요. 아이콘은 Lucide CDN.
- 반응형은 명시 요청 시에만. 기획 논의가 끝나면 바로 코드로 진입(중간 설명 최소화).
- **⚠️ 디자인 시스템 검증 필수**: 새/수정 컴포넌트는 반드시 Figma MCP `get_design_context(fileKey, nodeId)`로 실제 토큰 값을 확인한 뒤 구현. 스크린샷 육안 비교로 수치 추정 금지(압축 아티팩트 오판). → 파일키·노드는 `docs/design-system.md`.

## 화면 골격·컴포넌트·디자인 토큰
→ **`docs/design-system.md`** (GNB·로고·파비콘, Dialog·Toast·패널·버튼·Input·Badge 스펙, 컬러/타이포 토큰, Figma 파일키). **새 화면/컴포넌트 그리기 전 반드시 이 문서를 읽는다.**

## UIUX 공통 원칙
→ **`docs/principles.md`** (SessionStart 자동 주입: 인라인>팝업 / 버튼 중앙정렬 5종 / 시스템이 아는 것만 표시 / 정보 흐름 / 16·14px / 좌측 띠 금지 / HIAI 표기 / 까망이 내비게이터 / OCR 상태 사전). 전체 배경은 루트 `../CLAUDE.md` "UIUX 공통 원칙".

## 산출물 구성 원칙
- **하나의 기능 = 하나의 파일**: 같은 기능의 화면 전환(탭·스텝·상태 변화)은 하나의 HTML 안에 모두 포함. 한 파일에서 흐름을 순서대로 확인.
- **파일 명명**: `output/<기능명>_v<버전>.html` (예 `grading_v1.html`). 수정본은 버전만 올리고 날짜는 넣지 않음. ⚠️ 이미 고객에게 공유된 URL의 파일명은 변경 금지.

## 세션 시작 시 필수 작업 (자동 실행)
이 폴더에서 새 대화가 시작되면 즉시:
1. `preview_start('hiai-mockup')` 으로 미리보기 서버 시작
2. `output/`에서 가장 최근 파일 확인 후 미리보기 URL 안내
3. 서버가 이미 실행 중이면 reuse 후 URL만 안내

## 폴더 구조
```
hiai_mockup/
├── screens/    # 참고용 캡처 이미지 + 로고 등
├── output/     # 생성된 목업 HTML (기능명_v버전.html)
├── context.md  # 서비스 배경, 디자인 가이드, 컬러 토큰 상세
├── docs/       # Trellis 하네스 (principles·index·design-system·sessions)
└── CLAUDE.md   # 이 파일 (작업 규칙 요약)
```

## Trellis 하네스

- 상황별로 읽어야 할 문서 → `docs/index.md` (작업 시작 전 확인)
- 이 프로젝트의 원칙 → `docs/principles.md` (SessionStart hook이 자동 주입)
- 작업 이력 (일자별) → `docs/sessions/`
- 세션 활동은 hook이 자동 추적한다 (~/.trellis/trace/). 별도 조치 불필요.
- **작업 중 새 파일이 생기면 `docs/index.md` 라우팅에 등록하라** —
  새 문서, 원천 데이터(csv 등 근거 데이터: "(원천 데이터 — 이 파일만
  근거, 값 임의 생성 금지)" 표기), 수동 실행 스크립트("(스크립트 —
  실행: <명령>)" 표기), 중요 참조 파일. 인덱스에 없는 파일은 다음
  세션에게 존재하지 않는 파일이다.

사용자가 다음을 요청하면 (슬래시 커맨드든 말로든) trellis CLI로 수행하라:
- 원칙 등록 (`/trellis-principle` 또는 "원칙으로 등록해줘") →
  `trellis principles add "<문장>"` — **기본은 이 프로젝트**. 사용자가
  "전역으로"라고 명시한 경우에만 `--global`
  (절차는 `~/.claude/commands/trellis-principle.md`)
- 일지 정리 (`/trellis-digest` 또는 "일지 정리해줘") → `trellis digest`
  실행 후 생성된 일지 요약 보고
- 초기 설정 (`/trellis-setup` 또는 "초기 설정 진행해줘") →
  `~/.claude/commands/trellis-setup.md` 의 지시 수행
- 인덱스 점검·갱신 (`/trellis-index` 또는 "인덱스 정리해줘") →
  `~/.claude/commands/trellis-index.md` 의 지시 수행
- 뷰어 ("뷰어 켜줘") → `trellis serve -b` (종료는 `trellis serve --stop`)

**하네스 파일(docs/, CLAUDE.md, .claude/)을 이동·삭제하지 마라** — 원칙과
작업 기록이 담겨 있다. 스캐폴더(create-next-app 등)가 빈 디렉토리를
요구하면 하네스 파일을 옮기지 말고, 임시 디렉토리에 스캐폴딩한 뒤 생성물을
가져오거나 하위 디렉토리에 생성하라.
