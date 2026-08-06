# HIAI Mockup — 실행 / 배포 매뉴얼

## 📌 현재 진행 상태 (이어받기용 — 2026-06-04 기준)

> 상세 변경 이력은 `context.md` 하단 "작업 이력 260604" 참조.

**진행 중 메인 작업: 유초등(유아·초등) AI 채점 화면 — 2026년 7월 타깃**

- **개별 채점 화면**: `output/scoring_student_elementary_v1.html` (배포됨)
  - CLIPO 초등 채점(`clipo_mockup/output/scoring_elementary_v2_260511.html`)을 HIAI 토큰으로 리스킨한 것
  - 6개 상태 케이스를 `?id=&name=`으로 분기: 유초등(확인필요)·미제출·채점전·채점실패·이전채점·히스토리 (분기 기준은 `name`). id는 40201~40206
  - 색: 과제물 분석 AI=보라(#7E44FB) / 루브릭 기반 AI=연하늘(#2b7fd4) / 채점요소별=연보라. 문항 카드=파스텔 도달칩(민트·버터·피치), 번호도 파스텔 알약
  - 제거됨: AI 크레딧·채점모델 설명·도장·로고 워드마크
- **학급 채점 현황**: `output/scoring_detail_v1.html` (배포됨)
  - 중고등 학생 목록(김서윤·박지민·김문항·김하이 등) **보존** + 초등 6케이스 행 추가(`초등-`접두어, 40201~40206)
  - 중고등 행 → 기존 `scoring_student_v1/kimmh/kimhi`, 초등 행 → `scoring_student_elementary_v1.html?id=&name=`
  - 결과공개(출력): 출력 항목 9개 + 출력 종이 "재구성 예정" 플레이스홀더

**다음 할 일 (미완):**
1. **학생 리포트 화면 디자인** — 현재 미리보기/PDF출력/학생공개·출력종이 모두 "학생 리포트 디자인하여 재구성 예정" 플레이스홀더 상태. 실제 리포트 디자인 필요.
2. `scoring_detail_v1`의 출력 셀렉터 `PRINT_STUDENTS`(21명 중등) 정리, 출력 종이 헤더(미래사회·중등) 유초등 맥락으로 정리.
3. 7월 타깃 범위 확정 (학생 리포트 포함 여부 등).

---

## 새 PC에서 처음 시작하기

### 1. 사전 준비
- **Google Drive** 마운트 — 드라이브 레터는 PC마다 달라도 됨 (`F:`, `G:` 둘 다 가능)
- **Node.js** — 시스템에 `node` 명령이 있으면 끝. 없으면 아래 launch.json `runtimeExecutable`에 절대경로 지정
- **GitHub 자격증명** — `obkim-lgtm/hiai-mockup` 에 push 가능하도록 PAT 또는 SSH 키 셋업
- **git identity** (PC별 1회) — repo 폴더에서:
  ```
  git config user.name "obkim-lgtm"
  git config user.email "ob.kim@datadriven.kr"
  ```

### 2. `.claude/launch.json` 생성 (PC-local, git에 안 올라감)

> **2026-08-05 개정** — 예전에는 이 파일을 PC마다 새로 만들고 드라이브 레터를 직접 박아야 했다. 지금은 **상대경로**를 쓰므로 PC마다 다시 만들 필요가 없다. 이미 Claude working directory의 `.claude\launch.json`에 `hiai-mockup` 항목이 상대경로로 들어가 있으니, 보통은 **이 단계를 건너뛰어도 된다.**

없거나 새로 만들어야 하면, working directory(`내 드라이브\Claude\.claude\launch.json`)에 아래를 추가:

```json
{
  "name": "hiai-mockup",
  "runtimeExecutable": "python",
  "runtimeArgs": ["-m", "http.server", "3502", "--directory", "hiai_mockup"],
  "port": 3502,
  "autoPort": true
}
```

- **경로에 드라이브 레터를 넣지 말 것.** 넣으면 다른 PC에서 404가 나고, PC별 중복 항목이 늘어난다.
- 실행기도 절대경로 대신 PATH의 `python`(또는 `node`)을 쓴다. 예전 템플릿이 안내하던 Adobe 번들 `node.exe` 경로는 PC에 따라 존재하지 않는다.
- 프로젝트 루트의 `server.js`로 띄우고 싶다면 `"runtimeExecutable": "node", "runtimeArgs": ["hiai_mockup/server.js"]` — 역시 상대경로로.

### 3. Claude Code에서 미리보기 시작
```
preview_start("hiai-mockup")
```
→ `http://localhost:3502/` 가 가장 최근 `output/*.html` 파일을 자동 서빙

---

## 작업 흐름

1. 사용자가 캡처 + 지침 제공 → Claude가 목업 작성
2. **preview로 즉시 확인** (output 저장 X)
3. 사용자가 "저장해줘" 하면 `output/<기능명>_v<N>.html` 로 저장
4. 사용자가 "배포해줘" / "올려줘" / "커밋해줘" 하면 즉시 `git add` + `git commit` + `git push`

---

## 배포 (GitHub Pages)

- **Repo**: https://github.com/obkim-lgtm/hiai-mockup
- **Live URL**: https://obkim-lgtm.github.io/hiai-mockup/
- **방식**: `main` 브랜치 root를 GitHub Pages가 직접 서빙 (Actions workflow 없음)
- `git push` 후 약 1~2분 내 자동 반영
- 캐시가 안 풀리면 빈 commit으로 강제 갱신: `git commit --allow-empty -m "trigger pages cache"`

---

## 다른 PC와의 동기화

| 작업 | 명령 |
|------|------|
| 다른 PC에서 한 변경 가져오기 | `git pull` |
| 이 PC에서 한 변경 올리기 | `git push` (= 배포) |

PC-local 파일(`.claude/launch.json`, `desktop.ini`)은 git에 안 들어가니 PC별로 다르게 유지됨.

---

## 인프라 / 폴더 구조

```
hiai_mockup/
├── server.js     # 자급자족 정적 서버 (port 3502, ROOT=프로젝트 루트, / → 최근 output)
├── output/       # 목업 HTML (배포 대상)
├── screens/      # 참고 이미지 + 로고 + favicon_src.png
├── CLAUDE.md     # 작업 규칙 + 디자인 토큰
├── context.md    # 컬러 팔레트, 스크린 인덱스 (피그마 nodeId)
└── manual.md     # 이 파일
```

`server.js` 핵심 동작:
- `ROOT = __dirname` — 프로젝트 루트를 서빙 (output에서 `../screens/favicon_src.png` 참조 가능)
- `/` 요청 시 `output/` 의 가장 최근 `.html` 파일로 응답
- `PORT = process.env.PORT || 3502`

---

## 트러블슈팅

| 증상 | 원인 / 해결 |
|------|-------------|
| `preview_start` 가 "지정된 경로를 찾을 수 없습니다" | `.claude/launch.json` 의 `runtimeExecutable` 경로 확인 (node가 PATH에 있는지) |
| 미리보기 페이지에서 로고/파비콘이 깨짐 | `screens/favicon_src.png` 가 git에 있는지 확인 — `git ls-files screens/favicon_src.png` |
| Figma 에셋 URL이 만료 (7일) | `get_design_context(fileKey=vOYXokKNMGec80BpDbIiJI, nodeId=1722:21861)` 로 로고 URL 재발급, 또는 마지막 커밋(`f61b9e3`)처럼 로컬 `screens/` 경로로 교체 |
| `git status` 에 `desktop.ini` 가 modified로 계속 뜸 | 이미 `.gitignore` 처리됐지만 한 번 untrack 필요: `git rm --cached desktop.ini **/desktop.ini` |
| 브랜치 목록에 `desktop.ini` broken ref 경고 | `rm .git/refs/heads/desktop.ini` (Google Drive가 파일을 만들어서 생긴 것) |
