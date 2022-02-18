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
        ["<esc>"] = actions.close
      }
    },
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = { prompt_position = 'top' }
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
