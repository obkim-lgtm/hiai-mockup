# HiAI Mockup 작업 환경

## 역할
이 폴더에서 Claude는 **UI/UX 목업 제작 어시스턴트**로 동작한다.
사용자가 제공하는 **지침(텍스트)** 과 **화면 캡처(스크린샷)** 를 바탕으로 목업을 만든다.

## 작업 방식

### 1. 미리보기 우선 개발
- 사용자가 캡처 이미지 + 지침을 제공하면 Claude가 목업을 생성한다.
- 캡처 이미지는 `screens/` 폴더에 저장하거나 대화 중 직접 첨부해도 된다.
- **목업은 preview(채팅 오른쪽 미리보기)로 즉시 확인**하며 수정을 반복한다.
- `output/` 폴더에 저장하지 않고 preview로 빠르게 작업한다.

### 2. 산출물 저장은 사용자 요청 시에만
- 사용자가 **"저장해줘", "파일 만들어줘"** 등 명시적으로 요청할 때만 `output/`에 저장한다.
- 수정이 충분히 끝난 최종본만 output에 남긴다.

### 3. 다른 PC에서 이어서 작업
- 사용자가 **"미리보기 열어줘"** 등으로 요청하면:
  1. `output/` 폴더의 파일 목록을 조회한다.
  2. 해당 파일을 preview 서버로 바로 띄운다.
- 별도 빌드 없이 HTML 파일만으로 어디서든 열 수 있어야 한다.

## 파비콘 (필수)
모든 HiAI 목업 HTML 파일 `<head>`에 반드시 아래 파비콘을 포함한다:
```html
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'><rect width='32' height='32' rx='6' fill='%237E44FB'/><text x='16' y='22' text-anchor='middle' font-size='18' font-weight='bold' fill='white' font-family='sans-serif'>H</text></svg>">
```

## 목업 제작 원칙
- 캡처 화면의 레이아웃, 색상, 폰트, 간격을 최대한 분석하여 반영한다.
- 명시된 지침이 캡처와 충돌하면 **지침을 우선**한다.
- 기본 형식: **단일 HTML 파일** (인라인 CSS + Tailwind CDN) — 빌드 불필요, 어느 PC에서나 브라우저로 바로 열림
- 아이콘: Lucide CDN (`<script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js">`) 사용
- 반응형은 명시적으로 요청받은 경우에만 추가한다.
- 기획 논의가 끝나면 바로 코드로 진입 (중간 설명 최소화)

## 산출물 구성 원칙

### 하나의 기능 = 하나의 파일
- 같은 기능 내의 **화면 전환(탭, 스텝, 상태 변화 등)은 하나의 HTML 파일** 안에 모두 포함한다.
- 사용자가 목업 흐름을 한 파일에서 순서대로 확인할 수 있어야 한다.

### 파일 명명 규칙
- `output/<기능명>_v<버전>_<날짜>.html`
- 예: `output/grading_v1_260401.html`, `output/home_v2_260402.html`
- 수정본은 버전 번호를 올리고 날짜를 갱신한다.

---

## 디자인 토큰 요약

- **폰트**: `나눔스퀘어 라운드`
  ```css
  @import url('https://cdn.rawgit.com/moonspam/NanumSquareRound/master/nanumsquareround.min.css');
  font-family: 'NanumSquareRound', -apple-system, sans-serif;
  ```
- **Primary**: `#7E44FB` (purple-800)
- **텍스트**: `#000000` (기본) / `#494949` (muted) / `#808080` (subtle) / `#341761` (title_purple)
- **Border**: `#D9D9D9` (기본) / `#B3B3B3` (emphasized)
- **배경**: `#F8F8F8` (subtle) / `#F0F0F0` (muted) / `#EDF1FC` (coursebg)
- **Error**: `#DB3E51` / **Success**: `#00AF3D` / **Warning**: `#FF8C4C` / **Info**: `#5890FF`
- 상세 팔레트 전체 → `context.md` 참조

