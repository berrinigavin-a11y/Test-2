extends Control

var names_list: Array[String] = ["Ichigo", "Gaara", "JoJo", "Asta", "Moto", "Aran", "Kafka", "Linguine", "Miyamoto", "Yokoi"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass





func _on_choose_name_text_submitted(new_text: String) -> void:
	GlobalClicks.data.player_name = str(new_text)
	



func _on_random_name_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GlobalClicks.data.player_name = names_list.pick_random()
	else:
		GlobalClicks.player_name = 0
		


func _on_load_game_pressed() -> void:
	
	get_tree().change_scene_to_file("res://game_scene.tscn")


func _on_new_game_pressed() -> void:
	GlobalClicks.new_game()
	get_tree().change_scene_to_file("res://game_scene.tscn")
