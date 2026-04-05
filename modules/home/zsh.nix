{lib, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "vi-mode" "fzf"];
    };
    initContent = lib.mkBefore ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
      export KEYTIMEOUT=1
    '';
  };

  home.shellAliases = {
    # Utils
    cd = "z";
    tt = "gtrash put";
    cat = "bat --plain";
    icat = "kitten icat";
    pdf = "tdf";
    open = "xdg-open";

    l = "eza --icons  -a --group-directories-first -1";
    ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
    tree = "eza --icons --tree --group-directories-first";
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
