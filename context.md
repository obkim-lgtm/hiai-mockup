# HiAI Mockup - 프로젝트 맥락

## 서비스 개요
**HiAI (하이러닝 AI 서·논술형 평가 서비스)**
- 교사가 서·논술형 평가를 설계·채점·분석하는 교육 SaaS
- AI 채점 보조 기능 포함 (루브릭 생성, AI 채점, 피드백 생성)
- 주요 사용자: 교사 (평가 설계 → 과제 배포 → AI 채점 → 결과 리포트)

## 핵심 플로우
```
선생님홈 → 수업 선택 → 평가 설계 → 과제물 관리 → AI 채점 → 평가 리포트
```
- 평가 설계: 루브릭(채점기준) 생성 → 평가계획 완성
- AI 채점: 학생 과제물 업로드 → AI 1차 채점 → 교사 검토·수정 → 저장

## 주요 화면 현황

→ 아래 **스크린 인덱스** 섹션에 전체 피그마 링크 포함

## 핵심 설계 원칙
- 한 화면 = 한 가지 핵심 행동
- 다음 단계가 항상 명확하게 보일 것
- 기획 논의가 끝나면 바로 코드로 진입 (중간 설명 최소화)

## 목업 작성 규칙
- 기본 형식: 단일 HTML 파일 (Tailwind CDN + 인라인 CSS)
- 반드시 포함: 실제 데이터 예시, 빈 상태(empty state), 버튼 클릭 후 흐름

## 피해야 할 것
- 설정 화면처럼 복잡한 UI / 옵션 과다 노출
- 교육 현장과 동떨어진 용어

## 디자인 토큰

### 폰트
- **나눔스퀘어 라운드** (피그마 디자인 시스템 기준)
- CDN 임포트:
  ```css
  @import url('https://cdn.rawgit.com/moonspam/NanumSquareRound/master/nanumsquareround.min.css');
  font-family: 'NanumSquareRound', -apple-system, sans-serif;
  ```

### 타이포그래피 (피그마 실측 기준)

#### Heading 토큰
| 토큰 | 크기 | Weight |
|------|------|--------|
| G1 | **56pt / 3.5rem** | Bold |
| G2 | **40pt / 2.5rem** | Bold |
| G3 | **28pt / 1.75rem** | Bold |
| H1 | **24pt / 1.5rem** | Bold |
| H2 | **20pt / 1.25rem** | Bold |
| H3 | **18pt / 1.125rem** | Bold |
| H4 | **16pt / 1rem** | Bold |

#### Body 토큰
| 토큰 | 크기 | Weight | Line Height | 용도 |
|------|------|--------|-------------|------|
| B1_bold_compact | 16pt / 1rem | Bold | 125% | 한줄 본문 (굵게) |
| B2_bold_compact | 14pt / 0.875rem | Bold | 125% | 한줄 보조 (굵게) |
| B3_bold_compact | 12pt / 0.75rem | Bold | 125% | 한줄 참고 (굵게) |
| B1_bold | 16pt / 1rem | Bold | 155% | 문장 본문 (굵게) |
| B2_bold | 14pt / 0.875rem | Bold | 155% | 문장 보조 (굵게) |
| B3_bold | 12pt / 0.75rem | Bold | 155% | 문장 참고 (굵게) |
| B1_regular_compact | 16pt / 1rem | Regular | 125% | 한줄 본문 |
| B2_regular_compact | 14pt / 0.875rem | Regular | 125% | 한줄 보조 |
| B3_regular_compact | 12pt / 0.75rem | Regular | 125% | 한줄 참고 |
| B1_regular | 16pt / 1rem | Regular | 155% | 문장 본문 |
| B2_regular | 14pt / 0.875rem | Regular | 155% | 문장 보조 |
| B3_regular | 12pt / 0.75rem | Regular | 155% | 문장 참고 |

> **compact** (125%) = 한줄·레이블용, **일반** (155%) = 여러줄 문장용

---

## 기본 컬러 팔레트

### Purple (Primary — 메인 컬러)
| 단계 | Hex |
|------|-----|
| 50 | `#F7F4FF` |
| 100 | `#F7F4FF` |
| 200 | `#F2ECFF` |
| 300 | `#E3E4F8` |
| 400 | `#d8c7fe` |
| 500 | `#cbb4fd` |
| 600 | `#b28ffd` |
| 700 | `#9869fc` |
| **800** | **`#7E44FB`** |
| 900 | `#341761` |
| 950 | `#341761` |

> ⚠️ Primary 실사용 기준은 **purple-800 `#7E44FB`** (solid/fg/focusring 등에서 사용)

### Gray
| 단계 | Hex |
|------|-----|
| 50 | `#F8F8F8` |
| 100 | `#F0F0F0` |
| 200 | `#E6E6E6` |
| 300 | `#D9D9D9` |
| 400 | `#CCCCCC` |
| 500 | `#B3B3B3` |
| 600 | `#999999` |
| 700 | `#808080` |
| 800 | `#494949` |
| 900 | `#333333` |
| 950 | `#333333` |

