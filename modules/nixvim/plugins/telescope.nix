{...}: {
  programs.nixvim = {
    plugins = {
      telescope = {enable = true;};
    };
  };
}
