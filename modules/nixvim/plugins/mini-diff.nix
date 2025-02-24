{ lib, config, ... }:
{
  programs.nixvim.plugins = {
    mini = {
      enable = true;

      modules = {
        diff = {
          view = {
            style = "sign";
          };
        };
      };
    };
  };

  programs.nixvim.keymaps =
    lib.mkIf
      (
        config.programs.nixvim.plugins.mini.enable
        && lib.hasAttr "diff" config.programs.nixvim.plugins.mini.modules
      )
      [
        {
          mode = "n";
          key = "<leader>gto";
          action.__raw = "MiniDiff.toggle_overlay";
          options = {
            desc = "[T]oggle Git Diff Overlay";
            silent = true;
          };
        }
      ];
}
