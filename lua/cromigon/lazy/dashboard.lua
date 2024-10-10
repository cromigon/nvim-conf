return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    local logo = [[
       ######      ################        ######             #####           ######     ####      ######  ######       
    ###########    #################   ############           ########    ############   ####   ######  ###########     
  ######    ###### ####         ####  #####    ######  ###               #####    ###### ###########  ######    #####   
  ###         #### ####          ### ####         ###    #######        ####         ### ########     ####        ####  
 ####         #### #####             ####         ###       #######     ####         ### #####       ####         ####  
  ###         ####  #######          ####         ###  ###     #######  ####         ###  #######     ####        ####  
  ######      #### ###########        #####       ###  ####       ###### #####       ### ###########  ######      ####  
    ######### ####        #######      #########  ###  #################  ########## ###        ######  ######### ####  
        ##### ####           #######       ###### ###    ###############      ###### ###           #######  ##### ####  
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    local footer_color = "#2db300"

    -- colors
    local red = "#f43753"
    local blue = "#b3deef"
    local yellow = "#ffc24b"
    local green = "#6A8759"
    local lavender = "#9876AA"

    -- Set the colors for the dashboard
    vim.cmd("hi DashboardHeader guifg=" .. red)
    vim.cmd("hi DashboardFooter guifg=" .. lavender)
    vim.cmd("hi DashboardDesc guifg=" .. blue)
    vim.cmd("hi DashboardKey guifg=" .. green)
    vim.cmd("hi DashboardIcon guifg=" .. yellow)

    return opts
  end,
}
