{pkgs, ...}: {
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"
      "--hook pwd"
    ];
  };
}
