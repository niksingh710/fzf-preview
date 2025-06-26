{
  description = "fzf preview script to preview files in fzf";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      perSystem = { pkgs, self', ... }: {
        packages.fzf-preview = pkgs.callPackage ./default.nix { };
        packages.default = self'.packages.fzf-preview;
      };
    };
}
