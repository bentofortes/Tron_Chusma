extends TileMap


func fill(multiplier):
	var end :Vector2 = Global.base_res * multiplier
	
	for i in range(end.x):
		for i2 in range(end.y):
			set_cellv(Vector2(i, i2), Global.tiles.white)
