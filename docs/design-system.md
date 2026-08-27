# HIAI 디자인 시스템 · 컴포넌트 스펙

> 목업의 화면 골격·컴포넌트·토큰 상세. 새 화면/컴포넌트를 그리기 전 이 문서를 읽는다.
> 수치가 필요한 속성(색·radius·spacing·font-size)은 육안 추정 금지 → Figma MCP `get_design_context`로 확인.

## 디자인 토큰 요약

- **폰트**: `나눔스퀘어 라운드`
  ```css
  @import url('../screens/fonts.css');
  font-family: 'NanumSquareRound', -apple-system, sans-serif;
  ```
- **Primary**: `#0950A0` (blue-800) — hover/눌림 `#00319F`, 링크·텍스트 버튼 `#0A4A94`
- **텍스트**: `#000000` (기본) / `#494949` (muted) / `#808080` (subtle) / `#0A2A5E` (title_dark)
- **Border**: `#D9D9D9` (기본) / `#B3B3B3` (emphasized)
- **배경**: `#F8F8F8` (subtle) / `#F0F0F0` (muted) / `#EDF3FC` (coursebg)
- **Error**: `#DB3E51` / **Success**: `#00AF3D` / **Warning**: `#FF8C4C` / **Info**: `#00778B`
- 상세 팔레트 전체 → `../context.md` 참조

> ⚠️ **2026-08-27 새 로고 CI에 맞춰 보라 → 블루 전면 교체(디자이너 컨펌).**
> 보라(`#7E44FB`·`#B28FFD`·`#341761`·`#8751FA` 등)와 옛 안내색 `#5890FF`는 폐기.
> 시멘틱 토큰 이름은 `purple/…` 그대로지만 값은 블루다 — 이름 보고 보라를 넣지 말 것.
> 팔레트 근거·명도 대비값은 `../output/colorchip_blue.html`.
> 볼드는 **700**만 쓴다 — ExtraBold(800) 토큰은 없다.

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
    <img src="{imgLogoDarkmode1}" style="position:absolute;left:50%;transform:translateX(-50%);height:100%;width:auto;object-fit:cover;" alt="HIAI 로고">
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

### 파비콘 (favicon)
- **반드시** `screens/favicon_src.png` 를 파비콘으로 사용한다.
- 새로 생성하거나 다른 아이콘으로 대체 절대 금지.
- 모든 목업 HTML `<head>`에 아래 한 줄 포함:
```html
<link rel="icon" href="../screens/favicon_src.png" type="image/png">
```
> output/ 하위 파일 기준 상대경로. index.html에서 직접 참조 시 `href="screens/favicon_src.png"`

---

## Dialog (모달 팝업) 스펙

> Figma: `vOYXokKNMGec80BpDbIiJI` node `2749:3489`

### 구조
```
[헤더]  pt:24px, px:24px, pb:16px
  타이틀 (H3 18px Bold, color:#222631)
  X 닫기 버튼 (absolute, top:11px, right:11px, 36×36px, radius:6px)

[바디]  px:24px, pb:24px — 콘텐츠 자유 구성

[푸터]  px:24px, pt:8px, pb:16px, 버튼 우측 정렬, gap:12px
  취소: border #7FB3E8, text #0950A0, bg transparent, h:40px, radius:8px
  확인/저장: bg #0950A0, text white, h:40px, radius:8px
```

### 컨테이너
- `background: white`, `border-radius: 24px`
- `box-shadow: 0 4px 12px rgba(95,102,178,0.16)`
- 오버레이: `background: rgba(0,0,0,0.4)`, `position:fixed; inset:0; z-index:1000`
- 오버레이 클릭 시 닫힘 처리 권장

### 비활성 필드 (수정 불가)
- input/select: `background:#F8F8F8; border:1px solid #E6E6E6; color:#B3B3B3; cursor:not-allowed`
- 필드 레이블 옆 "수정 불가" 뱃지: `background:#F0F0F0; color:#B3B3B3; font-size:11px; border-radius:4px; padding:1px 6px`

