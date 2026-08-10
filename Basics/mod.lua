local M = {}

local function sayMyName()
	print("Ralphy")
end

function M.sayHello()
	print("Hello there")
	sayMyName()
end

return M
