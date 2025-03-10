vim.keymap.set("n", "<leader>bf", function()
  local command = vim.fn.input("Compile with cmake? (Y/n) "):lower()
  
  if command == "y" then
    local dir = vim.fn.input("Directory: ")

    if dir == "" then
      vim.print("This user wants to build in an empty directory? WTF?\n")
      return  -- Exit early to avoid errors
    end

    -- Run CMake build with real-time output
    vim.fn.jobstart("cmake --build .", {
      cwd = dir,
      stdout_buffered = false,  -- Ensures real-time output
      stderr_buffered = false,  -- Ensures real-time error output
      on_stdout = function(_, data, _)
        for _, line in ipairs(data) do
          if line ~= "" then
            print(line)  -- Print each line immediately
          end
        end
      end,
      on_stderr = function(_, data, _)
        for _, line in ipairs(data) do
          if line ~= "" then
            print("ERROR: " .. line)
          end
        end
      end,
      on_exit = function(_, exit_code, _)
        if exit_code == 0 then
          print("[BUILD SCRIPT FOR CMAKE] BUILD SUCCESS")
        else
          print("[BUILD SCRIPT FOR CMAKE] BUILD FAILED: " .. exit_code)
        end
      end,
    })
  
  elseif command == "n" then
    vim.print("Go do something else, then.\n")
  end
end)