---

## Toast (알림 메시지) 스펙

> Figma: `vOYXokKNMGec80BpDbIiJI` node `965-40814` / `965-40823`

### 타입별 스펙

| 타입 | 배경 | 텍스트 색상 | 아이콘 (Lucide) |
|------|------|-------------|-----------------|
| **success** | `#00AF3D` | white | `circle-check-big` 20×20 white |
| **error** | `#DB3E51` | `#F8F8F8` | `circle-alert` 20×20 white |
| **info** | white | `#333` | AlertIcon 28×28 (별도 이미지) |
| **warning** | white | `#333` | AlertIcon 28×28 (별도 이미지) |

### 공통 구조
```
padding: 16px(상하) 24px(우) 16px(좌)   ← success/error
gap: 12px  |  border-radius: 8px  |  width: 384px
box-shadow: 0 0 1px #494949, 0 8px 32px rgba(95,102,178,0.16)
font: NanumSquareRound Bold 16px, line-height: 1.55
```

### HTML 패턴
```html
<!-- 토스트 엘리먼트 (fixed, z-index:9999) -->
<div id="toast" class="toast toast-success">
  <i id="toast-icon" data-lucide="circle-check-big" style="width:20px;height:20px;color:white;flex-shrink:0;"></i>
  <span id="toast-msg">메시지</span>
</div>
```
```javascript
// 호출 방법
showToast('success', '저장되었습니다.');
showToast('error', '오류가 발생했습니다.');
```
- 노출 시간: 2500ms 후 자동 사라짐
- 위치: `position:fixed; bottom:80px; left:50%; transform:translateX(-50%)`
- 애니메이션: opacity + translateY(12px→0) 0.2s ease

---

## 패널 (콘텐츠 컨테이너) 스펙

> Figma: `344b7XVs8E9KaFBhgAEhtW` node `3271:24976`

```css
/* 탭 바로 아래 메인 콘텐츠 패널 */
background: white;
border-radius: 0 0 20px 20px;     /* 탭과 연결되는 하단 패널 */
padding: 28px 24px;                /* py=28px, px=24px — 반드시 준수 */
box-shadow: 0 4px 36px rgba(95,102,178,0.16);
```

### Heading_title_set (패널 헤더 타이틀 행)

> Figma: `344b7XVs8E9KaFBhgAEhtW` node `3271:24976` → `items-center`

패널 상단에 제목(H1 24px) + 설명 텍스트(좌측) / 버튼 그룹(우측)이 함께 있는 행은 반드시:

```css
display: flex;
justify-content: space-between;
align-items: center;   /* ← 반드시 center. flex-start 금지 */
```

> ⚠️ `align-items:flex-start` 로 하면 버튼이 타이틀 텍스트 상단에만 붙어 시각적으로 위로 떠 보임.
> 카드 내부 아이콘+긴 텍스트 조합처럼 top-align이 의도적인 경우와 혼동 금지.

> ⚠️ `px-[40px]` 등 임의 확장 금지. 좌우 패딩은 항상 `24px`.

---

## 화면마다 고유 URL (해시 라우팅) — 필수

> 실제 서비스처럼 **화면·탭·스텝이 바뀌면 URL도 바뀌어야** 한다. 한 파일에 여러 화면을 담는 목업 구조상 URL이 전부 같아지기 쉬운데, 그러면 특정 화면을 링크로 공유할 수 없고 새로고침 시 첫 화면으로 튄다. (2026-07-28 올립 지적)

**규칙**
1. 모든 씬·탭·스텝·주요 모달에 고유 해시 부여 (`#task` `#list` `#upload` `#design` …). 상세 화면은 대상 id까지: `#ocr-b=10102`. 데모 케이스는 `#case=ocrFew`.
2. **양방향 필수** — 화면 전환 시 해시를 쓰고(write), 그 URL로 진입하면 화면이 복원돼야(read) 한다.
3. **`hashchange` 리스너 필수** — 이미 열린 탭에 링크를 붙여넣어도 이동해야 한다.
4. 되쓰기 방지 가드(`_suppressHash`) — 해시로 라우팅하는 동안 화면 전환 코드가 주소창 값을 덮어쓰지 않게.
5. `history.replaceState` 사용 (목업 화면 전환으로 뒤로가기 히스토리를 오염시키지 않음).
6. 기존 `?id=`·`?screen=` 쿼리 진입점은 호환 유지하되, 새 진입점은 해시로 통일.

