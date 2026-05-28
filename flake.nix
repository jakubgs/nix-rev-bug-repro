{
  description = "nix-rev-bug-repro";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-25.11;

  inputs.self.submodules = true;

  outputs = { self, nixpkgs }: let
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
