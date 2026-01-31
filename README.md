# Example Project

This is an opinionated project layout, how I think you should layout your projects. View the chapters for each part below.

## Documentation

Please read the documentation on how to best use this template and installation. You can find it on the [docs branch here](https://github.com/rocult/script-template/tree/docs).

> [!WARNING]
> For `selene`, you must either move `.meta/selene.toml` to the root folder or install my fork of the extension [from here](https://github.com/Stefanuk12/selene/tree/vsc-config-file). Note that you need to build it yourself.

## Building and Usage

*If you don't want to read the documentation...*

1. Make sure you install [pesde](https://docs.pesde.dev/installation/) **exactly** how the [documentation describes here](https://docs.pesde.dev/installation/)
2. Run `pesde install` while `cd` in this (root) directory
   1. \[Optional\] Reload Luau Language Server (`CTRL + P` and search for it)
3. Run [build.ps1](./build.ps1), **from the root**
