# Tools - Pesde

[pesde](https://docs.pesde.dev/) is a package manager. Essentially, it automates the installation of important tooling, like the ones mentioned in [tools](./TOOLS.md). It also supports the ability to install packages and libraries for you to use in your code.

## Installation

Please follow the official installation guide [here](https://docs.pesde.dev/installation/).

## Configuration

All of the configuration is done inside the [pesde.toml](https://github.com/rocult/script-template/blob/main/pesde.toml) file. You can view the official documentation [here](https://docs.pesde.dev/reference/manifest/). However, I'll walk through some of the important parts here, you can view the rest on the official documentation.

### Name

To start, we need to name your project. It must be in the format of `username/project_name`, as shown there.

### Description

This is optional, you can remove it if you want to. It's a brief description for other people to read, mainly when you publish your code.

## Installing Dependencies

You should put all of your dependencies under `[dependencies]`. The items under `[dev_dependencies]` include all of the tooling like the ones mentioned in [tools](./TOOLS.md). However, I recommend installing regular dependencies via [wally](https://wally.run).

On [their site](https://wally.run) you can search for packages that you want. Once you found the package you want, run the following in your console:
```bash
pesde add wally#PACKAGE
```

Make sure to replace `PACKAGE` with the full name. For example, `evaera/promise` which becomes:
```bash
pesde add wally#evaera/promise
```

After installing all of your dependencies, make sure to run `pesde install`!

## Updating Dependencies

To update your dependencies to the latest version, you can run the following two commands:
```bash
pesde update
pesde install
```