# Example Project

This is an opinionated project layout, how I think you should layout your projects.
View the chapters for each part below.

## Documentation

Please read the documentation on how to best use this template and installation. You can find it on the [docs branch here](https://github.com/rocult/script-template/tree/docs).

> [!WARNING]
> For `selene`, you must either move `.meta/selene.toml` to the root folder or install my fork of the extension [from here](https://github.com/Stefanuk12/selene/tree/vsc-config-file).
> Note that you need to build it yourself.
>
> You also need to run `mise install-darklua`

## Building and Usage

*If you don't want to read the documentation...*

1. Make sure you install [mise-en-place or mise](https://mise.jdx.dev/getting-started.html) **exactly** how the [documentation describes here](https://mise.jdx.dev/getting-started.html)
2. Run `mise install` and `mise install-darklua` while `cd` in this (root) directory
   1. \[Optional\] Run `mise init` and follow the setup process
   2. \[Optional\] Reload Luau Language Server (`CTRL + P` and search for it) to load the definition files
3. Run `mise build`, **from the root**
