{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.nixvim.plugins = {
    codesnap = {
      enable = true;
      package = pkgs.vimPlugins.codesnap-nvim;

      settings = {
        code_font_family = "MonaspiceNe Nerd Font";
        save_path = "$XDG_PICTURES_DIR/screenshots";
        mac_window_bar = true;
        title = "CodeSnap.nvim";
        watermark = "";
        breadcrumbs_separator = "/";
        has_breadcrumbs = true;
        has_line_number = false;
      };
    };

    which-key.settings.spec = lib.optionals config.programs.nixvim.plugins.codesnap.enable [
      {
        __unkeyed = "<leader>c";
        mode = "v";
        group = "Codesnap";
        icon = "󰄄 ";
      }
    ];
  };

  programs.nixvim.keymaps = lib.mkIf config.programs.nixvim.plugins.codesnap.enable [
    {
      mode = "v";
      key = "<leader>cc";
      action = "<cmd>CodeSnap<CR>";
      options = {
        desc = "Copy";
        # TODO: Update keymaps
      };
    }
    {
      mode = "v";
      key = "<leader>cs";
      action = "<cmd>CodeSnapSave<CR>";
      options = {
        desc = "Save";
        # TODO: update keymaps
      };
    }
    {
      mode = "v";
      key = "<leader>ch";
      action = "<cmd>CodeSnapHighlight<CR>";
      options = {
        desc = "Highlight";
        # TODO: update keymaps
      };
    }
    {
      mode = "v";
      key = "<leader>cH";
      action = "<cmd>CodeSnapSaveHighlight<CR>";
      options = {
        desc = "Save Highlight";
        # TODO: update keymaps
      };
    }
  ];
}
