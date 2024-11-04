{ config, lib, ... }:
{
  programs.nixvim.plugins.toggleterm = {
    enable = true;

    settings = {
      direction = "float";
    };
  };

  programs.nixvim.keymaps = lib.mkIf config.programs.nixvim.plugins.toggleterm.enable [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<CR>";
      options = {
        desc = "Open Terminal";
      };
    }
    {
      mode = "n";
      key = "<leader>tg";
      action.__raw = ''
        function()
          local toggleterm = require('toggleterm.terminal')

          toggleterm.Terminal:new({cmd = 'lazygit',hidden = true}):toggle()
        end
      '';
      options = {
        desc = "Open Lazygit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gg";
      action.__raw = ''
        function()
          local toggleterm = require('toggleterm.terminal')

          toggleterm.Terminal:new({cmd = 'lazygit',hidden = true}):toggle()
        end
      '';
      options = {
        desc = "Open Lazygit";
        silent = true;
      };
    }
  ];
}
