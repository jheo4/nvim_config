return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- =======================================================================
      -- C/C++ Configuration (clangd)
      -- =======================================================================
      clangd = {
        -- 💡 HOW TO HANDLE CUSTOM LIBRARIES/HEADERS WITHIN A PROJECT:
        -- Do NOT modify this Neovim configuration file. Instead, handle it at
        -- the project root directory using one of the following methods:
        --
        -- Method 1 (Recommended): If using CMake, add this to your CMakeLists.txt:
        --   set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
        --   This generates 'compile_commands.json' which clangd reads automatically.
        --
        -- Method 2: Create a '.clangd' YAML file at your project root:
        --   CompileFlags:
        --     Add:
        --       - "-I./include"
        --       - "-I./libs/my_custom_lib/include"
        --
        -- Method 3: Create a 'compile_flags.txt' file at your project root:
        --   -I./include
        --   -I./libs/my_custom_lib/include
        cmd = {
          "clangd",
          "--background-index",
          "--suggest-missing-includes",
          "--clang-tidy",
        },
      },
      -- =======================================================================
      -- Python Configuration
      -- =======================================================================
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              -- if stict is too strict, it can be with "standard" or "basic"
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
      -- =======================================================================
      -- Terraform Configuration
      -- =======================================================================
      terraformls = {
        settings = {
          terraform = {
            trace = {
              server = "verbose",
            },
          },
        },
      },
    },
  },
}
