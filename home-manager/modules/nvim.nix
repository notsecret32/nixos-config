{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim" = {
    source = builtins.fetchTarball {
      url = "https://github.com/notsecret32/kickstart.nvim/tree/0.1.0";
      sha256 = "eDhr0b8S7nqUofi+tbtL0zfwh8O04GYIectUjSJNzKs=";
    };
    recursive = true;
  };
}
