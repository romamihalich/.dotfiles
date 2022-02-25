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
     }
   }
}
telescope.load_extension('fzf')
