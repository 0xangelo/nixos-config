{config, ...}: {
  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    gtk4.theme = config.gtk.theme;
  };
}
