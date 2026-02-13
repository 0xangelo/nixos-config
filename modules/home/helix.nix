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
        rustfmt.extraArgs = ["+nightly-2025-10-29"];
      };
    };

    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
      keys.normal = {
        space.w = ":w";
        space.q = ":q";
        esc = [ "collapse_selection" "keep_primary_selection" ];
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
