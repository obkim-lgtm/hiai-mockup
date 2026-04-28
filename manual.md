# HiAI Mockup — 실행 / 배포 매뉴얼

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

이 파일은 PC마다 직접 만들어야 한다. 아래 템플릿을 `<프로젝트 루트>\.claude\launch.json` 또는 Claude Code의 working directory(`<드라이브>:\내 드라이브\Claude\.claude\launch.json`)에 저장:

```json
{
  "version": "0.0.1",
  "configurations": [
    {
      "name": "hiai-mockup",
      "runtimeExecutable": "node",
      "runtimeArgs": ["<드라이브>:\\내 드라이브\\Claude\\hiai_mockup\\server.js"],
      "port": 3502,
      "autoPort": true
    }
  ]
}
```

- `<드라이브>` 는 본인 PC의 Google Drive 드라이브 레터로 교체 (예: `F`, `G`)
- 시스템 `node`가 PATH에 없으면 `runtimeExecutable`을 `node.exe` 절대경로로 (예: `C:\\Program Files\\Adobe\\Adobe Creative Cloud Experience\\libs\\node.exe`)

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
