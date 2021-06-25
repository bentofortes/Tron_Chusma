extends Node


func get_player_by_color(players, color):
	for i in players:
		if (i.color == color):
			return i


func players_to_size(n):
	if n <= 4:
		return 4
	elif n <= 6:
		return 5
	else:
		return 6
