{ ... }:

{
  # https://www.reddit.com/r/hyprland/comments/17oti85/comment/k849h7a/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
  services.keyd = {
    enable = true;
    keyboards.default.settings = {
      main = {
        capslock = "overload(meta, esc)";
      };
    };
  };
}
