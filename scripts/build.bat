pesde run sourcemap_generator > .meta/sourcemap.json
stylua src -f .meta/.stylua.toml
selene src --config .meta/selene.toml
curl https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.lua -o ./roblox.d.luau
luau_lsp analyze --settings .vscode/settings.json --definitions ./roblox.d.luau src
darklua process src/init.luau dist.lua -c .meta/.darklua.json
del roblox.d.luau