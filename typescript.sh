#!/bin/bash
git init;
echo 'dist
node_modules
coverage
*config.ts' > .gitignore;

yarn init -y;
echo '{
  "name": "my_app",
  "version": "1.0.0",
  "main": "index.js",
  "license": "MIT",
  "scripts": {
    "dev": "tsnd -r tsconfig-paths/register --respawn --transpile-only --ignore-watch node_modules --no-notify src/server.ts",
    "test": "NODE_ENV=test jest --runInBand --no-cache",
    "test:coverage": "yarn test --coverage"
  }
}' > package.json;

# Dependencies
yarn add dotenv express reflect-metadata;
yarn add -D @types/express;

# Typescript
yarn add -D typescript ts-node-dev tsconfig-paths;

# ESLint
yarn add -D eslint;

# Jest
yarn add -D jest @types/jest ts-jest;

# Babel
yarn add -D babel-jest @babel/core @babel/preset-env;
yarn add -D @babel/preset-typescript;
yarn add -D @babel/plugin-proposal-class-properties @babel/plugin-proposal-decorators;

# Husky and Lint-Staged
yarn add -D husky lint-staged


yarn tsc --init;
echo '{
  "compilerOptions": {
    /* Visit https://aka.ms/tsconfig.json to read more about this file */

    /* Basic Options */
    "target": "es2017",
    "module": "commonjs",
    "lib": ["es6"],
    "allowJs": true,
    "outDir": "./dist",
    "rootDir": "./src",
    "removeComments": true,

    /* Strict Type-Checking Options */
    "strict": false,

     /* Module Resolution Options */
    "baseUrl": ".",
    "paths": {
      "@config/*": ["./src/config/*"],
      "@controllers/*": ["./src/controllers/*"],
      "@entities/*": ["./src/entities/*"],
      "@repositories/*": ["./src/repositories/*"],
      "@views/*": ["./src/views/*"],
      "@routers/*": ["./src/routers/*"],
      "@services/*": ["./src/services/*"],
    },
    "esModuleInterop": true,

    /* Experimental Options */
    "experimentalDecorators": true,
    "emitDecoratorMetadata": true,

    /* Advanced Options */
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true
  },
  "include": ["src/**/*"]
}' > tsconfig.json;

mkdir src;
cd src;
touch app.ts;
touch server.ts;
cd ..;

echo "dist
*.config.ts" > .eslintignore;

echo "import { pathsToModuleNameMapper } from 'ts-jest/utils';

const compilerPaths = {
  '@config/*': ['./src/config/*'],
  '@controllers/*': ['./src/controllers/*'],
  '@entities/*': ['./src/entities/*'],
  '@repositories/*': ['./src/repositories/*'],
  '@views/*': ['./src/views/*'],
  '@routers/*': ['./src/routers/*'],
  '@services/*': ['./src/services/*'],
};

/*
 * For a detailed explanation regarding each configuration property and type check, visit:
 * https://jestjs.io/docs/configuration
 */

export default {
  // Stop running tests after `n` failures
  bail: true,

  // Automatically clear mock calls and instances between every test
  clearMocks: true,

  // An array of glob patterns indicating a set of files for which coverage information should be collected
  collectCoverageFrom: [
    'src/controllers/*.ts',
    'src/repositories/*.ts',
    'src/services/*.ts',
    'src/middlewares/*.ts',
    'src/validators/*.ts',
  ],

  // An array of regexp pattern strings used to skip coverage collection
  coveragePathIgnorePatterns: [
    \"/node_modules/\"
  ],

  // Indicates which provider should be used to instrument code for coverage
  coverageProvider: 'v8',

  // A map from regular expressions to module names or to arrays of module names that allow to stub out resources with a single module
  moduleNameMapper: pathsToModuleNameMapper(compilerPaths, { prefix: '<rootDir>' }),

  // A preset that is used as a base for Jest's configuration
  preset: 'ts-jest',

    // The test environment that will be used for testing
  testEnvironment: \"node\",

    // A map from regular expressions to paths to transformers
  transform: undefined,
}" > jest.config.ts;

echo "module.exports = {
  presets: [
    ['@babel/preset-env', { targets: { node: 'current' } }],
    '@babel/preset-typescript',

  ],
  plugins: [
    ['@babel/plugin-proposal-decorators', { legacy: true }],
    ['@babel/plugin-proposal-class-properties', { loose: true }],
  ],
};" > babel.config.js;

echo "module.exports = {
  '*.ts': 'yarn test --findRelatedTests'
}" > .lintstagedrc.js;

yarn husky install .husky;
yarn husky add .husky/pre-commit 'lint-staged';
yarn husky add .husky/pre-push 'yarn test:coverage';

GREEN="\033[1;32m";
WHITE="\033[1;37m";
YELLOW="\033[1;33m";
RESET="\033[0m";

echo -e "${GREEN}Setup OK${RESET}";
echo -e "\n${YELLOW}Configs remaining:
  - package.json (name)
  - ESLint${RESET}"

echo -e "\n${WHITE}Access to more informations: https://github.com/joaovictornsv/setup_node${RESET}"