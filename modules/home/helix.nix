{...}: {
  programs.helix = {
    enable = true;

    languages = {
      language-server.rust-analyzer.config = {
        check.command = "clippy";
        cargo.features = "all";
        completion.excludeTraits = [
          "color_eyre::owo_colors::OwoColorize"
          "core::any::Any"
          "core::borrow::Borrow"
          "core::borrow::BorrowMut"
          "core::convert::Into"
          "core::convert::TryInto"
          "moverox_iota::ConvIota"
          "moverox_iota::ConvMoverox"
          "moverox_iota::IntoIota"
          "moverox_iota::IntoMoverox"
          "owo_colors::OwoColorize"
          "std::borrow::Borrow"
          "std::borrow::BorrowMut"
          "tap::Conv"
          "tap::Pipe"
          "tap::Tap"
          "tap::TapFallible"
          "tap::TapOptional"
          "tap::TryConv"
          "tracing::instrument::Instrument"
          "tracing::instrument::WithSubscriber"
        ];
      };

      # [[language]]
      # name = "move"
      # scope = "source.move"
      # injection-regex = "move"
      # roots = ["Move.toml"]
      # file-types = ["move"]
      # comment-token = "//"
      # indent = { tab-width = 4, unit = "    " }
      # language-servers = []
      #
      # [[grammar]]
      # name = "move"
      # source = { git = "https://github.com/tzakian/tree-sitter-move", rev = "8bc0d1692caa8763fef54d48068238d9bf3c0264" }

      # language = [{
      #   name = "move";
      #   scope = "source.move";
      #   injection-regex = "move";
      #   roots = ["Move.toml"];
      #   file-types = ["move"];
      #   comment-token = "//";
      #   indent = { tab-width = 4; unit = "    "; };
      #   language-servers = [];
      # }];

      grammar = [
        {
          name = "move";
          source = {
            git = "https://github.com/0xangelo/tree-sitter-move";
            rev = "f7a40b1fdd588311b575cbc4d40291c0a5062f49";
          };
        }
      ];
    };

    settings = {
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        soft-wrap.enable = true;
      };
      keys.normal = {
        space.w = ":w";
        space.q = ":q";
        "C-g" = [
          ":write-all"
          ":new"
          ":insert-output lazygit"
          ":buffer-close!"
          ":redraw"
          ":reload-all"
        ];
      };
    };
  };
}
