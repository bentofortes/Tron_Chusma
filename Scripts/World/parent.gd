extends Node2D
class_name Level


onready var map :TileMap = $Map
onready var camera :Camera2D = $Camera
onready var player_parent :Node2D = $PlayerParent

var players
var players_copy
var player_count


func start_level():
	players = player_parent.get_children()
	players_copy = Worker.custom_copy(players)
	player_count = len(players)
	
	for i in range(player_count):
		players[i].internal_id = i
		players[i].color = i + 1
		players_copy[i].internal_id = i
		players_copy[i].color = i + 1
		
		if (players[i].is_player):
			players[i].connect("occupy", self, "_paint_trail")
			players[i].connect("hit", self, "_handle_score")
			players[i].init_movement(Vector2.RIGHT)
			
	_load()
	
	
func _load():
	var aux = Worker.players_to_size(player_count)
	map.fill(aux)
	camera.zoom = Vector2(aux/2.0, aux/2.0)


func _paint_trail(tile, color):
	map.set_cellv(tile, color)


func _handle_score(tilev, player_color):
	var color = map.get_cellv(tilev)
#	if color == player_color:
##		TODO
##		_handle_suicide
#		return
	
	var player = Worker.get_player_by_color(players_copy, color)
	print(player)
	if player:
		player.score += 1
		print(player.name, " score increment")
	
	