### Blue
| 단계 | Hex |
|------|-----|
| 50 | `#F2F5FF` |
| 100 | `#F2F5FF` |
| 200 | `#E3EAFF` |
| 300 | `#E3EAFF` |
| 400 | `#8AA5FE` |
| 500 | `#8AA5FE` |
| 600 | `#5890FF` |
| 700 | `#5890FF` |
| 800 | `#5890FF` |
| 900 | `#5890FF` |
| 950 | `#5890FF` |

### Red
| 단계 | Hex |
|------|-----|
| 50 | `#FFEFEF` |
| 100 | `#FFEFEF` |
| 200 | `#FFE4E4` |
| 300 | `#FFE4E4` |
| 400 | `#E75D6E` |
| 500 | `#E75D6E` |
| 600 | `#DB3E51` |
| 700 | `#DB3E51` |
| 800 | `#DB3E51` |
| 900 | `#DB3E51` |
| 950 | `#DB3E51` |

### Green
| 단계 | Hex |
|------|-----|
| 50 | `#F1F9F3` |
| 100 | `#F1F9F3` |
| 200 | `#DBF1E0` |
| 300 | `#DBF1E0` |
| 400 | `#3AC772` |
| 500 | `#3AC772` |
| 600 | `#00AF3D` |
| 700 | `#00AF3D` |
| 800 | `#00AF3D` |
| 900 | `#00AF3D` |
| 950 | `#00AF3D` |

### Orange
| 단계 | Hex |
|------|-----|
| 50 | `#FFEDD5` |
| 100 | `#FFEDD5` |
| 200 | `#FFE1BF` |
| 300 | `#FFE1BF` |
| 400 | `#FF9960` |
| 500 | `#FF9960` |
| 600 | `#FF8C4C` |
| 700 | `#FF8C4C` |
| 800 | `#FF8C4C` |
| 900 | `#FF8C4C` |
| 950 | `#FF8C4C` |

### Yellow
| 단계 | Hex |
|------|-----|
| 50 | `#FFFBDA` |
| 100 | `#FFFBDA` |
| 200 | `#FFF8BC` |
| 300 | `#FFF8BC` |
| 400 | `#FFE03E` |
| 500 | `#FFE03E` |
| 600 | `#FACC1B` |
| 700 | `#FACC1B` |
| 800 | `#FACC1B` |
| 900 | `#684C15` |
| 950 | `#332506` |

---

## 시멘틱 토큰

### Text (텍스트 색상)
| 토큰 | 참조 | Hex |
|------|------|-----|
| `text/fg` | pureBlack | `#000000` |
| `text/muted` | gray-800 | `#494949` |
| `text/subtle` | gray-700 | `#808080` |
| `text/inverted` | gray-50 | `#F8F8F8` |
| `text/title_purple` | purple-950 | `#341761` |
| `text/sub_purple` | — | `#A5AFCC` |
| `text/error` | red-600 | `#DB3E51` |
| `text/warning` | orange-600 | `#FF8C4C` |
| `text/success` | green-600 | `#00AF3D` |
| `text/info` | blue-600 | `#5890FF` |
| `text/purple` | purple-800 | `#7E44FB` |

### Border (테두리 색상)
| 토큰 | 참조 | Hex |
|------|------|-----|
| `border/border` | gray-300 | `#D9D9D9` |
| `border/muted` | gray-200 | `#E6E6E6` |
| `border/subtle` | gray-100 | `#F0F0F0` |
| `border/emphasized` | gray-500 | `#B3B3B3` |
| `border/inverted` | gray-800 | `#494949` |
| `border/error` | — | `#FF3A3A` |
| `border/warning` | orange-600 | `#FF8C4C` |
| `border/green` | — | `#CBD6F4` |
| `border/info` | blue-600 | `#5890FF` |
| `border/purple` | purple-800 | `#7E44FB` |

### BG (배경 색상)
| 토큰 | 참조 | Hex |
|------|------|-----|
| `bg/coursebg` | — | `#EDF1FC` |
| `bg/panel` | white | `#FFFFFF` |
| `bg/subtle` | gray-50 | `#F8F8F8` |
| `bg/muted` | gray-100 | `#F0F0F0` |
| `bg/emphasized` | gray-200 | `#E6E6E6` |
| `bg/error` | red-100 | `#FFEFEF` |
| `bg/warning` | orange-100 | `#FFEDD5` |
| `bg/success` | green-100 | `#F1F9F3` |
| `bg/info` | blue-100 | `#F2F5FF` |
| `bg/purple` | purple-50 | `#F7F4FF` |

### Gray 시멘틱
| 토큰 | 참조 | Hex |
|------|------|-----|
| `gray/contrast` | white | `#FFFFFF` |
| `gray/fg` | gray-800 | `#494949` |
| `gray/subtle` | gray-100 | `#F0F0F0` |
| `gray/muted` | gray-400 | `#CCCCCC` |
| `gray/emphasized` | gray-600 | `#999999` |
| `gray/solid` | gray-800 | `#494949` |
| `gray/focusring` | gray-800 | `#494949` |

