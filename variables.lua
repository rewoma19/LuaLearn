-- Single line comment

--[[
This is
a
multi-line comment
]]

age = 20 -- note that in lua, all numbers are doubles

goat = "messi" -- immutable string

movie = "spiderman"

-- As you can see above, both single and double quotes work for strings

t = nil -- undefined value

while age < 25 do
	age = age + 1
end

-- note that there are no compound or shorthand operators (++ or +=) like in some other programming languages

if age > 25 then
	print("unc status")
elseif goat ~= "ronaldo" then
	io.write("not the real goat\n")
else
	globalVariable = 5

	local line = io.read()

	print("Winter is coming, " .. line)
end

-- local keyword before variable name to make it local instead of global (which is the default)

-- ~= is the NOT equal to comparison operator

-- == is the EQUAL TO comparison operator

-- We concatenate strings using ..

nextGoat = unknownVar -- value of nextGoat variable will be nil (undefined)

isBetter = false

if not isBetter then
	print("twas false")
end

-- Falsy values are nil and false boolean

-- 0 and empty string ("") are truthy values

answer = isBetter and "yes" or "no"

-- "or" and "and" operators are short-circuited

kSum = 0

for i = 1, 100 do
	kSum = kSum + i
end

fSum = 0

for j = 100, 1, -1 do
	fSum = fSum + j
end

repeat
	print("The way of the future")
	age = age - 1
until age == 0
