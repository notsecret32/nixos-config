{
  programs.alacritty = {
    enable = true;
  };

  home.file.".config/alacritty/alacritty.toml".source = ../../.config/alacritty.toml;
}
