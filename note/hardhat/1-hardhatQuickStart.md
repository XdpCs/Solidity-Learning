# 1-hardhat快速入门

## 环境安装

首先需要安装node环境,由于我是mac环境，且已经安装了brew包管理工具，通过下面的命令行，可以安装node

```shell
brew install node # 安装node
node -v # 查看node version,也可以查看是否安装成功
```

创建工程目录，安装hardhat

```shell
pwd #查看当前路径
mkdir fyy #创建你所需要使用的项目名
cd fyy #进入项目下
npm init # 初始化
npm install --save-dev hardhat # 安装hardhat
```

**小提示**
官方文档中描述，hardhat不能安装在全局，可以保证环境重现和避免未来的版本冲突

## 创建项目

运行下列命令

```shell
npx hardhat
```

如下是运行此命令的结果

```shell
$npx hardhat
888    888                      888 888               888
888    888                      888 888               888
888    888                      888 888               888
8888888888  8888b.  888d888 .d88888 88888b.   8888b.  888888
888    888     "88b 888P"  d88" 888 888 "88b     "88b 888
888    888 .d888888 888    888  888 888  888 .d888888 888
888    888 888  888 888    Y88b 888 888  888 888  888 Y88b.
888    888 "Y888888 888     "Y88888 888  888 "Y888888  "Y888

👷 Welcome to Hardhat v2.11.0 👷‍

? What do you want to do? …
❯ Create a JavaScript project
  Create a TypeScript project
  Create an empty hardhat.config.js
  Quit
```

选择Create a TypeScript project

**小提示**
官方文档中描述，推荐使用typescript

## 运行任务

运行下列命令

```shell
npx hardhat
```

如下是运行此命令的结果

```shell
$ npx hardhat
Hardhat version 2.11.0

Usage: hardhat [GLOBAL OPTIONS] <TASK> [TASK OPTIONS]

GLOBAL OPTIONS:

  --config              A Hardhat config file.
  --emoji               Use emoji in messages.
  --help                Shows this message, or a task's help if its name is provided
  --max-memory          The maximum amount of memory that Hardhat can use.
  --network             The network to connect to.
  --show-stack-traces   Show stack traces.
  --tsconfig            A TypeScript config file.
  --verbose             Enables Hardhat verbose logging
  --version             Shows hardhat's version.


AVAILABLE TASKS:

  check                 Check whatever you need
  clean                 Clears the cache and deletes all artifacts
  compile               Compiles the entire project, building all artifacts
  console               Opens a hardhat console
  coverage              Generates a code coverage report for tests
  flatten               Flattens and prints contracts and their dependencies
  help                  Prints this message
  node                  Starts a JSON-RPC server on top of Hardhat Network
  run                   Runs a user-defined script after compiling the project
  test                  Runs mocha tests
  typechain             Generate Typechain typings for compiled contracts
  verify                Verifies contract on Etherscan

To get help for a specific task run: npx hardhat help [task]
```

**小提示**
AVAILABLE TASKS包含内置任务以及任何已安装插件附带的任务。

## 编译合约

运行下列命令

```shell
npx hardhat compile
```

该命令会自动编译`contracts/`目录下的文件，我们使用是TypeScript project，该命令会使用TypeChain去绑定TypeScript