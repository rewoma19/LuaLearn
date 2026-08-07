-- Functions

function fibonacci(n)
	if n < 2 then
		return 1
	end
	return fibonacci(n - 2) + fibonacci(n - 1)
end

function adder(x)
	-- The returned function is created when the adder function is called, and remembers the value of x:
	return function(y)
		return x + y
	end
end

a1 = adder(9)
a2 = adder(36)

print(a1(16))
-- adder(9) -> function (16) -> 9 + 16 -> 25

print(a2(64))
-- adder(36) -> function (64) -> 36 + 64 -> 100

a, b, c = 1, 2, 3, 4
-- 4 will be thrown away (garbage collection)

function bar(a, b, c)
	print(a, b, c)
	return 1, 2, 3, 4, 5, 6
end

x, y = bar("ralphy")
-- The function call directly above will print 'ralphy nil nil'
-- This is because this invocation of the bar game receives only one argument instead of three.

-- x = 1 and y = 2 because numbers 3 to 6 will be discarded due to garbage collection

function f(x)
	return x * x
end
f = function(x)
	return x * x
end

-- The two functions above are the same.

local function g(x)
	return math.sin(x)
end

local g
g = function(x)
	return math.sin(x)
end

-- The two functions above are also the same.

print("hello")
-- Calls that have only one string parameter do not need parentheses
