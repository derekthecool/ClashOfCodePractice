vim.keymap.set({ "n", "i" }, "`u;", function()
	vim.cmd("luafile ./get-all-multi-solution-function-names.lua")
end, { silent = true, desc = "Find and replace all function pointers and load into solutions array" })

local ts_query = require("vim.treesitter.query")
local parsers = require("vim.treesitter")

-- Assuming you've already got the buffer and language set up
local lang = "c"
local bufnr = vim.api.nvim_get_current_buf()
local parser = parsers.get_parser(bufnr, lang)
local solutionFunctionsQuery = ts_query.parse(
	lang,
	[[
(function_definition
  declarator: (pointer_declarator
    declarator: (function_declarator
      declarator: (identifier) @function.name (#match? @function.name "solution\\d+")
    )
  )
) @function.definition
]]
)

local solutionsListQuery = ts_query.parse(
	lang,
	[[
(pointer_declarator
  declarator: (array_declarator
    declarator: (identifier) @solutions (#match? @solutions "solutions")
  )
)
]]
)

for _, tree in ipairs(parser:parse()) do
	local function_names = {}
	for id, node in solutionFunctionsQuery:iter_captures(tree:root(), bufnr, 0, -1) do
		local name = solutionFunctionsQuery.captures[id] -- This gets the capture name
		if name == "function.name" then -- We only care about the function name captures
			local text = vim.treesitter.get_node_text(node, bufnr)
			print("Matched function: " .. text)
			table.insert(function_names, text)
		end
	end

	local functionListText = table.concat(function_names, ", ")
	vim.fn.setreg("a", functionListText)
	V(functionListText)

	for id, node in solutionsListQuery:iter_captures(tree:root(), bufnr, 0, -1) do
		local text = vim.treesitter.get_node_text(node, bufnr)
		local row = vim.treesitter.get_range(node)[1] + 1
		print(string.format("Solutions list location row: %d", row))

		vim.api.nvim_feedkeys(row .. 'Gvi{"ap', "n", nil)
	end
end
