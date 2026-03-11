{pkgs, ...}: let
  personalCfg = {
    user = {
      name = "Angelo Gregorio Lovatto (GitHub)";
      email = "12701614+0xangelo@users.noreply.github.com";
    };

    core = {
      sshCommand = "ssh -i ~/.ssh/0xangelo_ed25519";
    };
  };
in {
  programs.git = {
    enable = true;

    settings = {
      alias.blame-deep = "blame -w -C -C -C";
      user.name = "Angelo Gregorio Lovatto (GitHub)";
      user.email = "12701614+0xangelo@users.noreply.github.com";

      init.defaultBranch = "main";
      core.sshCommand = "ssh -i ~/.ssh/0xangelo_ed25519";

      merge.conflictstyle = "zdiff3";

      pretty = {
        # https://stackoverflow.com/a/33807182/7842251
        # https://git-scm.com/docs/pretty-formats#Documentation/pretty-formats.txt-s
        PR = "format:- **%s**%n%w(0,2,2)%b";
      };
      rerere.enabled = true;

      # https://youtu.be/aolI_Rz0ZqY?si=dPdJrGRHBiXvVwui
      column.ui = "auto";
      branch.sort = "-committerdate";

      pager.branch = false;
    };

    signing = {
      key = null;
      signByDefault = true;
    };

    # https://seansantry.com/development/2022/12/14/split-git-nix/
    includes = [
      {
        condition = "gitdir:~/git/0xangelo/";
        contents = personalCfg;
      }
      {
        condition = "gitdir:~/nixos-config/";
        contents = personalCfg;
      }
    ];
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
    };
  };

  programs.gh = {
    enable = true;
    settings = {
      version = "1";
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };

  programs.gh-dash = {
    enable = true;
    settings.pager.diff = "diffnav";
  };

  home.packages = with pkgs; [diffnav];

  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;
    settings.git.overrideGpg = true;
  };
}
