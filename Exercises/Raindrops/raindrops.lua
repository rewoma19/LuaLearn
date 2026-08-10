local rain = function(n)
	local result = ""

	local function isDivisibleBy(num)
		local isDivisible = n % num == 0
		return isDivisible
	end

	local function addSoundIfDivisible(divisor, sound)
		if isDivisibleBy(divisor) then
			result = result .. sound
		end
	end

	addSoundIfDivisible(3, "Pling")
	addSoundIfDivisible(5, "Plang")
	addSoundIfDivisible(7, "Plong")

	if result == "" then
		result = tostring(n)
	end

	return result
end

local result1 = rain(28)
local result2 = rain(30)
local result3 = rain(34)

print(result1)
print(result2)
print(result3)
