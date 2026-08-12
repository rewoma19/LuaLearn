local colors = {
	black = 0,
	brown = 1,
	red = 2,
	orange = 3,
	yellow = 4,
	green = 5,
	blue = 6,
	violet = 7,
	grey = 8,
	white = 9,
}

return {
	colors = function()
		local cTab = {}

		for colIndex, colVal in pairs(colors) do
			cTab[colVal + 1] = colIndex
		end

		return cTab
	end,

	color_code = function(color)
		return colors[color]
	end,
}
