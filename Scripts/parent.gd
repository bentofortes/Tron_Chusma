extends Node2D


onready var map :TileMap = $Map
onready var camera :Camera2D = $Camera
onready var player_parent :Node2D = $PlayerParent

var players
var player_count


func _start_level():
	players = player_parent.get_children()
	player_count = len(players)
	
#	if (len(players) != 0):
#		for i in range(player_count):
#			players[i].internal_id = i
#			players[i].color = i + 1
#			players[i].connect("occupy", self, "_paint_trail")
#			players[i].connect("hit", self, "_handle_score")
#			players[i].set_physics_process(true)
#			players[i].init_movement(Vector2.RIGHT)
	
	_load()
	
	
func _load():
	var aux = Worker.players_to_size(player_count)
	map.fill(aux)
	camera.zoom = Vector2(aux/2.0, aux/2.0)


func _paint_trail(tile, color):
	map.set_cellv(tile, color)


func _handle_score(tilev, player_color):
	var color = map.get_cellv(tilev)
	if color == player_color:
#		TODO
#		_handle_suicide
		return
	
	var player = Worker.get_player_by_color(players, color)
	player.score += 1
	
	

