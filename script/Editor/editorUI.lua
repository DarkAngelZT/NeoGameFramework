map_editor={}

map_editor.isOnScene=true
map_editor.edit_mode=NeoEditor.EDITOR_SELECT
--------------------------------------------
-- initialize
--------------------------------------------
function map_editor.Init()
	-- c++ initialize
	NeoEditor:getInstance():Init()
	-- window caption
	NeoGraphics:getInstance():setWindowCaption("Map Editor -- untitiled")
	--reset id generator
	IDGenerator:Reset()
	map_editor.mouse_states:reset()
	map_editor.isOnScene=true
	--map name
	map_editor.map_name="untitiled"
	-- camera
	local graphicWrapper=NeoGraphics:getInstance()
	map_editor.camera=graphicWrapper:AddCameraSceneNode()
	map_editor.camera:setPosition(irr.core.vector3df:new_local(60,0,0))
	map_editor.camera:setTarget(irr.core.vector3df:new_local(0,0,0))
	map_editor.camera:setID(makeId())
	map_editor.camera_base_distance=irr.core.vector3df:new_local(60,0,0):getLength()
	--map info conrainer
	-- default skybox
	map_editor.skyboxTexture=graphicWrapper:LoadTexture(DIR_RESOURCES.."sfx/env/skydome/cloud_skydome.jpg")
	map_editor.skybox=graphicWrapper:AddSkyDomeSceneNode(map_editor.skyboxTexture,16,8,1.0)
	--default ambient colour
	graphicWrapper:SetAmbientLight(irr.video.SColor:new_local(255,255,253,242));
end

--------------------------------------------
-- clean the editor objects
--------------------------------------------
function map_editor.CleanUp()
	--clear object information
	for k,_ in pairs(map_editor.objects) do
		map_editor.objects[k]=nil
	end
	for k,_ in pairs(map_editor.node_object_table) do
		map_editor.node_object_table[k]=nil
	end
	-- clear scene node from c++ side
	NeoEditor:getInstance():CleanUp()
	NeoGraphics:getInstance():UnloadTexture(map_editor.skyboxTexture)
	--restore window caption
	NeoGraphics:getInstance():setWindowCaption(ApplicationSettings.caption)
end

--------------------------------------------
-- Event Handler
--------------------------------------------
function map_editor.Menu_File_callback( args )
	-- body
	local btnName=CEGUI.toWindowEventArgs(args).window:getName()
	if btnName == "New" then
		--create new scene
		map_editor.CleanUp()
		map_editor.Init()
	elseif btnName == "Open" then
		--open file dialog to load map
	elseif btnName == "Quit" then
		map_editor.Quit()
	end
	return false
end

function map_editor.Quit()
	g_ui_table.switchto("main")
	map_editor.CleanUp()
end

function map_editor.Menu_Insert_callback( args )
	local btnName=CEGUI.toWindowEventArgs(args).window:getName()
	if btnName == "static_mesh" then
		--import a static mesh into scene
		map_editor.isOnScene=false
		NeoEditor:getInstance():CreateFileOpenDialog("map_editor.ImportStaticMesh")
	elseif btnName == "oct" then
		map_editor.isOnScene=false
		NeoEditor:getInstance():CreateFileOpenDialog("map_editor.ImportOctreeMesh")
	elseif btnName == "animated_mesh" then
		map_editor.isOnScene=false
		NeoEditor:getInstance():CreateFileOpenDialog("map_editor.ImportAnimatedMesh")
	end
end
--------------------------------------------
-- object handler
--------------------------------------------
map_editor.selected_objects={}
-- function allow multiple selection
function map_editor:UnselectAllObjects()
	for k,_ in ipairs(self.selected_objects) do
		self.selected_objects[k]=nil
	end
end

function map_editor:UnselectObject(obj)
	for k,v in ipairs(self.selected_objects) do
		if self.selected_objects[k] == obj then
			table.remove(self.selected_objects,k)
			break
		end
	end
end