### Purple 시멘틱
| 토큰 | 참조 | Hex |
|------|------|-----|
| `purple/contrast` | white | `#FFFFFF` |
| `purple/fg` | purple-800 | `#7E44FB` |
| `purple/subtle` | purple-100 | `#F7F4FF` |
| `purple/muted` | purple-200 | `#F2ECFF` |
| `purple/emphasized` | purple-600 | `#b28ffd` |
| `purple/solid` | purple-800 | `#7E44FB` |
| `purple/focusring` | purple-800 | `#7E44FB` |
| `purple/menu_tab` | — | `#CBD6F4` |

### Orange 시멘틱
| 토큰 | 참조 | Hex |
|------|------|-----|
| `orange/contrast` | white | `#FFFFFF` |
| `orange/fg` | orange-600 | `#FF8C4C` |
| `orange/subtle` | orange-100 | `#FFEDD5` |
| `orange/muted` | orange-200 | `#FFE1BF` |
| `orange/emphasized` | orange-500 | `#FF9960` |
| `orange/solid` | orange-600 | `#FF8C4C` |
| `orange/focusring` | orange-600 | `#FF8C4C` |

### Yellow 시멘틱
| 토큰 | 참조 | Hex |
|------|------|-----|
| `yellow/contrast` | white | `#FFFFFF` |
| `yellow/fg` | yellow-600 | `#FACC1B` |
| `yellow/subtle` | yellow-100 | `#FFFBDA` |
| `yellow/muted` | yellow-200 | `#FFF8BC` |
| `yellow/emphasized` | yellow-500 | `#FFE03E` |
| `yellow/solid` | yellow-600 | `#FACC1B` |
| `yellow/focusring` | yellow-600 | `#FACC1B` |

### 기타 토큰
- `pureBlack`: `#000000`
- `pureWhite`: `#FFFFFF`

### 보조 컬러 용도
- `purple` → **Primary**, 주요 CTA, 강조, 포커스
- `red` → 오류, 경고, 삭제
- `green` → 성공, 완료, 통과
- `orange` → 주의, 중간 상태
- `blue` → 정보, 안내
- `gray` → 텍스트, 비활성, 구분선

## 컴포넌트 스펙

### Dialog
- **Custom Modal — Confirm**: 아이콘 + 안내글 1줄 + 설명 2줄 + 버튼 2개 + 하단 추가안내(선택)
  - Alert(삭제): red 아이콘, `아니오`(outline) / `네, 삭제합니다.`(red filled)
  - Check(저장): purple 체크 아이콘, `아니오`(outline) / `네, 저장합니다`(purple filled)
- **Custom Modal — Status**: purple 아이콘 + 제목 + 설명 + Primary CTA(purple filled) + Secondary(outline) + × 닫기
- **Basic Modal**: Header(제목 + 선택적 뱃지 + × 닫기) + Body + Footer(취소 outline + 확인 purple filled)
  - 사이즈: sm(384px) / md(512px) / lg(672px)
  - 타입: Action(버튼 있음) / Inform(버튼 없음) / Addon(하단 텍스트+버튼)
- 버튼 스타일: Primary = purple-800(`#7E44FB`) filled, Secondary = outline(border gray-300), Danger = red-600(`#DB3E51`) filled
- border-radius: 12px (모달 컨테이너), 8px (버튼)

### 홈 컴포넌트 (Home)

#### class_Card (수업 카드)
크기: 336×186px / border-radius: 12px / 좌측 purple-800 썸네일 영역 + 우측 텍스트
| 상태 | 설명 |
|------|------|
| **progress** | 기본 진행 중 수업. 학년 뱃지 + 수업명 + 수행평가 N개 |
| **finish** | 하단에 어두운 배너 "지난 학기 수업입니다." |
| **planned** | 하단에 어두운 배너 "다음 학기 수업입니다." |
- 우측 상단 `⋮` 더보기 메뉴
- 학년 뱃지: purple-50 bg, purple 텍스트

#### class_panel (수업 패널 — 홈 메인)
- 학기/과목 필터 드롭다운 (학년도 학기 ∨ / 전 과목 ∨)
- **Empty state**: 일러스트 + "개설된 수업이 없습니다." + `+ 수업 만들기` 버튼(purple filled)
- **데이터 있음**: class_Card 그리드 (3열)
- 상태: `plan`(현재학기) / `done`(이전학기)

#### Notice_Item (공지 목록 아이템)
- `신규` 뱃지(blue-100 bg, blue 텍스트) + 제목 + 날짜
- state: Default / hover (배경 변경)

#### header_CardSet (수업 카드셋 헤더)
- 학기 탭 + 수업 카드 목록 컨테이너
- 공지 데이터 On/Off × 현재학기/이전학기 조합

---

### 평가 설계 컴포넌트 (Assessment_Design)

#### Radio Card — 채점기준 생성 방법 선택
3가지 옵션 라디오 카드 (selected 시 purple border + purple-50 배경):
1. **자유롭게 입력** — 채점기준 표나 활동지 이미지를 활용하거나 직접 입력
2. **채점요소 입력** — 채점요소와 급간 수를 입력하면 AI가 생성
3. **루브릭 이미지 업로드** — 채점기준 표나 활동지 이미지로 생성

