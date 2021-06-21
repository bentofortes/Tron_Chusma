extends KinematicBody2D
class_name Player


var input = Vector2(1, 0)
var last_input = Vector2(1, 0)
var movement = Vector2(1, 0)
var last_movement = Vector2(1, 0)


signal occupy(tilev)


func _ready():
#	set_physics_process(true)
	pass


func _get_input():
	if (
		!Input.is_action_pressed("w") and
		!Input.is_action_pressed("s") and
		!Input.is_action_pressed("d") and
		!Input.is_action_pressed("a")
	):	return
		
	last_input = input
	input = Vector2()
		
	if Input.is_action_pressed("w"):
		input.y -= 1
	if Input.is_action_pressed("s"):
		input.y += 1
		
	if Input.is_action_pressed("d"):
		input.x += 1
	if Input.is_action_pressed("a"):
		input.x -= 1
		
	input = input.normalized()
	if (input.x != 0) and (input.y != 0):
		input = last_input
	if (input.length_squared() == 0):
		input = last_input
		
		
func _input_to_movement():
	var aux1 = global_position.x/Global.tile_size
	var aux2 = global_position.y/Global.tile_size
	
	if (
		(abs(aux1 - int(aux1)) < 0.00001) and
		(abs(aux2 - int(aux2)) < 0.00001)
	):
		print(global_position/Global.tile_size)
		emit_signal("occupy", global_position/Global.tile_size)
		movement = input
		
		
func _move():
	global_position += movement * 2


func _physics_process(delta):
	_get_input()
	_input_to_movement()
	_move()




