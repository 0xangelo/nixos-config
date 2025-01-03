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
      core = {
        sshCommand = "ssh -i ~/.ssh/id_ed25519";
      };

      pretty = {
        # https://stackoverflow.com/a/33807182/7842251
        PR = "format:- %h **%s**%n%w(0,2,2)%b";
      };
    };

    # https://seansantry.com/development/2022/12/14/split-git-nix/
    includes = [
      {
        contents = {
          user = {
            name = "Angelo Gregorio Lovatto (GitHub)";
	          email = "12701614+0xangelo@users.noreply.github.com";
	        };

	        core = {
	          sshCommand = "ssh -i ~/.ssh/0xangelo_ed25519";
          };
        };

        condition = "gitdir:~/git/0xangelo/";
      }
      {
        contents = {
          user = {
            name = "Angelo Gregorio Lovatto (GitHub)";
	          email = "12701614+0xangelo@users.noreply.github.com";
	        };

	        core = {
	          sshCommand = "ssh -i ~/.ssh/0xangelo_ed25519";
          };
        };

        condition = "gitdir:~/nixos-config/";
      }
    ];
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
