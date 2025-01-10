{
  description = "fzf preview script to preview files in fzf";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { pkgs, self', ... }: {
        packages.fzf-preview = pkgs.callPackage ./default.nix { };
        packages.default = self'.packages.fzf-preview;
      };
    };
}
