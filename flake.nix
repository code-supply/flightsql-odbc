{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    with nixpkgs.legacyPackages.x86_64-linux;
    {
      packages.x86_64-linux.default = stdenv.mkDerivation {
        name = "flight-sql";
        src = ./.;
        nativeBuildInputs = [
          boost
          cmake
          gtest
          protobuf3_20
          unixODBC
          zlib
        ];
      };
    };
}
