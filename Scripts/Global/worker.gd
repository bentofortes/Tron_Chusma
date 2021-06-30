extends Node


func get_player_by_color(players, color):
	var result = null
	for i in players:
		if (i.color == color):
			result = i
			
	return result


func players_to_size(n):
	if n <= 4:
		return 4
	elif n <= 6:
		return 5
	else:
		return 6

func custom_copy(a):
	var result = []
	for i in a:
		result.append(i.duplicate())
		
	return result
	
	
	
