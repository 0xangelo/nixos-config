{inputs, ...}: {
  imports = [inputs.noctalia.homeModules.default];
  programs.noctalia-shell = {
    enable = true;
    settings = {
      location = {
        weatherEnabled = false;
      };
      appLauncher = {
        enableClipboardHistory = true;
      };
    };
  };
}
