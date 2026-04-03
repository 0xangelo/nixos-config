{pkgs, ...}: let
  runbg = pkgs.writeShellScriptBin "runbg" (builtins.readFile ./scripts/runbg.sh);

  compress = pkgs.writeScriptBin "compress" (builtins.readFile ./scripts/compress.sh);
  extract = pkgs.writeScriptBin "extract" (builtins.readFile ./scripts/extract.sh);

  record = pkgs.writeScriptBin "record" (builtins.readFile ./scripts/record.sh);

  repo-clone = pkgs.writeScriptBin "repo-clone" (builtins.readFile ./scripts/repo-clone.sh);

  auto-pr-body = pkgs.writeShellScriptBin "auto-pr-body" (builtins.readFile ./scripts/auto-pr-body.sh);

  download-gist = pkgs.writeShellScriptBin "download-gist" (builtins.readFile ./scripts/download-gist.sh);

  unreferenced-crates = pkgs.writeShellScriptBin "unreferenced-crates" (builtins.readFile ./scripts/unreferenced-crates.sh);

  retry = pkgs.writeShellScriptBin "retry" (builtins.readFile ./scripts/retry.sh);
in {
  home.packages = [
    runbg

    compress
    extract

    record

    repo-clone

    auto-pr-body

    download-gist

    unreferenced-crates

    retry
  ];
}
