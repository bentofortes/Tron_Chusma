extends KinematicBody2D
class_name Player


onready var collision_shape = $CollisionShape2D
onready var sprite = $Sprite


var internal_id
var color = Global.colors.white
var score = 0
var is_player = false


var input :Vector2 = Vector2()
var last_input :Vector2 = Vector2()

var movement :Vector2 = Vector2()
var last_movement :Vector2 = Vector2()

const speed = 2


signal occupy(tilev, color)
signal hit(tilev, player_color)


func _ready():
	if (name == "Player"):
		is_player = true

	set_physics_process(false)


func init_movement(direction):
	sprite.visible = true
	collision_shape.disabled = false
	
	input = direction
	last_input = direction
	movement = direction
	last_movement = direction
	set_physics_process(true)


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
	
#	if (
#		(abs(aux1 - int(aux1)) < 0.00001) and
#		(abs(aux2 - int(aux2)) < 0.00001)
#	):
	if (
		aux1 == int(aux1) and
		aux2 == int(aux2)
	):
		global_position.x = int(global_position.x)
		global_position.y = int(global_position.y)
		
		emit_signal("occupy", global_position/Global.tile_size, color)
		movement = input
		
		_check_collision()


func _check_collision():
	if test_move(global_transform, movement):
		var col :KinematicCollision2D = move_and_collide(movement)
		var wall_pos = _get_tile_position() + movement 
		
		if col:
			_die(wall_pos)


func _move():
	global_position += movement * speed


func _physics_process(delta):
	_get_input()
	_input_to_movement()
	_move()


func _die(wall_pos):
	emit_signal("hit", wall_pos, color)
	collision_shape.disabled = true 
	sprite.visible = false
#	queue_free()


func _get_tile_position():
	return global_position/Global.tile_size