```js
var SCREEN_HASH = { 'screen-task':'#task', 'screen-list':'#list', /* … */ };
var _suppressHash = false;
function setHash(h){ if(_suppressHash || location.hash===h) return;
  history.replaceState(null,'',location.pathname+location.search+h); }

function showScreen(id){ /* …화면 전환… */ if(SCREEN_HASH[id]) setHash(SCREEN_HASH[id]); }

function routeHash(hash){
  if(!hash) return; _suppressHash = true;
  try { if(hash==='#list') goToList(); /* … */ }
  finally { _suppressHash = false; }
}
window.addEventListener('hashchange', function(){ routeHash(location.hash); });
```

**권위 소스**: `output/task_ocr_review_v2.html`(5화면 + 13 데모 케이스), `output/evaluation_design_v4_260713.html`(`_syncHash` + `routeFromUrl`, `?screen=` 호환).
**미적용 잔여**(발견 시 보강): `evaluation_design_v2/v3_260403`(8화면 무URL) · `scoring_list_v1`·`scoring_student_v1`(쿼리 기반이라 같은 폴더 해시 관례와 불일치).

---

## 버튼 스타일

> Figma: `vOYXokKNMGec80BpDbIiJI` node `2474:1703` / `344b7XVs8E9KaFBhgAEhtW` node `3271:25003`

| 종류 | 배경 | 텍스트 | Border | 용도 |
|------|------|--------|--------|------|
| **Primary** | `#0950A0` | white | — | 주요 CTA (화면당 1개 원칙) |
| **Secondary** | white | `#0950A0` | `#7FB3E8` | 보조 액션 |
| **Outline** | white | `#494949` | `#D9D9D9` | 취소·일반 |
| **Danger** | `#DB3E51` | white | — | 삭제·위험 |
| **Green** | `#00AF3D` | white | — | 업로드·완료 |
| **Ghost/Link** | transparent | `#0950A0` | — | 텍스트 링크형 |

```css
/* 공통 버튼 토큰 (Figma 기준) */
height: 36px;
padding: 0 16px;       /* spacing/4 — 패널 헤더 CTA */
/* padding: 0 12px;   ← spacing/3 — 컨트롤바 등 좁은 영역 */
border-radius: 8px;    /* radius/lg */
font: NanumSquareRound Bold 16px;
gap: 8px;              /* 아이콘-텍스트 간격 */
```

- **border-radius**: 8px (일반 버튼) / 20px (pill/circle형)
- **높이**: 36px (md, 기본) — `44px` 등 임의 확장 금지
- **아이콘+텍스트** 조합 시 아이콘은 좌측, gap 8px, 아이콘 크기 20×20px

---

## Input / Form 스타일

| 상태 | Border | 배경 |
|------|--------|------|
| Default | `#D9D9D9` | white |
| Focus | `#0950A0` | white |
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
| 과목 뱃지 | purple-50 `#F3F9FF` | `#0950A0` | 과목명 표시 |
| 임시저장 | red-50 `#FFEFEF` | `#DB3E51` | 미완료 상태 |
| 신규 | blue-50 `#F2F7FF` | `#00778B` | 공지 신규 |
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

## 컴포넌트 참조 (상세 스펙 → `../context.md`)

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

**스크린 인덱스 (개발 완료 화면 피그마 링크) → `../context.md` 하단 참조**
- 주요 완료 화면: HOME-001, SCORINGS-001/003, SCHOOLS-CLASSROOMS, PROJECTS-CREATE-001 등
- 목업 작업 전 해당 스크린 ID로 `get_design_context` 호출하여 피그마 직접 참조 가능
