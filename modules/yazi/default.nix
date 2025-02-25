{...}: {
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    theme = {
      manager = {
        border_style = {fg = "#3c4048";};
        cwd = {fg = "#5ef1ff";};
        find_keyword = {
          bold = true;
          fg = "#5eff6c";
        };
        find_position = {fg = "#ffffff";};
        hovered = {
          bg = "#7b8496";
          bold = true;
          fg = "#ffffff";
        };
        marker_copied = {
          bg = "#f1ff5e";
          fg = "#f1ff5e";
        };
        marker_cut = {
          bg = "#ff6e5e";
          fg = "#ff6e5e";
        };
        marker_selected = {
          bg = "#3c4048";
          fg = "#5eff6c";
        };
        preview_hovered = {
          bg = "#3c4048";
          bold = true;
          fg = "#ffffff";
        };
        tab_active = {
          bg = "#5ea1ff";
          fg = "#16181a";
        };
        tab_inactive = {
          bg = "#3c4048";
          fg = "#ffffff";
        };
        count_selected = {
          bg = "#5eff6c";
          fg = "#16181a";
        };
        count_copied = {
          bg = "#f1ff5e";
          fg = "#16181a";
        };
        count_cut = {
          bg = "#ff6e5e";
          fg = "#16181a";
        };
      };
      completion = {
        active = {
          bg = "#7b8496";
          fg = "#bd5eff";
        };
        border = {fg = "#5ea1ff";};
        inactive = {fg = "#ffffff";};
      };
      filetype = {
        rules = [
          {
            fg = "#5ef1ff";
            mime = "image/*";
          }
          {
            fg = "#f1ff5e";
            mime = "video/*";
          }
          {
            fg = "#f1ff5e";
            mime = "audio/*";
          }
          {
            fg = "#bd5eff";
            mime = "application/zip";
          }
          {
            fg = "#bd5eff";
            mime = "application/gzip";
          }
          {
            fg = "#bd5eff";
            mime = "application/x-tar";
          }
          {
            fg = "#bd5eff";
            mime = "application/x-bzip";
          }
          {
            fg = "#bd5eff";
            mime = "application/x-bzip2";
          }
          {
            fg = "#bd5eff";
            mime = "application/x-7z-compressed";
          }
          {
            fg = "#bd5eff";
            mime = "application/x-rar";
          }
          {
            fg = "#bd5eff";
            mime = "application/xz";
          }
          {
            fg = "#5eff6c";
            mime = "application/doc";
          }
          {
            fg = "#5eff6c";
            mime = "application/pdf";
          }
          {
            fg = "#5eff6c";
            mime = "application/rtf";
          }
          {
            fg = "#5eff6c";
            mime = "application/vnd.*";
          }
          {
            bold = true;
            fg = "#5ea1ff";
            mime = "inode/directory";
          }
          {
            fg = "#ffffff";
            mime = "*";
          }
        ];
      };
      help = {
        desc = {fg = "#ffffff";};
        footer = {fg = "#ffffff";};
        hovered = {
          bg = "#7b8496";
          fg = "#ffffff";
        };
        on = {fg = "#bd5eff";};
        run = {fg = "#5ef1ff";};
      };
      input = {
        border = {fg = "#5ea1ff";};
        selected = {bg = "#7b8496";};
        title = {fg = "#ffffff";};
        value = {fg = "#ffffff";};
      };
      select = {
        active = {fg = "#bd5eff";};
        border = {fg = "#5ea1ff";};
        inactive = {fg = "#ffffff";};
      };
      status = {
        mode_normal = {
          bg = "#5ea1ff";
          bold = true;
          fg = "#16181a";
        };
        mode_select = {
          bg = "#5eff6c";
          bold = true;
          fg = "#16181a";
        };
        mode_unset = {
          bg = "#ff5ef1";
          bold = true;
          fg = "#16181a";
        };
        permissions_r = {fg = "#f1ff5e";};
        permissions_s = {fg = "#5ef1ff";};
        permissions_t = {fg = "#5ea1ff";};
        permissions_w = {fg = "#ff6e5e";};
        permissions_x = {fg = "#5eff6c";};
        progress_error = {
          bg = "#16181a";
          fg = "#ff6e5e";
        };
        progress_label = {
          bg = "#16181a";
          fg = "#ffffff";
        };
        progress_normal = {
          bg = "#16181a";
          fg = "#ffffff";
        };
        separator_style = {
          bg = "#3c4048";
          fg = "#3c4048";
        };
      };
      tasks = {
        border = {fg = "#5ea1ff";};
        hovered = {
          bg = "#7b8496";
          fg = "#ffffff";
        };
        title = {fg = "#ffffff";};
      };
      which = {
        cand = {fg = "#5ef1ff";};
        desc = {fg = "#ffffff";};
        mask = {bg = "#3c4048";};
        rest = {fg = "#ff5ef1";};
        separator_style = {fg = "#7b8496";};
      };
    };
  };
}
