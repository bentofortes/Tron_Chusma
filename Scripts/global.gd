extends Node


const min_players = 2
func players_to_size(n):
	if n <= 2:
		return 3
	elif n <= 4:
		return 4
	elif n <= 6:
		return 5
	else:
		return 6

const colors = {
	"white": 0,
	"black": 1,
	"red": 2,
	"l_green": 3,
	"lilac": 4,
	"orange": 5,
	"l_pink": 6,
	"d_green": 7,
	"d_blue": 8,
	"l_blue": 9,
	"yellow": 10,
	"brown": 11,
	"pink": 12,
	"grey": 13,
}

const tile_size = 16
const base_res = Vector2(32, 19)

var screen_res = Vector2()
