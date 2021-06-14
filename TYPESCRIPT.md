<div align="left">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg" width=25>
  <sup><a href="https://github.com/joaovictornsv/setup_node">Voltar ao início</a></sup>
</div>

<div align="center">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" width=100>
  <h1>Setup Typescript</h1>
  <h4>Git | Typescript | ts-node-dev | Express | ESLint | Jest | Babel | Husky | Lint-Staged</h4>
</div>

## Git
.gitignore:
```
node_modules
coverage
.env
```

## Typescript and ts-node-dev

Install **Typescript**

```bash
yarn add -D typescript
```

Install **ts-node-dev** and **tsconfig-paths**
```bash
yarn add -D ts-node-dev tsconfig-paths
```

Generate **tsconfig.json**
```bash
yarn tsc --init
```

Replace generated file by this file: [tsconfig.json](https://gist.github.com/joaovictornsv/039bb193dac7056671916bbb13378511#file-tsconfig-json)

In package.json add this scripts:
```json
"dev": "tsnd -r tsconfig-paths/register --respawn --transpile-only --ignore-watch node_modules --no-notify src/server.ts",
"typeorm": "tsnd node_modules/typeorm/cli.js", // if use typeorm
```

## Express

dotenv is a dependecie to read .env files
```
yarn add dotenv express;
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

If the eslint libs not working, install the following packages:

```
@typescript-eslint/eslint-plugin
@typescript-eslint/parser

eslint-config-airbnb-base
eslint-import-resolver-typescript
eslint-plugin-import
```
Install all dependencies
```bash
yarn add -D @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-config-airbnb-base eslint-import-resolver-typescript eslint-plugin-import
```

Replace generated file by this file: [.eslintrc.json](https://gist.github.com/joaovictornsv/039bb193dac7056671916bbb13378511#file-eslintrc-json)


Create **.eslintignore** and write this:
```
dist
*.config.ts
```

## Jest

Install Jest
```bash
yarn add -D jest @types/jest
```

Init Jest
```bash
yarn jest --init
```

Install aux libs:
```
ts-jest

``` 

```bash
yarn add -D ts-jest
```


- If you wil use test database

```
supertest
@types/supertest

```

Install all dependencies
```bash
yarn add -D supertest @types/supertest
```

Replace generated file by this file: [jest.config.ts](https://gist.github.com/joaovictornsv/039bb193dac7056671916bbb13378511#file-jest-config-ts)

Add the scripts in `package.json`:
```json
"test": "NODE_ENV=test jest --runInBand --no-cache",
"test:coverage": "yarn test --coverage"
```

If the jest libs not working, read the Babel section:

## Babel

Install packages
```bash
yarn add -D babel-jest @babel/core @babel/preset-env
```

Install package to use with typescript:
```bash
yarn add -D @babel/preset-typescript
```

Install specific package to use with typescript:
```
@babel/plugin-proposal-class-properties
@babel/plugin-proposal-decorators
```

Replace generated file by this file: [babel.config.js](https://gist.github.com/joaovictornsv/039bb193dac7056671916bbb13378511#file-babel-config-js)


## Husky and Lint-Staged
Install packages
```bash
yarn add -D husky lint-staged
```

Create Lint-Staged configuration

Create a file `.lintstagedrc.js`, and add this config:
```javascript
module.exports = {
  '*.ts': 'yarn test --findRelatedTests'
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
