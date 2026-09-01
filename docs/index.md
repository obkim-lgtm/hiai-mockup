# Index — 상황별 방향 지시표

문서 목록이 아니라 라우팅 테이블이다. "어떤 상황이면 → 무엇을 읽는다"를
적는다. 문서만이 아니라 이 프로젝트의 **원천 데이터 소스**(DB 스키마,
데이터셋, API 스펙, 대시보드 등)도 여기서 라우팅한다.

## 라우팅

- 어떤 작업이든 시작 전 → [principles.md](principles.md)
  (SessionStart가 자동 주입하지만, 수동 확인 시 여기)
- 최근 작업 맥락이 필요하면 → [sessions/](sessions/) 최신 2일치
- 목업 작업 규칙·작업 방식·산출물 구성 → ../CLAUDE.md
- **새 화면/컴포넌트 그리기 전(GNB·로고·파비콘·Dialog·Toast·패널·버튼·Input·Badge·토큰·타이포) → [design-system.md](design-system.md)**
- **컴포넌트 구현 전 실제 수치(색·radius·spacing·폰트) → [design-system.md](design-system.md)의 Figma 파일키로 get_design_context** (육안 추정 금지)
- **목업 내비게이터(까망이)에 화면·케이스 추가하거나 케이스 선택기 만들기 전 → [mockup-navigator.md](mockup-navigator.md)** (전용 패널 금지·진입 항목→케이스 그룹·딥링크·파일 간 동기화, CLIPO 목업과 공통 규칙)
- **평가 설계 작업 전 → [sessions/2026-09-01.md](sessions/2026-09-01.md)의 "▶ 이어받기"** — 작업본 `../output/evaluation_design_v8.html`. 설계는 채점기준까지 = 완료, 그 위에 **AI 채점 정확도 높이기 3단계**(① 빈 활동지·문항 확정 ② 채점기준 연결(매트릭스) ③ 모범답안). **AI 진단·루브릭 수정 제안은 전부 삭제됨**
- **v7 `../output/evaluation_design_v7.html`(진단형)은 보존** — 공유된 URL이 살아 있어 삭제 금지. 설계 상세·크롬은 v8이 그대로 이어받았고, 다른 건 참고만
- **시안2 `../output/evaluation_design_v6.html`(답안 1장 미리 채점)은 폐기가 아니라 2027년 백로그** — 미리보기 흐름을 나중에 살릴 것이므로 파일·문서 삭제 금지. v7 작업 시 참고만
- **두 시안의 공통 토대 → [sessions/2026-08-21.md](sessions/2026-08-21.md)** (간편/정교 구분 폐지 · 설계 상세=세로 스크롤 한 화면 · 모범답안 전용 화면)
- **채점기준 입력 UI(추가 버튼·카드·∑·배점) 그리기 전 → 개발 화면 Figma `MM23uA7pDEmFeMKGeFVJpB` `736:9578`** (점선 AI 카드 = 추가 진입점. 실측값은 sessions/2026-08-21.md §6에 정리)
- **변경 규칙·잠금 정책(v5에도 유효) → [sessions/2026-08-04.md](sessions/2026-08-04.md)** (참조 원칙 하나 · 잠금 2축(OCR 분석 후/채점 실행 후) · 안내 3종 · 세트 교체는 제품에 없음). 구버전 4단계 위저드 목업 ../output/evaluation_design_v4_260713.html · PRD(간편/정교 전제라 개정 필요) https://app.notion.com/p/33717e5c8cf1817c830ee4f97380a4a0
- 서비스 배경·컬러 팔레트 상세·스크린 인덱스 → ../context.md
- 디자인 토큰(PPT 정리본) → ../HIAI_design_tokens_PPT.md
- 실행·미리보기 방법 → ../manual.md
- AI 채점 안내(잘 채점되는 과제물·채점기준) 목업 작업 전 → ../output/scoring_guidance_v1.html (단독 컨셉) · ../output/task_ocr_review_v2.html (과제물 관리 통합본, v1은 보존)
  (근거: 레나 QA 정리 노션 "AI 채점이 어려운 경우 (v3.2)" — 5개 유형, 실사용 데이터는 가공해 도식으로만 반영)

<!-- ⚠ 실제 라우팅은 이 주석 밖, 위의 목록에 항목으로 추가한다.
     주석 안에 쓰면 뷰어·lint·에이전트 모두에게 보이지 않는다.
형식 참고 (원천 데이터 소스·시크릿 소재도 이렇게):
- DB 스키마 변경 전 → schema/tables.sql
- 매출 데이터 다루기 전 → data/sales/README.md (원천: BigQuery ds_sales)
- 대시보드·통계 작업 전 → data/sales_2026.csv
  (원천 데이터 — 반드시 이 파일만 근거, 값 임의 생성 금지)
- 외부 API 자격증명 → .env 의 FOO_API_KEY (값 편집: sops secrets.yaml)
  ※ 시크릿은 소재·사용법만 — 값은 절대 적지 않는다
-->

## 인덱스 규칙

- docs/ 하위 모든 문서는 이 파일에서 도달 가능해야 한다 (lint가 강제).
- 새 문서·데이터 소스가 생기면 반드시 여기에 라우팅 줄을 추가한다.
  에이전트가 어떤 작업 전에 무엇을 봐야 하는가가 기준이다.
