pesde run config
pesde run sourcemap_generator > sourcemap.json
stylua src
selene src
curl https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.lua -o ./roblox.d.luau
luau_lsp analyze --settings .vscode/settings.json --definitions ./roblox.d.luau src
darklua process src/init.luau dist.luau -c .darklua.json