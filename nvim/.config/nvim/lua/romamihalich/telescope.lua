local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
  return
end

local telescope_actions_status_ok, actions = pcall(require, "telescope.actions")
if not telescope_actions_status_ok then
  return
end

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<tab>"] = actions.move_selection_next,
        ["<s-tab>"] = actions.move_selection_previous,
      }
    },
    preview = false,
    layout_strategy = 'bottom_pane',
    layout_config = {
      horizontal = { prompt_position = 'top' },
      bottom_pane = {
        height = 15,
        prompt_position = "top"
      },
    },
    sorting_strategy = 'ascending',
  },
  extensions = {
     fzf = {
       fuzzy = true,                    -- false will only do exact matching
       override_generic_sorter = true,  -- override the generic sorter
       override_file_sorter = true,     -- override the file sorter
       case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                        -- the default case_mode is "smart_case"
     },
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
            [":"] = function (...)
                local action_state = require "telescope.actions.state"
                local fb_utils = require "telescope._extensions.file_browser.utils"
                local picker = action_state.get_current_picker(...)
                local finder = picker.finder
                local path = finder.path
                vim.cmd("cd " .. path)
                fb_utils.redraw_border_title(picker)
                picker:refresh(finder, { reset_prompt = true, multi = picker._multi })
                print "[telescope] Changed nvim's current working directory"
            end
        },
        -- ["i"] = { },
        -- ["n"] = { },
      }
    },
   }
}
telescope.load_extension('fzf')
telescope.load_extension('file_browser')

