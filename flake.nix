{
  description = "nix-rev-bug-repro";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-25.11;
  inputs.flake-utils.url = "github:numtide/flake-utils?rev=c1dfcf08411b08f6b8615f7d8971a2bfa81d5e8a";

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
