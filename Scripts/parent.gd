extends Node2D


onready var map :TileMap = $Map
onready var camera :Camera2D = $Camera
onready var player_parent :Node2D = $PlayerParent


func _ready():
	var players = player_parent.get_children()
	if (len(players) != 0):
		for i in range(len(players)):
			players[i].internal_id = i
			players[i].color = i + 1
			players[i].connect("occupy", self, "_paint_trail")
			players[i].set_physics_process(true)
			players[i].init_movement(Vector2.RIGHT)
	
	_load()
	
	
func _load():
	var a = 2
	map.fill(a)
	camera.zoom = Vector2(a/2.0, a/2.0)


func _paint_trail(tile, color):
	map.set_cellv(tile, color)


