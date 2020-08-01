<p align="center">
  <img src="docs/logo.png">
</p>
<hr>

A simple url shortener built on top of Rails and Vue.js

### Demo

[Live Demo](www.shrinkr.xyz)

### Dependencies
- PostgreSQL 12
- Rail 6
- Ruby 2.7
- Vue.js 2.6

### Local development
1. Clone repo
2. cd into project directory
3. Ensure PostgreSQL is listening on port `5433`
4. Execute `runner.sh` in dev mode:
```sh
./runner.sh --dev
```

### Deploying to production
1. Push repo to production
2. Execute `runner.sh` in prod mode:
```sh
./runner.sh --prod
```
