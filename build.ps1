# Fun fact: you can run PowerShell scripts on Linux!

pesde run sourcemap_generator | Out-File .meta/sourcemap.json -Encoding utf8 # Needed if you want some types for packages
stylua src -f .meta/.stylua.toml
selene src --config .meta/selene.toml
Invoke-WebRequest https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.d.lua -OutFile ./roblox.d.luau
luau_lsp analyze --settings .vscode/settings.json --definitions "@roblox=./roblox.d.luau" --ignore /roblox_packages/** src
darklua process src/init.luau dist.lua -c .meta/.darklua.json # This is the main thing, make sure you at least run this
Remove-Item roblox.d.luau