extends Node2D


#onready var parent = preload("res://Scenes/Parent.tscn")
onready var parent :Level = $Parent


func _ready():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client("localhost", 5000)
	get_tree().set_network_peer(peer)
#	parent.start_level()
	pass 


##	TODO
##
##	- player ready to start game
##		- requires x percent to actually start
##

#func _start_game():
#	var loaded_level = parent.instance()
#	add_child(loaded_level)

