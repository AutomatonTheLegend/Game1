extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const Occupant=preload("res://Occupant.gd")
const Background=preload("res://Background.gd")
var occupant:Occupant
var background:Background
var x:int
var y:int

func _init(x:int,y:int):
	self.x=x
	self.y=y
	background=Background.new(Background.Type.BACKGROUND1)
	#print("cell:",x,y)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
