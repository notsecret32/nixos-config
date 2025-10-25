{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;
    autocd = true;

    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      nixconfig = "code $NIXOS_CONFIG_DIR";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
