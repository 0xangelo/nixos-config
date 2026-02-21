{
  pkgs ? import <nixpkgs> { },
}:
let
  version = "1.16.2-rc";
  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/iotaledger/iota/releases/download/v${version}/iota-v${version}-linux-x86_64.tgz";
    # You MUST provide a hash for security and reproducibility
    # sha256 = pkgs.lib.fakeHash;
    sha256 = "sha256-opS44N9GZ0lAlqSch56ORwMU+z4wJPhNYZdSb61Fg4c=";
  };
in
{
  iota = pkgs.stdenv.mkDerivation rec {
    pname = "iota";
    inherit version;

    # 1. Provide the source (could be a local file or a fetchurl)
    inherit src;

    # 2. Add the hook to nativeBuildInputs
    nativeBuildInputs = [
      pkgs.autoPatchelfHook
    ];

    # 3. Add the libraries the binary actually needs to run
    # autoPatchelfHook will search through these
    buildInputs = [
      pkgs.libgudev
      pkgs.stdenv.cc.cc.lib # Common for libstdc++
      pkgs.openssl
      pkgs.zlib
      pkgs.glibc
      pkgs.libpq
    ];

    installPhase = ''
      mkdir -p $out/bin
      cp ${pname} $out/bin/
      chmod +x $out/bin/${pname}
    '';
  };

  move-analyzer = pkgs.stdenv.mkDerivation rec {
    pname = "move-analyzer";
    inherit version;
    # 1. Provide the source (could be a local file or a fetchurl)
    inherit src;

    # 2. Add the hook to nativeBuildInputs
    nativeBuildInputs = [
      pkgs.autoPatchelfHook
    ];

    # 3. Add the libraries the binary actually needs to run
    # autoPatchelfHook will search through these
    buildInputs = [
      pkgs.libgcc
    ];

    installPhase = ''
      mkdir -p $out/bin
      cp ${pname} $out/bin/
      chmod +x $out/bin/${pname}
    '';
  };

}
