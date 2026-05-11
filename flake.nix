{
  description = "Home Server Flake";
  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-25.11";
    nixarr.url = "github:nix-media-server/nixarr";
  };
  outputs =
    { nixpkgs, nixarr, ... }:
    {
      nixosConfigurations.server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixarr.nixosModules.default
          ./configuration.nix
        ];
      };
    };
}