#### 성취수준_card (성취기준 카드)
| 상태 | 설명 |
|------|------|
| **default** | "성취기준 검색 후 선택해 주세요." 드롭다운 |
| **preset** | 성취기준 선택됨 + 상/중/하 수준 텍스트 표시 + 수준 추가/제거 |
| **custom** | `직접 입력` 체크 + 성취기준/수준 직접 입력 필드 |
| **needCustom** | 직접 입력 필요 안내 메시지 포함 |
- 우측 상단 `🗑 삭제` 버튼
- 하단 `⊕ 성취수준 추가` / `⊖ 성취수준 제거` 링크

#### 채점기준_card (채점기준 카드)
| 상태 | 설명 |
|------|------|
| **default(AI 유도)** | "채점기준을 AI로 빠르게 만들어보세요!" + `채점기준 AI 생성` 버튼(purple) + `+ 직접 추가` |
| **입력 상태** | 채점요소 입력 textarea + 점수(0) + 세부기준 입력 + `⊕ 배점 추가` / `⊖ 배점 제거` |
- 우측 상단 `🗑 삭제` 버튼

#### Dropzone_Item (파일 업로드 아이템)
4가지 타입 (모두 파일명 + × 제거 버튼):
- **Default**: 파일 아이콘 + 파일명만
- **add_FileSize**: 파일 아이콘 + 파일명 + 파일크기(200kB)
- **Type4**: 썸네일 이미지 + 파일명
- **Preview**: 썸네일 이미지만 (정사각형, × 우상단)

#### Dropzone_Rubric_Image (루브릭 이미지 드롭존)
- state: Default / Hover / Active
- 360×213px 드롭 영역

#### 채점요소_input (채점요소 입력 셀)
- state: default / typing / typed / disabled
- size: md / sm
- color: gray / blue(선택됨)

#### 채점기준 개수 선택
- PC/Mobile × state(Checked/default/generating)
- generating 상태: AI 생성 중 로딩 표현

#### 점수 설정
- **default**: 점수 직접 입력
- **grade**: 등급제(상/중/하 등) 설정

---

### 루브릭 라이브러리 컴포넌트 (Rubric_Library)

#### Library_filter (필터 바)
3개 드롭다운: 교육과정(2015개정/전체) / 과목명 검색 / 성취기준 검색
체크박스 공개 범위 필터:
| 타입 | 설명 |
|------|------|
| **myView_all** | `모든 공개 범위` 체크됨 |
| **myview_part** | `비공개` 등 개별 체크 |
| **schoolView** | 교과 선택됨 상태 |
| **allView** | 교육과정 전체 / 전체 검색 |

---

### Card — rubricSummary_card (평가 설계 카드)
크기: 348px width, 194px height / border-radius: 12px

| 상태 | 배경 | 테두리 | 설명 |
|------|------|--------|------|
| **default** | white | gray-300(`#D9D9D9`) | 기본 상태 |
| **hover** | purple-50(`#F7F4FF`) | purple-800(`#7E44FB`) | 마우스 오버 시 |
| **progress** | white | gray-300(`#D9D9D9`) | 임시저장 뱃지 추가 |

**카드 구성:**
- 우측 상단: `⋮` 더보기 메뉴 아이콘
- 뱃지 영역 (상단 좌): 과목 뱃지(purple-50 bg, purple 텍스트) + 선택적 `임시저장` 뱃지(red/pink)
- 제목: `평가 설계명` (H2, Bold)
- 날짜: `25.03.05 수정됨` (B2_regular, gray)

### Table
- **Header Cell**: 배경 gray-50(`#F8F8F8`), 텍스트 gray-800(`#494949`), 정렬 아이콘(↕) 포함, 높이 40px
  - column 타입: left / mid / right / left_check(체크박스 포함)
- **Table Cell**: 배경 white, 높이 58px (md) / 41px (sm), 하단 border gray-200(`#E6E6E6`)
  - state: Default / Active(선택 시 purple-50 배경)
  - 타입: text, text_addCount, text_addDescription, text_addArrow, badge, graph(프로그레스바), button, button_icon, button_iconSet, checkbox, radio, input, inputPages
- **Pagination**: purple-800(`#7E44FB`) filled 현재 페이지, 나머지 gray 텍스트, `< 1 2 3 4 5 >` 형태
- **상태 뱃지**: `진행`(green), `마감`(orange), `예정`(gray) — 텍스트 + 라운드 배경
- **수정 링크**: green-600(`#00AF3D`) 텍스트
- **점수 이상치 표시**: red border(input box) — 0점 등 이상값 강조
- **액션 버튼**: `점수 초기화`(outline), `학급 점수 업로드`(green outline + 아이콘)

### Graph
- **Bar Chart**: purple-600(`#b28ffd`) ~ purple-800(`#7E44FB`) 막대, blue 보조색
  - 타입: class(반별) / score(점수별) / result(결과)
  - 사이즈: sm / md
  - priority: primary(진한) / secondary(연한)
