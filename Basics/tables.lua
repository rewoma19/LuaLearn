-- Tables

-- Tables are Lua's only compound data structure; they are ASSOCIATIVE arrays.

-- They are hash-lookup dicts that can also be used as lists

-- Tables as dictionaries / maps:

local t = {
	key1 = "value1",
	key2 = false,
}

print(t.key1)
t.newKey = {}
t.key2 = nil

-- values are accessed using dot notation just like in JavaScript

-- setting the key2 property to nil removes it from the table

local u = {
	["@!#"] = "qbert",
	[{}] = 1729,
	[6.28] = "tau",
}

print(u[6.28])

-- Values can also be accessed using bracket notation

local a = u["@!#"] --> 'qbert'
local b = u[{}]

-- NOTE that string and numbers are more PORTABLE keys.

-- b = u[{}] --> nil becausse the key used in this line is not the same object as the one used to store the original value.

function h(x)
	print(x.key1)
end

h({ key1 = "Sonmi~451" })

-- Table iteration
for key, val in pairs(u) do
	print(key, val)
end

--_G is a special table of all globals.

print(_G["_G"] == _G) --> true

-- Tables as lists / arrays

local v = {
	"value1",
	"value2",
	1.21,
	"gigawatts",
}

for i = 1, #v do
	print(v[i])
end

-- #v --> the size of the list v

-- NOTE that a 'list' is not a real type. v is a table with consecutive integer keys, treated as a list.

-- Metatables and metamethods

-- A table can have a metatable that gives the table operator-overloadish behavior. Metatables also support js-prototypey behavior.

local f1 = {
	a = 1,
	b = 2,
}

local f2 = {
	a = 2,
	b = 3,
}

-- In this case, let's assume that f1 and f2 represent the fraction a/b

local metafrac = {}

function metafrac._add(f1, f2)
	sum = {}
	sum.b = f1.b * f2.b
	sum.a = f1.a * f2.b + f2.a * f1.b
	return sum
end

setmetatable(f1, metafrac)
setmetatable(f2, metafrac)

local s = f1 + f2 --> This will call __add(f1, f2) on f1's metatable

-- metatables f1 and f2 have no keys, unlike prototypes in JavaScript. They must be retrieved as in getmetatable(f1). The metatable is a normal table with keys that Lua knows about, like __add.

local defFavs = {
	animal = "gru",
	food = "donuts",
}

local myFavs = {
	food = "pizza",
}

setmetatable(myFavs, { __index = defFavs })

local eatenBy = myFavs.animal

-- __index on a metatable overloads dot lookups

-- Values of __index, add, -- are called METAMETHODS.

--[[

__add(a, b)            
for a + b


__sub(a,b)
for a - b


__mul(a, b)
for a * b


__div(a, b)                for a / b


__mod(a, b)
for a % b


-- __pow(a, b)              for a ^ b


__unm(a)                     for -a


__concat(a, b)
for a .. b

__len(a)                     for #a

__eq(a, b)
for a == b

__lt(a, b)
for a < b

__le(a, b)
for a <= b

__index(a, b)  <fn or a table>  
for a.b


__newindex(a, b, c)       for a.b = c


__call(a, ...)
for a(...)

--]]

-- Class-like tables and inheritance

-- Classes are not built in, but there are different ways to make them using tables and metatables.

local Dog = {}

function Dog:new()
	local newObj = {
		sound = "woof",
	}
	self.__index = self
	return setmetatable(newObj, self)
end

function Dog:makeSound()
	print("I say " .. self.sound)
end

local mrDog = Dog:new()
mrDog:makeSound()

-- 1. Dog acts like a class; it's really a table.
-- 2. function tablename:fn(...) is the same as
--    function tablename.fn(self, ...)
--    The : just adds a first arg called self.
--    Read 7 & 8 below for how self gets its value.
-- 3. newObj will be an instance of class Dog.
-- 4. self = the class being instantiated. Often
--    self = Dog, but inheritance can change it.
--    newObj gets self's functions when we set both
--    newObj's metatable and self's __index to self.
-- 5. Reminder: setmetatable returns its first arg.
-- 6. The : works as in 2, but this time we expect
--    self to be an instance instead of a class.
-- 7. Same as Dog.new(Dog), so self = Dog in new().
-- 8. Same as mrDog.makeSound(mrDog); self = mrDog.

--  Inheritance example:

local LoudDog = Dog:new()

function LoudDog:makeSound()
	s = self.sound .. " "
	print(s .. s .. s)
end

seymour = LoudDog:new()
seymour:makeSound() --> 'woof woof woof'

-- 1. LoudDog gets Dog's methods and variables.
-- 2. self has a 'sound' key from new(), see 3.
-- 3. Same as LoudDog.new(LoudDog), and converted to
--    Dog.new(LoudDog) as LoudDog has no 'new' key,
--    but does have __index = Dog on its metatable.
--    Result: seymour's metatable is LoudDog, and
--    LoudDog.__index = LoudDog. So seymour.key will
--    = seymour.key, LoudDog.key, Dog.key, whichever
--    table is the first with the given key.
-- 4. The 'makeSound' key is found in LoudDog; this
--    is the same as LoudDog.makeSound(seymour).

-- If needed, a subclass's new() is like the base's:
function LoudDog:new()
	local newObj = {}
	-- set up newObj
	self.__index = self
	return setmetatable(newObj, self)
end
