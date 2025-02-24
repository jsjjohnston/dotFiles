{ config, lib, ... }:
{
  programs.nixvim.plugins.package-info = {
    enable = true;
    enableTelescope = true;
  };
  # FIX: Annoying Notification that never goes away
  programs.nixvim.keymaps =
    lib.mkIf
      (
        config.programs.nixvim.plugins.telescope.enable
        && config.programs.nixvim.plugins.package-info.enable
      )
      [
        {
          mode = "n";
          key = "<leader>fpi";
          action = "<cmd>Telescope package_info<CR>";
          options = {
            desc = "Find [P]ackage [I]nfo";
          };
        }
      ];
}