- **점수 분포 차트**: purple 막대, 하단 점수 라벨(10점~28점), 상단 인원수 표시
  - 범례: primary(진한) / secondary(연한)
  - 보조 텍스트: `(단위 : 명 / 채점인원 : N명)`
- **채점 요소 차트**: 반별 비교 bar chart, 평균값 표시

## 고정 요소

### GNB / 헤더 (변경 불가)
```
[하이러닝 AI 로고 + 서·논술형 평가 서비스]    나의 평가  평가 자료실  고객센터    [유저명] 님
```
- 높이: 98px / 배경: white / 하단 border: `#D9D9D9`
- 로고: 좌측 고정 (하이러닝 AI 브랜드 + 서비스명)
- 중앙 메뉴: 나의 평가 / 평가 자료실 / 고객센터
- 우측: [유저명] 님 (드롭다운)

### 아이콘 시스템
- **Lucide Icons** — 피그마 디자인 시스템 Asset 페이지와 동일한 세트
- 새로운 아이콘 라이브러리 추가 금지, Lucide 내에서만 선택

## 주요 화면 현황

### 5-4. 학생 채점 상세 (현재 개발 버전 — 대폭 변경 예정)
전체 레이아웃: 1536px, 좌우 분할 (좌 896px 이미지 뷰어 / 우 640px 채점 패널)

**GNB**
- 로고: 하이러닝 AI / 서·논술형 평가 서비스
- 상단 메뉴: 나의 평가 / 평가 자료실 / 고객센터 / [유저명] 님

**TitleBar (Grading Mode)**
- 좌: `← 이전으로` 버튼
- 중: 학생 드롭다운 (`10101 김하나 (확인 필요)`) + `21명 중 4명 채점 완료` 텍스트
- 우: `< 이전 학생` / `다음 학생 >` / `✓ 저장` 버튼

**좌측 패널 — 답안지 이미지 뷰어**
- 파일명 탭 (예: `10101 김서윤.png`)
- 업로드 일시 + 페이지 네비게이션(1/1) + 확대/축소(100%, +/-)
- 답안지 이미지 영역 (스크롤)

**우측 패널 — 채점**
1. **총점 / 채점상태**
   - 총점: `N / 50점 (등급)` 표시
   - 라디오: `채점 진행` / `미제출` / `미응시`

2. **채점 결과**
   - 채점 요소 목록 + 점수 선택 버튼 (15 / 10 / 5 등 단계별)
   - 버튼: `점수 초기화` (outline) / `AI 점수 그대로 적용` (purple filled)

3. **AI 채점 근거 및 피드백**
   - 탭 토글: `과제물 분석 AI` / `루브릭 기반 AI 🛈`
   - AI 채점 근거: 텍스트 박스
   - AI 피드백: `요약 보기` / `채점요소별 보기` 라디오 + 내용 텍스트
   - 글자수 / byte 카운터
   - `피드백 가져오기` 버튼
   - `AI 채점 재실행` 버튼 (purple filled) + 안내문("AI Assistant의 채점 결과는 부정확할 수 있습니다...")

4. **선생님 직접 피드백**
   - Textarea (placeholder: "채점 완료 시 학생에게 제공되는 과제 피드백...")
   - 글자수 / byte 카운터
   - `저장 후 다음 학생` 버튼 (우측 하단, purple filled)

---

## 스크린 인덱스 (피그마 링크)

> 스크린맵 파일키: `l6ucsDgFo0Y4uOB2eIBrMu`
> ● 완료(초록) | ○ 미개발(회색)
> 피그마 디자인 파일:
> - **메인 2026**: `MM23uA7pDEmFeMKGeFVJpB` (2026 HIAI Design)
> - **v1.0 구버전**: `344b7XVs8E9KaFBhgAEhtW` (HIAI v1.0)

### 홈 / 공통

| 스크린 ID | 화면명 | 상태 | 파일 | 노드 ID |
|-----------|--------|------|------|---------|
| HOME-001 | 선생님홈 | ● | MM23uA7pDEmFeMKGeFVJpB | `53:1152` |
| ME-001 | 내 정보 | ○ | — | — |

**직접 접근 URL:**
- 선생님홈: `https://www.figma.com/design/MM23uA7pDEmFeMKGeFVJpB/2026-HIAI--Design-?node-id=53-1152`

---

### MEMBERS (평가대상)

| 스크린 ID | 화면명 | 상태 | 파일 | 노드 ID |
|-----------|--------|------|------|---------|
| MEMBERS-001 | 평가대상목록 | ○ | — | — |
| MEMBERS-UPDATE-001 | 평가대상목록_업데이트 | ○ | — | — |
| MEMBERS-UPDATE-001 | 평가대상목록_일괄업로드 | ● | MM23uA7pDEmFeMKGeFVJpB | `72:2552` |
| MEMBERS-UPDATE-DELETE 001 | 평가대상목록_업데이트_삭제 | ● | MM23uA7pDEmFeMKGeFVJpB | `95:15241` |

**직접 접근 URL:**
- 일괄업로드: `https://www.figma.com/design/MM23uA7pDEmFeMKGeFVJpB/2026-HIAI--Design-?node-id=72-2552`
- 삭제: `https://www.figma.com/design/MM23uA7pDEmFeMKGeFVJpB/2026-HIAI--Design-?node-id=95-15241`

