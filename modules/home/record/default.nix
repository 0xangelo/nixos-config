{pkgs, ...}: {
  home.packages = with pkgs; [
    wf-recorder
    (writeShellScriptBin "record" (builtins.readFile ./record.sh))
  ];
}
