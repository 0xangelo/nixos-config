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

      idle = {
        enabled = true;
        screenOffTimeout = 120;
        lockTimeout = 150;
        suspendTimeout = 360;
        fadeDuration = 5;
        screenOffCommand = "";
        lockCommand = "";
        suspendCommand = "";
        resumeScreenOffCommand = "";
        resumeLockCommand = "";
        resumeSuspendCommand = "";
        customCommands = "[]";
      };
    };
  };
}