---

### SCHOOLS (학교 관리)

| 스크린 ID | 화면명 | 상태 | 파일 | 노드 ID |
|-----------|--------|------|------|---------|
| SCHOOLS-CLASSROOMS-001 | 학생 관리 | ● | MM23uA7pDEmFeMKGeFVJpB | `524:6619` |
| SCHOOLS-CLASSROOMS-xxx-001 | 학생 일괄 등록 | ● | MM23uA7pDEmFeMKGeFVJpB | `82:2739` |
| SCHOOLS-CLASSROOMS-xxx-001 | 학생 데이터 삭제 | ● | MM23uA7pDEmFeMKGeFVJpB | `95:9811` |
| SCHOOLS-TEACHERS-001 | 선생님 목록 | ● | 344b7XVs8E9KaFBhgAEhtW | `3670:26659` |

**직접 접근 URL:**
- 학생 관리: `https://www.figma.com/design/MM23uA7pDEmFeMKGeFVJpB/2026-HIAI--Design-?node-id=524-6619`
- 학생 일괄 등록: `https://www.figma.com/design/MM23uA7pDEmFeMKGeFVJpB/2026-HIAI--Design-?node-id=82-2739`
- 학생 데이터 삭제: `https://www.figma.com/design/MM23uA7pDEmFeMKGeFVJpB/2026-HIAI--Design-?node-id=95-9811`
- 선생님 목록: `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=3670-26659`

---

### PROJECTS (평가 설계)

| 스크린 ID | 화면명 | 상태 | 파일 | 노드 ID |
|-----------|--------|------|------|---------|
| PROJECTS-001 | 평가설계목록 | ● | 344b7XVs8E9KaFBhgAEhtW | `2087:50518` |
| PROJECTS-CREATE-001 | 평가설계생성 | ● | 344b7XVs8E9KaFBhgAEhtW | `2087:49498` |

**직접 접근 URL:**
- 평가설계생성: `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2087-49498`

---

### Teachers_Course (과목별 화면)

#### 평가 홈
| 스크린 ID | 화면명 | 상태 | 파일 | 노드 ID |
|-----------|--------|------|------|---------|
| COURSE-001 | 평가홈 | ● | 344b7XVs8E9KaFBhgAEhtW | `2087:56337` |

**직접 접근 URL:**
- 평가홈: `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2087-56337`

**목업 파일:** `output/eval_home_v1_260403.html`

**화면 구성:**
- GNB + 보라 그라디언트 타이틀 바 (과목명: "1학년 국어")
- 6탭 네비게이션: 평가 홈(active) / 평가 대상 / 평가 설계 / 과제물 관리 / AI 채점 / 평가 리포트
- 좌측 패널(445px): **관찰 기록** — 학생 선택 드롭다운, 키워드 태그 클라우드, 키워드 입력+등록, 기록 내역 테이블(날짜·번호·이름·키워드·삭제)
- 우측 패널(flex-1): **평가 목록** — 평가 카드(평가명, 날짜, 상태 설명, 3단계 스텝 바: 평가 설계→과제물 제출→채점 진행), 신규 평가 안내 텍스트
- 탭 스타일: active=white, inactive=`#CBD6F4`, border-radius 20px(상단만)

#### 평가 설계 (TEMPLATES)
| 스크린 ID | 화면명 | 상태 | 파일 | 노드 ID |
|-----------|--------|------|------|---------|
| TEMPLATES-001 | 나의평가계획목록 | ○ | — | — |
| TEMPLATES-CREATE-001 | 평가계획생성 | ● | 344b7XVs8E9KaFBhgAEhtW | `2412:26000` |

**직접 접근 URL:**
- 평가계획생성: `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2412-26000`

#### 과제물 관리 (TASKS)
| 스크린 ID | 화면명 | 상태 | 파일 | 노드 ID |
|-----------|--------|------|------|---------|
| TASKS-001 | 과제물 관리 목록 | ● | 344b7XVs8E9KaFBhgAEhtW | `2087:50603` |
| TASKS-002 | 학급 제출 상세 (1-1반) | ● | 344b7XVs8E9KaFBhgAEhtW | `2087:50665` |
| TASKS-003 | 개별 파일 추가/제거 팝업 | ● | 344b7XVs8E9KaFBhgAEhtW | `2087:50992` |
| TASKS-004 | 일괄업로드 - 파일선택 | ● | 344b7XVs8E9KaFBhgAEhtW | `2087:51011` |
| TASKS-005 | 일괄업로드 - 분할설정 | ● | 344b7XVs8E9KaFBhgAEhtW | `2087:51230` |
| TASKS-006 | 일괄업로드 - 분할결과(수동) | ● | 344b7XVs8E9KaFBhgAEhtW | `2087:51329` |
| TASKS-007 | 일괄업로드 - 분할결과(자동) | ● | 344b7XVs8E9KaFBhgAEhtW | `2087:51437` |

