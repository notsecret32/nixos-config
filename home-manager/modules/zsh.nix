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
      cfg = "code $NH_OS_FLAKE";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
