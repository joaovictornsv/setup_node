<div align="left">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg" width=25>
  <sup><a href="https://github.com/joaovictornsv/setup_node">Voltar ao início</a></sup>
</div>

<div align="center">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" width=100>
  <h1>Setup Javascript</h1>
  <h4>Git | Nodemon | Express | ESLint | Jest | Husky | Lint-Staged</h4>
</div>


## Git
.gitignore:
```
node_modules
coverage
.env
```

## Express

dotenv is a dependecie to read .env files
```
yarn add dotenv express;
```

## Nodemon
yarn add -D nodemon;

Add the script in `package.json`:
```json
"dev": "nodemon src/server.js",
```

## ESLint

Install Eslint
```bash
yarn add -D eslint
```

Init ESLint
```bash
yarn eslint --init
```


Replace generated file by this file: [.eslintrc.json](https://gist.github.com/joaovictornsv/25b62efad70e92fc9b6fde6d0473420c#file-eslintrc-json)


Create **.eslintignore** and write this:
```
dist
*.config.ts
```

## Jest

Install Jest
```bash
yarn add -D jest
```

Init Jest
```bash
yarn jest --init
```


- If you wil use test database

```
supertest

```

Install all dependencies
```bash
yarn add -D supertest
```

Replace generated file by this file: [jest.config.js](https://gist.github.com/joaovictornsv/25b62efad70e92fc9b6fde6d0473420c#file-jest-config-js)


Add the scripts in `package.json`:
```json
"test": "NODE_ENV=test jest --runInBand --no-cache",
"test:coverage": "yarn test --coverage"
```

## Husky and Lint-Staged
Install packages
```bash
yarn add -D husky lint-staged
```

Create Lint-Staged configuration

Create a file `.lintstagedrc.js`, and add this config:
```javascript
module.exports = {
  '*.js': 'yarn test --findRelatedTests'
}
```

Install husky hooks - This command will generate a folder with husky hooks
```bash
yarn husky install .husky
```

Add a hooks

```bash
yarn husky add .husky/<hook> <command>
```

- pre-commit
```bash
yarn husky add .husky/pre-commit 'lint-staged'
```

- pre-push
```bash
yarn husky add .husky/pre-push 'yarn test:coverage'
```

---
<div>
  <img align="left" src="https://i.imgur.com/ufUYAFh.png" width=35 alt="Profile"/>
  <sub>Made with 💙 by <a href="https://github.com/joaovictornsv">João Victor</a></sub>
</div>
