-- Modules

-- Suppose a module file mod.lua looks like this:

--[[
local M = {}

local function sayMyName()
	print("Ralphy")
end

function M.sayHello()
	print("Hello there")
	sayMyName()
end

return M

--]]

-- Another file like this file can use mod.lua's functionality
local mod = require("mod") --> This will run the file mod.lua

-- require is the standard way to include modules

mod.sayHello()

-- mod.sayMyName() --> This will give an error because sayMyName only exists in mod.lua

--require's return values are cached so a file is run at most once, even when require'd many times.

-- loadfile loads a lua file but does not run it yet.

local f = loadfile("mod.lua")

-- Call f() to run it