**직접 접근 URL:**
- 과제물 관리 목록: `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2087-50603`
- 학급 제출 상세: `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2087-50665`
- 개별 파일 추가/제거: `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2087-50992`
- 일괄업로드 파일선택: `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2087-51011`
- 일괄업로드 분할설정: `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2087-51230`
- 일괄업로드 분할결과(수동): `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2087-51329`
- 일괄업로드 분할결과(자동): `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2087-51437`

**Figma 섹션:** `과제물 관리` (344b7XVs8E9KaFBhgAEhtW, 페이지 `v1.2 - 전체화면`, 섹션 `2087:50587`)

**화면 구성 요약:**
- **TASKS-001 (목록):** 과제물 관리 탭 active, 평가명별 반 단위 카드 (상태 뱃지: 진행/마감/예정, 제출현황 프로그레스바, 미제출 수, 과제 제출 상세 링크). 하단에 "과제물 없는 과제" 영역 (수동 채점하기 버튼)
- **TASKS-002 (학급 제출 상세):** 타이틀바 "← 1학년 국어 | 과제 제출 상세", 우상단 `학급 PDF 업로드` 버튼(green). 미제출 학생 경고 바. 학생 테이블: 상태(제출/미제출 뱃지) · 학번 · 이름 · 최근 제출 일시 · 파일 수 · 파일 추가/제거 링크
- **TASKS-003 (파일 추가/제거 팝업):** Dialog — "김가나 학생 파일 추가/제거", 파일 제한 안내, 파일 태그 + 삭제, 파일 업로드 링크, 취소/저장 버튼
- **TASKS-004 (일괄업로드 - 파일선택):** 전체 화면, "1학년 1반 학급 PDF 일괄 업로드" 타이틀. 드롭존 영역 (학급 단위 스캔 PDF 1개 선택 안내 + 파일 선택 버튼)
- **TASKS-005 (분할설정):** 좌측 PDF 미리보기 (페이지 네비게이션 + 줌), 우측 분할 설정 패널 — 학생당 기본 N장, 스캔 파일 N페이지부터 시작, 분할 결과 수정 방식 라디오 (페이지 장수 입력 / 페이지 번호 입력), 파일 다시 업로드 / 파일 분할 시작 버튼
- **TASKS-006 (분할결과 수동):** 좌측 PDF 미리보기, 우측 분할 결과 테이블 — 학번 · 이름 · 페이지 수 · 페이지 번호(from~to 입력) · 미제출 체크. 분할 재설정 / 과제 업로드 버튼
- **TASKS-007 (분할결과 자동):** TASKS-006과 동일 레이아웃, 페이지 번호 자동 배정(1~2, 3~4...), 페이지 수 0인 행도 표시

#### AI 채점 (SCORINGS)
| 스크린 ID | 화면명 | 상태 | 파일 | 노드 ID |
|-----------|--------|------|------|---------|
| SCORINGS-001 | AI채점 (학급 목록) | ● | MM23uA7pDEmFeMKGeFVJpB | `54:4151` |
| SCORINGS-002 | AI채점_학급채점결과상세 | ○ | MM23uA7pDEmFeMKGeFVJpB | `54:4151` |
| SCORINGS-003 | AI채점_학생채점결과상세 | ● | MM23uA7pDEmFeMKGeFVJpB | `49:1674` |

**직접 접근 URL:**
- AI채점 목록: `https://www.figma.com/design/MM23uA7pDEmFeMKGeFVJpB/2026-HIAI--Design-?node-id=54-4151`
- 학생채점결과상세: `https://www.figma.com/design/MM23uA7pDEmFeMKGeFVJpB/2026-HIAI--Design-?node-id=49-1674`

#### 평가 리포트 (REPORTS)

| 스크린 ID | 화면명 | 상태 | 파일 | 노드 ID |
|-----------|--------|------|------|---------|
| REPORTS-001 | 평가 리포트 목록 | ● | `344b7XVs8E9KaFBhgAEhtW` | `2087:52878` |
| REPORTS-002 | 학생 평가 리포트 상세 | ● | `344b7XVs8E9KaFBhgAEhtW` | — |

**직접 접근 URL:**
- 평가 리포트 목록: `https://www.figma.com/design/344b7XVs8E9KaFBhgAEhtW/HIAI-v1.0~?node-id=2087-52878`

**목업 파일:**
- 목록: `output/report_list_v1.html`
- 상세: `output/student_report_v1.html`

**화면 구성 요약:**
- **REPORTS-001 (목록):** 평가 리포트 탭 active. 패널 헤더: "평가 리포트" + 설명 + `평가 점수 다운로드` 버튼(purple filled, download 아이콘).
  - Section 1 — 과제별 평균 점수: 과제·전체평균·반·반평균·평균대비(▲/▼/— 컬러 기호)·인원·미응시/미제출. 과제별 3개 반 rowspan.
  - Section 2 — 학생별 평가 리포트: 반/정렬 필터 드롭다운 + 테이블(반·학번·이름·총점·과제1/2/3·평가 리포트). "리포트 상세 >" 링크 → `student_report_v1.html`. 하단 페이지네이션.
