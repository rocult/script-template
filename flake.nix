{
  description = "Luau Roblox exploit script dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    pesde.url = "github:lukadev-0/pesde-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      pesde,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        lib = pkgs.lib;
        toml = builtins.fromTOML (builtins.readFile ./pesde.toml);
        name = builtins.elemAt (lib.splitString "/" toml.name) 1;
      in
      {
        devShells.default = pkgs.mkShell {
          inherit name;

          packages = [
            pesde.packages.${system}.default

            pkgs.mise
            pkgs.rustc
            pkgs.cargo
            pkgs.gcc
            pkgs.openssl
            pkgs.pkg-config
          ];

          shellHook = ''
            export PATH="$HOME/.cargo/bin:$PATH"
            eval "$(mise activate bash)"
            mise install

            echo ""
            echo "🌙 dev shell ready"
            echo "   Tools managed by mise - run 'mise ls' to see versions"
            echo "   Run 'mise t' to see available tasks"
          '';
        };
      }
    );
}
