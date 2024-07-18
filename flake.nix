{
	description = "impoor's flake";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.05";
		home-manager.url = "github:nix-community/home-manager/release-24.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = {self, nixpkgs, home-manager, ...}@inputs:
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations.default  = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = {
				inherit inputs;
			};
			modules = [
				./configuration.nix
				inputs.home-manager.nixosModules.default
			];
		};
	};
}
