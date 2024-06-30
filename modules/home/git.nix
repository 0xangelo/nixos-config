{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "unmaykr (aftermath)";
    userEmail = "98741738+unmaykr-aftermath@users.noreply.github.com";
    
    signing = {
      key = null;
      signByDefault = true;
    };

    extraConfig = { 
      init.defaultBranch = "main";
      # credential.helper = "store";
    };
  };

  programs.gh = {
    enable = true;
    # extensions = with pkgs; [gh-markdown-preview];
    settings = {
      version = "1";
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };

  home.packages = (with pkgs; [
    gh
  ]);
}
