{pkgs ? import <nixpkgs> {}}: let
  binary = "iota";
  version = "1.12.0";
in
  pkgs.stdenv.mkDerivation {
    pname = binary;
    version = version;

    # 1. Provide the source (could be a local file or a fetchurl)
    src = pkgs.fetchzip {
      stripRoot = false;
      url = "https://github.com/iotaledger/iota/releases/download/v${version}/iota-v${version}-linux-x86_64.tgz";
      # You MUST provide a hash for security and reproducibility
      sha256 = "sha256-EZJy2WVijwYGmNxcLExBPy5u9QRJ5OcdoqCBMycm26w=";
    };
    # src = ./bin;

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
      cp ${binary} $out/bin/
      chmod +x $out/bin/${binary}
    '';
  }
