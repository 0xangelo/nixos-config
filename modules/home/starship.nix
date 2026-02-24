_: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      directory = {
        format = "[ ](bold)[ $path ]($style)";
        style = "bold";
      };

      character = {
        success_symbol = "[ ](bold)[ ➜](bold green)";
        error_symbol = "[ ](bold)[ ➜](bold red)";
        # error_symbol = "[ ](bold)[ ✗](bold red)";
      };

      cmd_duration = {
        format = "[]($style)[[󰔚 ](bg:#161821 fg:#d4c097 bold)$duration](bg:#161821 fg:#BBC3DF)[ ]($style)";
        disabled = false;
        style = "bg:none fg:#161821";
      };
    };
  };
}
