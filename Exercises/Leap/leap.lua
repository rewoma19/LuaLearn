local leap_year = function(number)
	local divisibleBy4 = number % 4 == 0
	local divisibleBy100 = number % 100 == 0
	local divisibleBy400 = number % 400 == 0

	local isLeapYear

	if divisibleBy4 then
		isLeapYear = true
	else
		isLeapYear = false
	end

	if divisibleBy100 then
		if divisibleBy400 then
			isLeapYear = true
		else
			isLeapYear = false
		end
	end

	return isLeapYear
end

local check97 = leap_year(1997)
local check00 = leap_year(1900)
local check200 = leap_year(2000)

print(check97) --> false
print(check00) --> false
print(check200) --> true
