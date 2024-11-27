{ config, lib, ... }:
{
  programs.nixvim.plugins = {
    noice = {
      enable = true;

      # Hides the title above noice boxes
      settings.cmdline = {
        format = {
          cmdline = {
            pattern = "^:";
            icon = "";
            lang = "vim";
            opts = {
              border = {
                text = {
                  top = "Cmd";
                };
              };
            };
          };
          search_down = {
            kind = "search";
            pattern = "^/";
            icon = " ";
            lang = "regex";
          };
          search_up = {
            kind = "search";
            pattern = "^%?";
            icon = " ";
            lang = "regex";
          };
          filter = {
            pattern = "^:%s*!";
            icon = "";
            lang = "bash";
            opts = {
              border = {
                text = {
                  top = "Bash";
                };
              };
            };
          };
          lua = {
            pattern = "^:%s*lua%s+";
            icon = "";
            lang = "lua";
          };
          help = {
            pattern = "^:%s*he?l?p?%s+";
            icon = "󰋖";
          };
          input = { };
        };
      };

      settings.messages = {
        view = "mini";
        viewError = "mini";
        viewWarn = "mini";
      };

      settings.lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };

        progress.enabled = true;
        signature.enabled = !config.programs.nixvim.plugins.lsp-signature.enable;
      };

      settings.popupmenu.backend = "nui";
      # Doesn't support the standard cmdline completions
      # popupmenu.backend = "cmp";

      settings.presets = {
        bottom_search = false;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = true;
        lsp_doc_border = true;
      };

      settings.routes = [
        {
          filter = {
            event = "msg_show";
            kind = "search_count";
          };
          opts = {
            skip = true;
          };
        }
        {
          # skip progress messages from noisy servers
          filter = {
            event = "lsp";
            kind = "progress";
            cond.__raw = ''
              function(message)
                local client = vim.tbl_get(message.opts, 'progress', 'client')
                local servers = { 'jdtls' }

                for index, value in ipairs(servers) do
                    if value == client then
                        return true
                    end
                end
              end
            '';
          };
          opts = {
            skip = true;
          };
        }
      ];

      settings.views = {
        cmdline_popup = {
          border = {
            style = "single";
          };
        };

        confirm = {
          border = {
            style = "single";
            text = {
              top = "";
            };
          };
        };
      };
    };

    notify = {
      enable = true;
    };
  };

  programs.nixvim.keymaps =
    lib.mkIf
      (config.programs.nixvim.plugins.telescope.enable && config.programs.nixvim.plugins.noice.enable)
      [
        {
          mode = "n";
          key = "<leader>fn";
          action = "<cmd>Telescope noice<CR>";
          options = {
            desc = "Find [N]otifications";
          };
        }
      ];
}
