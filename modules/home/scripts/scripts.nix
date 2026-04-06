{pkgs, ...}: let
  runbg = pkgs.writeShellScriptBin "runbg" (builtins.readFile ./scripts/runbg.sh);

  record = pkgs.writeScriptBin "record" (builtins.readFile ./scripts/record.sh);

  repo-clone = pkgs.writeScriptBin "repo-clone" (builtins.readFile ./scripts/repo-clone.sh);

  auto-pr-body = pkgs.writeShellScriptBin "auto-pr-body" (builtins.readFile ./scripts/auto-pr-body.sh);

  download-gist = pkgs.writeShellScriptBin "download-gist" (builtins.readFile ./scripts/download-gist.sh);

  retry = pkgs.writeShellScriptBin "retry" (builtins.readFile ./scripts/retry.sh);
in {
  home.packages = [
    runbg

    record

    repo-clone

    auto-pr-body

    download-gist

    retry
  ];
}