function map_editor:AddSelectedObject( obj )
	for k,v in ipairs(self.selected_objects) do
		if self.selected_objects[k] == obj then
			return
		end
	end
	self.selected_objects[#self.selected_objects+1]=obj
end
--------------------------------------------
-- mouse event handler
--------------------------------------------
map_editor.mouse_states={
	lbutton=false,
	rbutton=false,
	mbutton=false,
	zoom_speed=15,
	onSelectionCursor=false,
	onSelectionCursorIndex=-1,
	reset=function (self)
		self.lbutton=false
		self.rbutton=false
		self.mbutton=false
		self.onSelectionCursor=false
		self.onSelectionCursorIndex=-1
	end
}

function map_editor.ShowCursor(visible,position)
	if visible then
		NeoEditor:getInstance():ShowSelectionCursor(visible, position)
		dist=(map_editor.camera:getPosition()-NeoEditor:getInstance():getSelectionCursorPosition()):getLength()
		scale=dist/map_editor.camera_base_distance
		NeoEditor:getInstance():setSelectionCursorScale(scale)
	else
		NeoEditor:getInstance():ShowSelectionCursor(visible)
		map_editor.mouse_states.onSelectionCursor=false
			map_editor.mouse_states.onSelectionCursorIndex = -1
	end
end

function map_editor.onSelectionCursorMove()
	dist=(map_editor.camera:getPosition()-NeoEditor:getInstance():getSelectionCursorPosition()):getLength()
	scale=dist/map_editor.camera_base_distance
	NeoEditor:getInstance():setSelectionCursorScale(scale)
end

function map_editor.OnMouseButtonDownEvent( args )
	if not map_editor.isOnScene then
		--skip when doing ui operations
		return
	end
	local event=CEGUI.toMouseEventArgs(args)
	if event.button == CEGUI.LeftButton then
		map_editor.OnLButtonDown(event)
	elseif event.button == CEGUI.RightButton then
		map_editor.OnRButtonDown(event)
	elseif event.button == CEGUI.MiddleButton then
		map_editor.OnMButtonDown(event)
	end
end

function map_editor.OnMouseButtonUpEvent( args )
	if not map_editor.isOnScene then
		--skip when doing ui operations
		return
	end
	local event=CEGUI.toMouseEventArgs(args)
	if event.button == CEGUI.LeftButton then
		map_editor.OnLButtonUp(event)
	elseif event.button == CEGUI.RightButton then
		map_editor.OnRButtonUp(event)
	elseif event.button == CEGUI.MiddleButton then
		map_editor.OnMButtonUp(event)
	end
end

function map_editor.OnMouseWheel( args )
	if not map_editor.isOnScene then
		--skip when doing ui operations
		return
	end
	local event=CEGUI.toMouseEventArgs(args)
	local camera=map_editor.camera
	local pos = camera:getPosition()
	local target=camera:getTarget()
	local verizon_vect=target-pos
	local len_sq=verizon_vect:getLengthSQ()
	local speed=map_editor.mouse_states.zoom_speed
	if len_sq < 900 then
		speed=2
	end
	verizon_vect:normalize()
	local delta=verizon_vect*(speed*event.wheelChange)
	local after_vect=target-(pos+delta)
	if after_vect:dotProduct(verizon_vect) >=0 then
		camera:setPosition(pos+delta)
		--scale cursor
		if #map_editor.selected_objects >0 then
			dist=(camera:getPosition()-NeoEditor:getInstance():getSelectionCursorPosition()):getLength()
			scale=dist/map_editor.camera_base_distance
			NeoEditor:getInstance():setSelectionCursorScale(scale)
		end
	end
end

function map_editor.rotateVectAxis(degree,vector,axis)
	--这是一个神奇的公式,可以把向量绕指定轴旋转β度
	--k是指定的轴向量，a是要旋转的向量
	--b是结果
	--b=cosβa+sinβ(k×a)+(k⋅a)(1−cosβ)k
	local cosd=math.cos(math.rad(degree))
	local b=vector*cosd+
		axis:crossProduct(vector)*math.sin(math.rad(degree))+
		axis*axis:dotProduct(vector)*(1-cosd)
	return b
end

function map_editor.OnMouseMove(args)
	if not map_editor.isOnScene then
		--skip when doing ui operations
		return
	end
	local event=CEGUI.toMouseEventArgs(args)
	if map_editor.mouse_states.mbutton then
		local camera=map_editor.camera
		local pos = camera:getPosition()
		local target=camera:getTarget()
		local verizon_vect=pos-target

		local rotation_y=irr.core.vector3df:new_local(0,event.moveDelta.x,0)
		local mat_y=irr.core.matrix4:new_local()
		local axis=verizon_vect:crossProduct(camera:getUpVector())
		axis:normalize()
		mat_y:setRotationAxisRadians(math.rad(event.moveDelta.y),axis)
		mat_y:setRotationDegrees(rotation_y)
		mat_y:rotateVect(verizon_vect)
		
		verizon_vect=map_editor.rotateVectAxis(event.moveDelta.y,verizon_vect, axis)

		pos=target+verizon_vect
		camera:setPosition(pos)
	end

	if map_editor.mouse_states.lbutton then
		if map_editor.edit_mode == NeoEditor.EDITOR_SELECT then
			if map_editor.mouse_states.onSelectionCursor then
				--move object align axis
				local delta = irr.core.vector3df()
				local camera=map_editor.camera
				local cursor=map_editor.mouse_states.onSelectionCursorIndex
				local lookVect=camera:getTarget()-camera:getPosition()
				local xdir = 1
				local zdir = 1
				if lookVect.Z < 0 then
					xdir=-1
				end
				if lookVect.X > 0 then
					zdir=-1
				end
				if cursor == 0 then
					delta.X=event.moveDelta.x*xdir
				elseif cursor == 1 then
					delta.Y = -event.moveDelta.y
				elseif cursor == 2 then
					delta.Z=event.moveDelta.x*zdir
				end
				print(event.moveDelta.x,event.moveDelta.y)
				-- update position
				for _,v in ipairs(map_editor.selected_objects) do
					v:setPosition(v:getPosition()+delta)
				end
				-- synchronize cursor position
				NeoEditor:getInstance():setSelectionCursorPosition(
					NeoEditor:getInstance():getSelectionCursorPosition()+delta)
				--update property panel

			elseif #map_editor.selected_objects >0 then
				--move object according to screen
				local camera=map_editor.camera
				local lookVect=camera:getPosition()-camera:getTarget()
				lookVect:normalize()
				local upaxis = irr.core.vector3df:new_local(camera:getUpVector())
				local axis=lookVect:crossProduct(upaxis)
				axis=axis*event.moveDelta.x
				upaxis=upaxis*event.moveDelta.y*-1
				axis:normalize()
				upaxis:normalize()
				local delta = axis+upaxis
				-- update position
				for _,v in ipairs(map_editor.selected_objects) do
					v:setPosition(v:getPosition()+delta)
				end
				-- synchronize cursor position
				NeoEditor:getInstance():setSelectionCursorPosition(
					NeoEditor:getInstance():getSelectionCursorPosition()+delta)
				--update property panel

			end
		end
	end
end

function map_editor.OnKeyDown( args )
	local event=CEGUI.toKeyEventArgs(args)
end

function map_editor.OnKeyUp( args )
	local event=CEGUI.toKeyEventArgs(args)
end

---------------
-- specific mouse handlers
---------------
function map_editor.OnLButtonDown(event)
	map_editor.mouse_states.lbutton=true
	local editor_wrapper=NeoEditor:getInstance()
	local node=editor_wrapper:getSelectedSceneNode()
	if node and 
		node:getType()~=irr.scene.ESNT_SKY_DOME and
		node:getType()~=irr.scene.ESNT_SKY_BOX  and
		node:getID()~=map_editor.camera:getID() then
		if editor_wrapper:isSelectionCursor(node) then
			map_editor.mouse_states.onSelectionCursor=true
			map_editor.mouse_states.onSelectionCursorIndex =
				editor_wrapper:getSelectedCursorIndex(node)
			return
		end
		map_editor.ShowCursor(true, node:getAbsolutePosition())
		map_editor:AddSelectedObject(node)
		map_editor.mouse_states.onSelectionCursor=false
			map_editor.mouse_states.onSelectionCursorIndex = -1
	else
		map_editor.ShowCursor(false)
	end
end

function map_editor.OnMButtonDown(event)
	map_editor.mouse_states.mbutton=true
end

function map_editor.OnRButtonDown(event)
	map_editor.mouse_states.rbutton=true
end

function map_editor.OnLButtonUp(event)
	map_editor.mouse_states.lbutton=false

	if #map_editor.selected_objects > 0 then
		return
	end

	local editor_wrapper=NeoEditor:getInstance()
	local node=editor_wrapper:getSelectedSceneNode()
	map_editor:UnselectAllObjects()
	if node and 
		node:getType()~=irr.scene.ESNT_SKY_DOME and
		node:getType()~=irr.scene.ESNT_SKY_BOX  and
		node:getID()~=map_editor.camera:getID() then

		if editor_wrapper:isSelectionCursor(node) then
			return
		end
		map_editor.ShowCursor(true, node:getAbsolutePosition())
		map_editor:AddSelectedObject(node)
		map_editor.mouse_states.onSelectionCursor=false
			map_editor.mouse_states.onSelectionCursorIndex = -1
	else
		map_editor.ShowCursor(false)
	end

end

function map_editor.OnMButtonUp(event)
	map_editor.mouse_states.mbutton=false
end

function map_editor.OnRButtonUp(event)
	map_editor.mouse_states.rbutton=false
end