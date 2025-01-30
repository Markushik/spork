{
  description = "my epic vims collection";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
  let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
  in
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.neovim
          pkgs.elixir
        ];

        shellHook = ''
          echo "h Mark!"
          mix
        '';
      };
    });
}

