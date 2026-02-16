{pkgs, ...}: let
  wall-change = pkgs.writeShellScriptBin "wall-change" (builtins.readFile ./scripts/wall-change.sh);
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" (builtins.readFile ./scripts/wallpaper-picker.sh);

  runbg = pkgs.writeShellScriptBin "runbg" (builtins.readFile ./scripts/runbg.sh);
  music = pkgs.writeShellScriptBin "music" (builtins.readFile ./scripts/music.sh);

  toggle_blur = pkgs.writeScriptBin "toggle_blur" (builtins.readFile ./scripts/toggle_blur.sh);
  toggle_oppacity = pkgs.writeScriptBin "toggle_oppacity" (builtins.readFile ./scripts/toggle_oppacity.sh);

  maxfetch = pkgs.writeScriptBin "maxfetch" (builtins.readFile ./scripts/maxfetch.sh);

  compress = pkgs.writeScriptBin "compress" (builtins.readFile ./scripts/compress.sh);
  extract = pkgs.writeScriptBin "extract" (builtins.readFile ./scripts/extract.sh);

  shutdown-script = pkgs.writeScriptBin "shutdown-script" (builtins.readFile ./scripts/shutdown-script.sh);

  show-keybinds = pkgs.writeScriptBin "show-keybinds" (builtins.readFile ./scripts/keybinds.sh);

  record = pkgs.writeScriptBin "record" (builtins.readFile ./scripts/record.sh);

  repo-clone = pkgs.writeScriptBin "repo-clone" (builtins.readFile ./scripts/repo-clone.sh);

  auto-pr-body = pkgs.writeShellScriptBin "auto-pr-body" (builtins.readFile ./scripts/auto-pr-body.sh);

  download-gist = pkgs.writeShellScriptBin "download-gist" (builtins.readFile ./scripts/download-gist.sh);

  unreferenced-crates = pkgs.writeShellScriptBin "unreferenced-crates" (builtins.readFile ./scripts/unreferenced-crates.sh);

  retry = pkgs.writeShellScriptBin "retry" (builtins.readFile ./scripts/retry.sh);
in {
  home.packages = [
    wall-change
    wallpaper-picker

    runbg
    music

    toggle_blur
    toggle_oppacity

    maxfetch

    compress
    extract

    shutdown-script

    show-keybinds

    record

    repo-clone

    auto-pr-body

    download-gist

    unreferenced-crates

    retry
  ];
}
