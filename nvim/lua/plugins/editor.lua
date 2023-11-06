return {
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        tag = "nightly",
        keys = {
            { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Nvim Tree Toggle" },
        },
        opts = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            return {
                -- BEGIN_DEFAULT_OPTS
                auto_reload_on_write = true,
                disable_netrw = true,
                hijack_cursor = true,
                hijack_netrw = true,
                hijack_unnamed_buffer_when_opening = false,
                ignore_buffer_on_setup = false,
                open_on_setup = false,
                open_on_setup_file = false,
                sort_by = "name",
                root_dirs = {},
                prefer_startup_root = true,
                sync_root_with_cwd = true,
                reload_on_bufenter = false,
                respect_buf_cwd = true,
                on_attach = "default",
                remove_keymaps = false,
                select_prompts = false,
                view = {
                    centralize_selection = true,
                    cursorline = true,
                    debounce_delay = 15,
                    width = {},
                    hide_root_folder = false,
                    side = "right",
                    preserve_window_proportions = false,
                    number = true,
                    relativenumber = true,
                    signcolumn = "yes",
                    mappings = {
                        custom_only = false,
                        list = {
                            -- user mappings go here
                            { key = { "l", "CR", "o" }, action = "edit",            mode = "n" },
                            { key = { "r" },            action = "rename_basename", mode = "n" },
                        },
                    },
                    float = {
                        enable = false,
                        quit_on_focus_loss = true,
                        open_win_config = {
                            relative = "editor",
                            border = "rounded",
                            width = 30,
                            height = 30,
                            row = 1,
                            col = 1,
                        },
                    },
                },
                renderer = {
                    add_trailing = false,
                    group_empty = false,
                    highlight_git = true,
                    full_name = true,
                    highlight_opened_files = "none",
                    highlight_modified = "none",
                    root_folder_label = ":~:s?$?/..?",
                    indent_width = 0,
                    indent_markers = {
                        enable = false,
                        inline_arrows = true,
                        icons = {
                            corner = "└",
                            edge = "│",
                            item = "│",
                            -- bottom = "─",
                            none = " ",
                        },
                    },
                    icons = {
                        webdev_colors = true,
                        git_placement = "after",
                        modified_placement = "after",
                        padding = " ",
                        symlink_arrow = " ➛ ",
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                            modified = true,
                        },
                        glyphs = {
                            default = "",
                            symlink = "",
                            bookmark = "󰃀",
                            folder = {
                                arrow_closed = "",
                                arrow_open = "",
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                                symlink_open = "",
                            },
                            git = {
                                unstaged = "",
                                staged = "S",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
                    symlink_destination = true,
                },
                hijack_directories = {
                    enable = true,
                    auto_open = true,
                },
                update_focused_file = {
                    enable = true,
                    update_root = true,
                    ignore_list = {},
                },
                ignore_ft_on_setup = {},
                system_open = {
                    cmd = "",
                    args = {},
                },
                diagnostics = {
                    enable = false,
                    show_on_dirs = false,
                    show_on_open_dirs = true,
                    debounce_delay = 50,
                    severity = {
                        min = vim.diagnostic.severity.HINT,
                        max = vim.diagnostic.severity.ERROR,
                    },
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                filters = {
                    dotfiles = false,
                    git_clean = false,
                    no_buffer = false,
                    custom = { "^.git$" },
                    exclude = {},
                },
                filesystem_watchers = {
                    enable = true,
                    debounce_delay = 50,
                    ignore_dirs = {},
                },
                git = {
                    enable = true,
                    ignore = false,
                    show_on_dirs = true,
                    show_on_open_dirs = true,
                    timeout = 400,
                },
                modified = {
                    enable = false,
                    show_on_dirs = true,
                    show_on_open_dirs = true,
                },
                actions = {
                    use_system_clipboard = true,
                    change_dir = {
                        enable = true,
                        global = false,
                        restrict_above_cwd = false,
                    },
                    expand_all = {
                        max_folder_discovery = 300,
                        exclude = {},
                    },
                    file_popup = {
                        open_win_config = {
                            col = 1,
                            row = 1,
                            relative = "cursor",
                            border = "shadow",
                            style = "minimal",
                        },
                    },
                    open_file = {
                        quit_on_open = false,
                        resize_window = true,
                        window_picker = {
                            enable = true,
                            picker = "default",
                            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                            exclude = {
                                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                                buftype = { "nofile", "terminal", "help" },
                            },
                        },
                    },
                    remove_file = {
                        close_window = true,
                    },
                },
                trash = {
                    cmd = "gio trash",
                },
                live_filter = {
                    prefix = "🔍 ",
                    always_show_folders = true,
                },
                tab = {
                    sync = {
                        open = false,
                        close = false,
                        ignore = {},
                    },
                },
                notify = {
                    threshold = vim.log.levels.INFO,
                },
                ui = {
                    confirm = {
                        remove = true,
                        trash = true,
                    },
                },
                log = {
                    enable = false,
                    truncate = false,
                    types = {
                        all = false,
                        config = false,
                        copy_paste = false,
                        dev = false,
                        diagnostics = false,
                        git = false,
                        profile = false,
                        watcher = false,
                    },
                },
            }
        end,
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
            { "H", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
            { "L", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        },
        opts = function()
            local bufferline = require("bufferline")
            return {
                options = {
                    mode = "buffers",
                    style_preset = bufferline.style_preset.no_italic,
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "left",
                            separator = true,
                        },
                    },

                    separator_style = { "", "" },
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = { "close" },
                    },
                },
            }
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            { "<leader>fs", "<cmd>Telescope live_grep<cr>",   desc = "Telescope live grep" },
            { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Telescope grep string" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Telescope buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Telescope help_tags" },
        },
        opts = function()
            local actions = require("telescope.actions")
            return {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                            ["qq"] = actions.close,
                        },
                    },
                },
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            auto_install = false,
            ensure_installed = {
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "markdown",
                "svelte",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
            },
            autotag = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn", -- set to `false` to disable one of the mappings
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        },
    },
    {
        "nvimdev/hlsearch.nvim",
        event = "BufRead",
        config = true,
    },
}
