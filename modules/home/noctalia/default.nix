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
      sessionMenu = {
        countdownDuration = 5000;
      };

      general.lockScreenCountdownDuration = 5000;
    };
  };
}
