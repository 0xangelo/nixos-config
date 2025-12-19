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

    aliases = {
      blame-deep = "blame -w -C -C -C";
    };
    userName = "Angelo Gregorio Lovatto (GitHub)";
    userEmail = "12701614+0xangelo@users.noreply.github.com";

    signing = {
      key = null;
      signByDefault = true;
    };

    # For the `delta` bits:
    # https://github.com/dandavison/delta?tab=readme-ov-file#get-started
    extraConfig = {
      init.defaultBranch = "main";
      # credential.helper = "store";
      core = {
        pager = "delta";
        sshCommand = "ssh -i ~/.ssh/0xangelo_ed25519";
      };

      interactive = {
        diffFilter = "delta --color-only";
      };

      delta = {
        navigate = true;
      };

      merge = {
        conflictstyle = "zdiff3";
      };

      pretty = {
        # https://stackoverflow.com/a/33807182/7842251
        PR = "format:- %h **%s**%n%w(0,2,2)%b";
      };
      rerere.enabled = true;

      # https://youtu.be/aolI_Rz0ZqY?si=dPdJrGRHBiXvVwui
      column.ui = "auto";
      branch.sort = "-committerdate";

      pager.branch = false;

      gitbutler.signCommits = true;
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

  programs.gh = {
    enable = true;
    # extensions = with pkgs; [gh-markdown-preview];
    settings = {
      version = "1";
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };

  programs.lazygit = {
    enable = true;
    # Only available >= 25.11
    # enableZshIntegration = true;
    settings.git.overrideGpg = true;
  };
}
