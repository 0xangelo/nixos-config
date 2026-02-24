_: let
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
      core = {
        pager = "delta";
        sshCommand = "ssh -i ~/.ssh/0xangelo_ed25519";
      };

      # For the `delta` bits:
      # https://github.com/dandavison/delta?tab=readme-ov-file#get-started
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

  programs.gh = {
    enable = true;
    settings = {
      version = "1";
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };

  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;
    settings.git.overrideGpg = true;
  };
}
