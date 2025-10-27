# Fun fact: you can run PowerShell scripts on Linux!

pesde run sourcemap_generator | Out-File .meta/sourcemap.json -Encoding utf8
stylua src -f .meta/.stylua.toml
selene src --config .meta/selene.toml
Invoke-WebRequest https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.lua -OutFile ./roblox.d.luau
luau_lsp analyze --settings .vscode/settings.json --definitions ./roblox.d.luau src
darklua process src/init.luau dist.lua -c .meta/.darklua.json
Remove-Item roblox.d.luau