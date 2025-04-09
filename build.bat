pesde run sourcemap_generator > sourcemap.json
stylua src
selene src
curl https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.lua > ./global_types/roblox.d.luau
luau_lsp analyze --settings .vscode/settings.json --definitions ./global_types/roblox.d.luau src
darklua process src/init.luau dist.luau -c .darklua.json