{
  description = "nix-rev-bug-repro";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-25.11;
  inputs.flake-utils.url = "github:numtide/flake-utils?rev=11707dc2f618dd54ca8739b309ec4fc024de578b";

  outputs = { self, nixpkgs, flake-utils }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    packages."x86_64-linux".default = pkgs.stdenv.mkDerivation {
      name = "nix-rev-bug-repro";
      src = self;
      commit = self.sourceInfo.rev or "unknown";
      builder = ./builder.sh;
      meta.mainProgram = "main";
    };
  };
}
