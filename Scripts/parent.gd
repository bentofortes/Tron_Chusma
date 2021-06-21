extends Node2D


onready var map :TileMap = $Map
onready var camera :Camera2D = $Camera
onready var player_parent :Node2D = $PlayerParent


func _ready():
	var players = player_parent.get_children()
	if (len(players) != 0):
		for i in players:
			i.connect("occupy", self, "_paint_trail")
	
	_load()
	
	
func _load():
	var a = 3
	map.fill(a)
	camera.zoom = Vector2(a/2.0, a/2.0)


func _paint_trail(tile):
	map.set_cellv(tile, Global.tiles.black)

