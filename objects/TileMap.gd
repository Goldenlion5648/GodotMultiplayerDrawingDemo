extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@rpc("any_peer", "call_local", "reliable")
func delete_tile(position_):
	self.set_cell(0, position_, -1)


@rpc("any_peer", "call_local", "reliable")
func place_tile(position_):
	self.set_cell(0, position_, 0, Vector2i(0,0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var global_mouse_position = get_global_mouse_position()
	var pos_clicked = Vector2(local_to_map(to_local(global_mouse_position)))
	if Input.is_action_pressed("delete_tile"):
		delete_tile.rpc(pos_clicked)
	
	if Input.is_action_pressed("place_tile"):
		place_tile.rpc(pos_clicked)