- **REPORTS-002 (상세):** TitleBar "1학년 국어 | 리포트 상세" + ← 뒤로(→ report_list_v1.html). Recharts 기반 개인 성취 분석 (라인차트, 레이더차트). 과목 태그·AI 피드백 요약 포함.

---

## 재채점 유도 정책 (Stale 알림)

### 목적
**"지금 보이는 AI 채점 결과는 최신 OCR/과제물을 반영하지 않았을 수 있다"** 는 사실을 교사에게 알리고, 재채점 실행을 유도한다. 그 이상은 하지 않는다 (자동화·이력 추적 X).

### 전제
- 채점 실행 단위는 **평가 전체(모든 학생 × 모든 문항)** 이며, 부분 재채점은 지원하지 않는다.
- 재채점은 AI 비용·시간이 커서 변경이 수시 발생할 때 매번 자동 실행하면 낭비다.
- 예상 소요 시간·비용은 정확히 산출할 수 없다 → UI에 노출하지 않는다.

### 상태 모델
- 평가 단위 단일 플래그 `needsRescoring: boolean` 하나만 관리.
- 학생별·문항별 세부 추적, 변경 이력, diff 비교 등은 **MVP에서 제외** (모두 서버 로그로 충분하다고 판단).

### 트리거 (모두 동일하게 `needsRescoring = true`)
| 이벤트 | 비고 |
|---|---|
| OCR 텍스트 저장 (blur 시) | 학생·문항 단위 구분 없이 평가 전체 플래그 ON |
| 과제물 파일 교체 | 동일 |
| 루브릭·성취수준 수정 | 동일 |

### 리셋
- **재채점 실행 완료** 시에만 `needsRescoring = false`.

### UI 엘리먼트 (최소 세트)
1. **학생 리스트 상단 배너** (주황 경고, 차단 아님)
   > "OCR 또는 과제물이 수정되었습니다. 현재 점수는 최신 결과를 반영하지 않았을 수 있어요. **[재채점 실행]**"
2. **학생 개별 상세 상단 배너** (축약형, 재채점 버튼 없음)
   > "최신 OCR이 반영되지 않은 점수입니다. 리스트로 돌아가 재채점을 실행하세요."
   - 재채점은 평가 전체 단위이므로 학생 상세에서 트리거하지 않는다.
3. **재채점 실행 다이얼로그** (옵션 체크박스 없음, 최소 문구)
   > "평가 전체를 다시 채점합니다.
   > 교사가 수정한 점수·피드백은 그대로 유지됩니다.
   > AI 채점 결과만 최신 OCR 기준으로 다시 생성됩니다."
   - 버튼: [취소] / [재채점 실행]
   - 예상 소요 시간·비용 문구 없음.

### 정책 고정값 (옵션화하지 않음)
- **자동 재채점 없음**: 반드시 교사가 명시적으로 실행해야 반영된다.
- **교사 확정값 보존**: 재채점해도 교사가 수정한 점수/피드백은 항상 유지된다.
- **중복 실행 방지**: `needsRescoring === false`일 때는 "재채점 실행" 버튼 비활성 또는 숨김.
- **진행 중 편집 잠금**: 재채점 실행 중에는 OCR 편집·과제물 교체·루브릭 수정 잠금. 완료 후 해제.

### 읽기 전용 모드 (C안)
- 교사 편집이 없으므로 트리거가 발생하지 않는다 → 배너는 사실상 노출되지 않는다. 로직은 그대로 유지.

---

## 작업 이력
- 260401: 디자인 시스템 전체 정리 (컬러 팔레트 7종, 시멘틱 토큰, 타이포그래피 G1~B3, GNB, 버튼·인풋·뱃지·컴포넌트 스펙)
- 260401: 스크린 인덱스 전체 추출 완료 (스크린맵 `l6ucsDgFo0Y4uOB2eIBrMu` 전 노드 파싱 — 피그마 MCP 직접 접근 가능)
- 260401: CLAUDE.md에 Figma 파일키 4종 및 스크린 인덱스 참조 추가, 서비스 개요 및 핵심 플로우 정리
- 260403: COURSE-001 평가홈 목업 신규 작성 (`eval_home_v1_260403.html`). Figma `344b7XVs8E9KaFBhgAEhtW` `2087:56337` 기준.
- 260414: 과제물 관리(TASKS) 스크린 인덱스 추가 — 7개 화면 (목록, 학급 제출 상세, 파일 팝업, 일괄업로드 4단계). Figma `344b7XVs8E9KaFBhgAEhtW` 페이지 `v1.2 - 전체화면`.
- 260415: 평가 리포트(REPORTS) 목록 목업 신규 작성 (`report_list_v1.html`). Figma `344b7XVs8E9KaFBhgAEhtW` `2087:52878` 기준. 과제별 평균 점수 테이블 + 학생별 리포트 테이블. 리포트 상세 링크 → `student_report_v1.html`. 전 파일 "평가 리포트" 탭 연결 완료.
- 260423: 재채점 유도 정책 (Stale 알림) 기획 정리 — 평가 단위 `needsRescoring` 단일 플래그, 자동 실행 없음, 교사 확정값 항상 보존, 배너 2종 + 최소 다이얼로그로 UI 구성.
