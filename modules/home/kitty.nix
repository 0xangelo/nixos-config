{...}: {
  programs.kitty = {
    enable = true;

    settings = {
      confirm_os_window_close = 0;
      window_padding_width = 10;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;
      # https://github.com/kovidgoyal/kitty/discussions/5891#discussioncomment-9852692
      allow_remote_control = "socket-only";
      listen_on = "unix:/tmp/mykitty";
    };

    keybindings = {
      ## Clipboard
      "alt+c" = "copy_to_clipboard";
      "alt+v" = "paste_from_clipboard";

      ## Scrolling
      "alt+j" = "scroll_line_down";
      "alt+k" = "scroll_line_up";
      "alt+d" = "scroll_page_down";
      "alt+u" = "scroll_page_up";

      ## Unbind
      "ctrl+shift+left" = "no_op";
      "ctrl+shift+right" = "no_op";
    };
  };
}
