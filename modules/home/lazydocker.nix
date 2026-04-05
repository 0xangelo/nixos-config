_: {
  programs.lazydocker.enable = true;
  # https://github.com/jesseduffield/lazydocker/issues/4#issuecomment-1633219547
  home.shellAliases.lazypodman = "DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock lazydocker";
}
