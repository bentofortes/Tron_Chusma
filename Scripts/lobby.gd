extends Node2D


onready var parent = preload("res://Scenes/Parent.tscn")


func _ready():
	pass 


func _start_game():
	var loaded_level = parent.instance()
	add_child(loaded_level)

