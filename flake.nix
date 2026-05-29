{
  description = "nix-rev-bug-repro";

  nixConfig.extra-trusted-public-keys = [ "dummy-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default = (import nixpkgs { system = "x86_64-linux"; }).stdenv.mkDerivation {
      name = "nix-rev-bug-repro";
      src = self;
      commit = self.rev or "MISSING";
      builder = ./builder.sh;
      meta.mainProgram = "main";
    };
  };
}