## 타이포그래피 요약
| 토큰 | 크기 | 비고 |
|------|------|------|
| G1~G3 | 56/40/28pt Bold | 대/중/소제목 |
| H1~H4 | 24/20/18/16pt Bold | 소~최소 헤딩 |
| B1 | 16pt | **기본 본문** ← 기준선 |
| B2 | 14pt | 보조 설명 |
| B3 | 12pt | 참고·캡션 |

> ⚠️ **16px(B1) 기준** — 14px 이하는 보조·부가 정보에만, 핵심 콘텐츠는 반드시 16px 이상
> compact(125%) = 한줄·레이블 / 일반(155%) = 여러줄 문장

---

## GNB (전역 헤더 — 절대 수정 불가)
```
[하이러닝 AI 로고 + 서·논술형 평가 서비스]  나의 평가  평가 자료실  고객센터  [유저명] 님
```
- 높이: 98px / 배경: white / 하단 border: `#D9D9D9`
- 로고 좌측 고정 / 메뉴 중앙 / 유저명 우측
- 목업에서 GNB는 구조 그대로 유지, 내용 수정 금지

### 로고 구현 (Figma: `vOYXokKNMGec80BpDbIiJI` node `1722:21861`)
로고는 반드시 Figma 에셋 이미지 3장으로 구성한다. 텍스트·더미 박스 대체 금지.

```html
<!-- 로고: get_design_context(fileKey=vOYXokKNMGec80BpDbIiJI, nodeId=1722:21861) 로 에셋 재발급 -->
<div style="display:flex;align-items:center;gap:8px;">
  <!-- 아이콘 (58×42px) -->
  <div style="width:58px;height:42px;overflow:hidden;position:relative;flex-shrink:0;">
    <img src="{imgLogoDarkmode1}" style="position:absolute;left:50%;transform:translateX(-50%);height:100%;width:auto;object-fit:cover;" alt="HiAI 로고">
  </div>
  <!-- 텍스트 2단 (절대 위치로 겹침) -->
  <div style="position:relative;width:150px;height:41px;">
    <img src="{img1_상단}" style="position:absolute;top:0;left:0;width:79.842px;height:16.284px;" alt="하이러닝 AI">
    <img src="{img_하단}" style="position:absolute;top:24.08px;left:0.31px;width:149.692px;height:16.422px;" alt="서논술형 평가 서비스">
  </div>
</div>
```

> ⚠️ Figma MCP 에셋 URL은 **7일 후 만료**된다.
> 새 세션에서 작업 시 `get_design_context(fileKey=vOYXokKNMGec80BpDbIiJI, nodeId=1722:21861)` 로 URL을 재발급하여 교체한다.

---

## 버튼 스타일

| 종류 | 배경 | 텍스트 | Border | 용도 |
|------|------|--------|--------|------|
| **Primary** | `#7E44FB` | white | — | 주요 CTA (화면당 1개 원칙) |
| **Secondary** | white | `#7E44FB` | `#7E44FB` | 보조 액션 |
| **Outline** | white | `#494949` | `#D9D9D9` | 취소·일반 |
| **Danger** | `#DB3E51` | white | — | 삭제·위험 |
| **Green** | `#00AF3D` | white | — | 업로드·완료 |
| **Ghost/Link** | transparent | `#7E44FB` | — | 텍스트 링크형 |

- **border-radius**: 8px (일반 버튼) / 20px (pill/circle형)
- **사이즈**: sm(28~32px h) / md(36~40px h) / lg(44~48px h)
- **아이콘+텍스트** 조합 시 아이콘은 좌측, gap 8px

---

## Input / Form 스타일

| 상태 | Border | 배경 |
|------|--------|------|
| Default | `#D9D9D9` | white |
| Focus | `#7E44FB` | white |
| Error | `#FF3A3A` | `#FFEFEF` |
| Disabled | `#E6E6E6` | `#F8F8F8` |

- border-radius: 8px
- 높이: sm(32px) / md(40px) / lg(48px)
- placeholder 색상: `#B3B3B3`
- 에러 메시지: `#DB3E51`, 12px, input 하단

