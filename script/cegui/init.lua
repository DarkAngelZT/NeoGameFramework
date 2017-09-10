-----------------------------------------
-- global ui table defination
-----------------------------------------
g_ui_table={}
g_ui_table.switchto = function(arg)
	if g_ui_table[arg]~=nil then
		CEGUI.System:getSingleton():getDefaultGUIContext():setRootWindow(g_ui_table[arg])
		g_ui_table[arg]:activate()
		g_ui_table.current=g_ui_table[arg]
	end
end
-----------------------------------------
-- Script Entry Point
-----------------------------------------
local guiSystem = CEGUI.System:getSingleton()
local schemeMgr = CEGUI.SchemeManager:getSingleton()

-- load our demo8 scheme
schemeMgr:createFromFile("GlossySerpent.scheme");
-- set default mouse cursor
guiSystem:getDefaultGUIContext():getMouseCursor():setDefaultImage("GlossySerpentCursors/MouseArrow")
-- set the Tooltip type
guiSystem:getDefaultGUIContext():setDefaultTooltipType("GlossySerpent/Tooltip")
--实现OOP
dofile(DIR_SCRIPT.."utilities/class.lua")
--初始化全局函数
dofile(DIR_SCRIPT.."utilities/global_functions.lua")
dofile(DIR_SCRIPT.."game/core.lua")
--初始化所有ui
dofile(DIR_SCRIPT_CEGUI.."Menu_Main.lua")
dofile(DIR_SCRIPT_CEGUI.."Menu_Option.lua")
dofile(DIR_SCRIPT_CEGUI.."MapEditor.lua")
dofile(DIR_SCRIPT_CEGUI.."LoadingScreen.lua")
-- dofile(DIR_SCRIPT_CEGUI.."TankEditor.lua")

-- set the layout as the root
g_ui_table.switchto("main")