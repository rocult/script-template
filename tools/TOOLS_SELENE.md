# Tools - Selene

[Selene](https://kampfkarren.github.io/selene/) is a linter for Luau. Linters help you "write correct and idiomatic" code. They analyse your code to see any possible issues that may not be obvious. They help correct logic issues and fix bad/convoluted code.

## Usage

The only command you need to know is: `selene src`. This will run selene on all of the files inside of the `src` folder.

## Configuration

You do not need to do any extra configuration. However, you can view their lint documentation [here](https://kampfkarren.github.io/selene/lints/index.html). You can add additional lints under the `[lints]` section in the [selene.toml](https://github.com/rocult/script-template/blob/main/selene.toml) file.