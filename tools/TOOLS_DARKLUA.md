# Tools - darklua

[Darklua](https://darklua.com/) is the most essential part of this template. It combines all of your separate script files into one final bundled file. You can then upload this file to [Luarmor](https://luarmor.net/) for obfuscation, or wherever.

## Usage

To run darklua, the one command you need to know is: `darklua process src/init.luau dist.luau -c .meta/.darklua.json`.

This will:

- Combine all the files `src/init.luau` requires and bundle them with it
- Output the file to `dist.luau`
- Using the configuration defined in `.darklua.json`

## Configuration

You can view their [official documentation here](https://darklua.com/docs/config/).
