extends Node


var black_png = load("res://Sprites/Black.png")
var red_png = load("res://Sprites/Red.png")
var l_green_png = load("res://Sprites/L_Green.png")
var lilac_png = load("res://Sprites/Lilac.png")
var orange_png = load("res://Sprites/Orange.png")
var l_pink_png = load("res://Sprites/L_Pink.png")
var d_green_png = load("res://Sprites/D_Green.png")
var d_blue_png = load("res://Sprites/D_Blue.png")
var l_blue_png = load("res://Sprites/L_Blue.png")
var yellow_png = load("res://Sprites/Yellow.png")
var brown_png = load("res://Sprites/Brown.png")
var pink_png = load("res://Sprites/Pink.png")
var grey_png = load("res://Sprites/Grey.png")

const min_players = 2

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
const color_name = [
	"white",
	"black",
	"red",
	"l_green",
	"lilac",
	"orange",
	"l_pink",
	"d_green",
	"d_blue",
	"l_blue",
	"yellow",
	"brown",
	"pink",
	"grey",
]

var color_png = [
	black_png,
	red_png,
	l_green_png,
	lilac_png,
	orange_png,
	l_pink_png,
	d_green_png,
	d_blue_png,
	l_blue_png,
	yellow_png,
	brown_png,
	pink_png,
	grey_png,
]

const tile_size = 16
const base_res = Vector2(32, 19)

var screen_res = Vector2()


