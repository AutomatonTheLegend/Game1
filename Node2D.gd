extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const Cell=preload("res://Cell.gd")
const Occupant=preload("res://Occupant.gd")
const Background=preload("res://Background.gd")
const viewport_width:int=2048;
const viewport_height:int=1024;
var map:Array=[]
const cell_size:int=8*2*4
const width:int=32
const height:int=16
var camera_position:Vector2=Vector2(0,0)
var camera_size:Vector2=Vector2(viewport_width/cell_size,viewport_height/cell_size)
const WARRIOR1_TEXTURE=preload("res://warrior1.png")
const BACKGROUND1_TEXTURE:Texture=preload("res://background1.png")

func create_map()->void:
	for x in range(width):
		map.append([])
		for y in range(height):
			map[x].append(Cell.new(x,y))
	var cell:Cell=map[8][4]
	cell.occupant=Occupant.new(Occupant.Type.WARRIOR1)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT,SceneTree.STRETCH_ASPECT_KEEP,Vector2(1024, 512))
	#OS.set_window_fullscreen(true)
	#get_viewport().set_size(Vector2(256,128))
	print(OS.get_window_size())
	print(get_viewport().get_size())
	create_map()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func to_map_coords(x:int,y:int)->Vector2:
	while x<0:
		x+=width
	while x>=width:
		x-=width
	while y<0:
		y+=height
	while y>=height:
		y-=height
	return Vector2(x,y)

func _draw():
	for x in range(camera_position.x,camera_position.x+camera_size.x):
		for y in range(camera_position.y,camera_position.y+camera_size.y):
			var texture:Texture
			var coords:Vector2=to_map_coords(x,y)
			var cell:Cell=map[coords.x][coords.y]
			match cell.background.type:
				Background.Type.BACKGROUND1:
					texture=BACKGROUND1_TEXTURE
			var position:Vector2=Vector2((x-camera_position.x)*cell_size,(y-camera_position.y)*cell_size)
			var size:Vector2=Vector2(cell_size,cell_size)
			var destination:Rect2=Rect2(position,size)
			draw_texture_rect(texture,destination,false)
			if cell.occupant!=null:
				match cell.occupant.type:
					Occupant.Type.WARRIOR1:
						texture=WARRIOR1_TEXTURE
				draw_texture_rect(texture,destination,false)




