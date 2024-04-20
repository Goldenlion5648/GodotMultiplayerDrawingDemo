extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func disable_buttons():
	$background/host_button.disabled = true
	$background/join_button.disabled = true

func _on_host_button_pressed() -> void:
	GameController.host_game($background/player_name_line_edit.text)
	disable_buttons()

func _on_join_button_pressed() -> void:
	GameController.add_player_to_existing_game($background/ip_line_edit.text,
										$background/player_name_line_edit.text)
	disable_buttons()


func _on_start_button_pressed() -> void:
	GameController.load_main_game.rpc()
