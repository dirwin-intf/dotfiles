---
geometry:
  - margin=1in
header-includes:
  - \definecolor{KanagawaBG}{HTML}{1F1F28}
  - \definecolor{KanagawaFG}{HTML}{DCD7BA}
  - \definecolor{KanagawaLink}{HTML}{DCA561}
  - \definecolor{KanagawaFloat1}{HTML}{223249}
  - \definecolor{KawagawaFloat2}{HTML}{2D4F67}
  - \pagecolor{KanagawaBG}
  - \color{KanagawaFG}
fontfamily: arev
fontsize: 10pt
colorlinks: true
urlcolor: KanagawaLink
---

# David Irwin 2024 Notable Accomplishments

> [Links](https://github.com/mystbinder) lead to PRs for relevant work.

## Improvements

### SPLINTER

* [totally refactored `splinter`](https://github.com/interfolio/splinter/pull/8)

  - reduced duplicate code

  - restructured main file (splinter.js) to increase readability and extensibility
  
* [created -r flag](https://github.com/interfolio/splinter/pull/10)

  - easier tracking of flakey/broken tests between testrail and jira

### E2E-TEST

* [InterfolioHttpClient](https://github.com/interfolio/e2e-test/pull/1228) 

  - cleaner implementation of api client, allows for multiple concurrent sessions to be open

  - opened the door for cleaner integration layer for e2e UI tests

### TEAM QUALITY OF LIFE

* created helper scripts to make release process and data management easier for team

  - [generate-rerun-command](https://github.com/interfolio/e2e-test/pull/1063) 

    + takes testrail run id and creates a bot-test command based off the failing tests 
        and run summary (env, app, etc)

  - [clean-faculty-lm](https://github.com/interfolio/e2e-test/pull/1228)

    + deletes left-over faculty data in the automation tenant for the current environment (.env file)

  - [validate-user-credentials](https://github.com/Interfolio/e2e-test/pull/1233)

    + validates users in user-pool.js to make sure the credentials are all working

* created shared outlook calender (*autobots ooo*) to help keep better track of out of office
  events for team members
