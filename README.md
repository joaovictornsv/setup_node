<div align="center">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg" width=100>
  <h1>Setup Node</h1>
  <h4>Javascript and Typescript</h4>
</div>

---
<h2 id="conteudos">Contents</h2>

[➜ Manual installation](#see-all-manual-installation-instructions)<br>
[➜ How to install scripts](#how-to-install-scripts)<br>
[➜ How to use](#how-to-use)<br>


---

## See all manual installation instructions:

- [Javascript Manual Installation](./JAVASCRIPT.md)

- [Typescript Manual Installation](./TYPESCRIPT.md)

---

## How to install scripts:
### 1. Clone this repository
```
$ git clone https://github.com/joaovictornsv/setup_node.git
```
In root of the repository you will see the following files:
```
- 📁 scripts
- 📄 chmod.sh
```

### 2. Changing execute permission
Now open the terminal in root of the repository. Then copy the code in `chmod.sh`, paste in your terminal and run:

```bash
$ for filename in scripts/*.sh; do
  chmod +x $filename;
done;
```
This code change the permission to run scripts. Otherwise the scripts will not run.

### 3. Set the path to scripts
On top of `index.sh` file, set complete path to the scripts folder
```
SCRIPTS=/home/user/.../setup_node/scripts/
```

### 4. Create an alias
Define an alias on your terminal to make it easier to run scripts.
In alias, set the path to `index.sh` in the scripts folder.

```
- 📁 scripts
  - 📄 index.sh
```

Example:
```zsh
alias setupnode=/home/user/.../setup_node/scripts/index.sh
```
---

## How to use:
To install the select setup to install you must pass a flags with alias

### Complete setups
`--typescript`: Typescript Complete Setup
<details>
  <summary>Libs</summary>

  - Git
  - Typescript
  - ts-node-dev
  - Express
  - ESLint
  - Jest
  - Babel
  - Husky
  - Lint-Staged
</details>

`--javascript`: Javascript Complete Setup
<details>
  <summary>Libs</summary>
  
  - Git
  - Nodemon
  - Express
  - ESLint
  - Jest
  - Husky
  - Lint-Staged
</details>

### Jest
<details>
  <summary>Libs</summary>

  - Husky
  - Lint-Staged
</details>

`--jestjs`: Jest setup for Javascript project.

`--jestts`: Jest setup for Typescript project.

### Husky
<details>
  <summary>Libs</summary>

  - Husky
  - Lint-Staged
</details>

> Requires git and yarn initialized.


`--huskyjs`: Husky setup for Javascript project.

`--huskyts`: Husky setup for Typescript project.


### Example
```bash
$ setupnode --typescript
```
<div align="center">
  <img src="https://i.imgur.com/74iLyth.gif">
</div>

---

## License
- MIT License - [About](https://github.com/joaovictornsv/setup_node/blob/master/LICENSE)

---


<div>
  <img align="left" src="https://i.imgur.com/ufUYAFh.png" width=35 alt="Profile"/>
  <sub>Made with 💙 by <a href="https://github.com/joaovictornsv">João Victor</a></sub>
</div>