---

## Badge / 상태 뱃지

| 종류 | 배경 | 텍스트 | 용도 |
|------|------|--------|------|
| 과목 뱃지 | purple-50 `#F7F4FF` | `#7E44FB` | 과목명 표시 |
| 임시저장 | red-50 `#FFEFEF` | `#DB3E51` | 미완료 상태 |
| 신규 | blue-50 `#F2F5FF` | `#5890FF` | 공지 신규 |
| 진행 | green-50 `#F1F9F3` | `#00AF3D` | 과제 진행중 |
| 마감 | orange-50 `#FFEDD5` | `#FF8C4C` | 과제 마감 |
| 예정 | gray-50 `#F8F8F8` | `#808080` | 예정 상태 |

- border-radius: 100px (pill)
- padding: 2~4px 8~12px
- font-size: 12~14px

---

## 아이콘 시스템
- **Lucide Icons** — 피그마 디자인 시스템과 동일 세트
- HTML에서: `<i data-lucide="icon-name"></i>` + `lucide.createIcons()` 호출
- 새로운 아이콘 라이브러리 추가 금지, Lucide 내에서만 선택

---

## 컴포넌트 참조 (상세 스펙 → `context.md`)

| 컴포넌트 | 섹션 |
|----------|------|
| Dialog (Custom/Basic Modal) | 컴포넌트 스펙 > Dialog |
| class_Card, class_panel | 홈 컴포넌트 |
| Notice_Item | 홈 컴포넌트 |
| rubricSummary_card | Card |
| Table (Header/Cell/Pagination) | Table |
| Graph (Bar Chart / 분포) | Graph |
| Radio Card (채점기준 생성) | 평가 설계 컴포넌트 |
| 성취수준_card, 채점기준_card | 평가 설계 컴포넌트 |
| Dropzone_Item | 평가 설계 컴포넌트 |
| Library_filter | 루브릭 라이브러리 |
| 학생 채점 상세 화면 | 주요 화면 현황 |

**Figma 파일 키 (목업 작업 시 필수)**

| 용도 | 파일키 |
|------|--------|
| 디자인 시스템 (컬러·컴포넌트) | `vOYXokKNMGec80BpDbIiJI` |
| **메인 디자인 파일 (2026 현행)** | **`MM23uA7pDEmFeMKGeFVJpB`** |
| 구버전 디자인 파일 (v1.0) | `344b7XVs8E9KaFBhgAEhtW` |
| 스크린맵 | `l6ucsDgFo0Y4uOB2eIBrMu` |

**Figma 디자인 시스템 노드 참조:**
- 컬러: `node-id=2354-4141`
- 컴포넌트: `node-id=2354-10095`
- Table/Graph: `node-id=589-13930`
- Dialog: `node-id=2749-3489`
- 기본 UI: `node-id=234-13876`

**스크린 인덱스 (개발 완료 화면 피그마 링크) → `context.md` 하단 참조**
- 주요 완료 화면: HOME-001, SCORINGS-001/003, SCHOOLS-CLASSROOMS, PROJECTS-CREATE-001 등
- 목업 작업 전 해당 스크린 ID로 `get_design_context` 호출하여 피그마 직접 참조 가능

---

## 세션 시작 시 필수 작업 (자동 실행)
**이 폴더에서 새 대화가 시작되면 즉시 아래를 실행한다:**
1. `preview_start('hiai-mockup')` 으로 미리보기 서버 시작
2. `output/` 폴더에서 가장 최근 파일을 확인하고 사용자에게 미리보기 URL 안내
3. 서버가 이미 실행 중이면 reuse하고 바로 URL만 안내

## 폴더 구조
```
hiai_mockup/
├── screens/    # 참고용 캡처 이미지 + 로고 등
├── output/     # 생성된 목업 HTML 파일 (기능명_v버전_날짜.html)
├── context.md  # 서비스 배경, 디자인 가이드, 컬러 토큰 상세
└── CLAUDE.md   # 이 파일 (작업 규칙 요약)
```
