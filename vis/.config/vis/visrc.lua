-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	vis:command("set theme base16-gruvbox-dark-hard")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command("set relativenumber true")
	vis:command("set tabwidth 4")
	vis:command("set autoindent true")
	vis:command("set showspaces true")
	vis:command("set colorcolumn 80")
	vis:command("set cursorline true")
end)

vis:map(vis.modes.NORMAL," fs", function()
	vis:command("w")
end)
vis:map(vis.modes.NORMAL, " qq", function()
	vis:command("q")
end)
vis:map(vis.modes.NORMAL, " wq", function()
	vis:command("wq")
end)


