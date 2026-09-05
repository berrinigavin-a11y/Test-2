extends Node2D
@onready var points_label: Label = $VBoxContainer/Points
@onready var auto_clicker: Label = $VBoxContainer/AutoClickerPower
@onready var timer: Timer = $Timer
@onready var player_name: Label = $VBoxContainer/PlayerName
@onready var total_points: Label = $VBoxContainer/TotalPoints

func _ready():
	$Timer.one_shot = false
	$Timer.start()
	player_name.text = str(GlobalClicks.data.player_name, "'s stats")
	
func _on_point_button_pressed() -> void:
	GlobalClicks.data.clicks += GlobalClicks.data.click_power
	GlobalClicks.data.total_clicks += GlobalClicks.data.click_power
 
func _process(_delta: float) -> void:
	points_label.text = str("Cash: ", GlobalClicks.data.clicks)
	auto_clicker.text = str("CPS: ", GlobalClicks.data.auto_clicker_power)
	total_points.text = str("Total Points: ", GlobalClicks.data.total_clicks)
	
func _on_timer_timeout() -> void:
	GlobalClicks.data.clicks += GlobalClicks.data.auto_clicker_power
	GlobalClicks.data.total_clicks += GlobalClicks.data.auto_clicker_power
	$Timer.start(1.0)


func _on_auto_clicker_lvl_1_pressed() -> void:
	if GlobalClicks.data.clicks >= 25:
		GlobalClicks.data.clicks -= 25
		GlobalClicks.data.auto_clicker_power += 1


func _on_auto_clicker_lvl_2_pressed() -> void:
	if GlobalClicks.data.clicks >= 300:
		GlobalClicks.data.clicks -= 300
		GlobalClicks.data.auto_clicker_power += 5


func _on_auto_clicker_lvl_3_pressed() -> void:
	if GlobalClicks.data.clicks >= 1000:
		GlobalClicks.data.clicks -= 1000
		GlobalClicks.data.auto_clicker_power += 12


func _on_auto_clicker_lvl_4_pressed() -> void:
	if GlobalClicks.data.clicks >= 2000:
		GlobalClicks.data.clicks -= 2000
		GlobalClicks.data.auto_clicker_power += 50


func _on_click_power_lvl_1_pressed() -> void:
	if GlobalClicks.data.clicks >= 40:
		GlobalClicks.data.clicks -= 40
		GlobalClicks.data.click_power += 3


func _on_click_power_lvl_2_pressed() -> void:
	if GlobalClicks.data.clicks >= 100:
		GlobalClicks.data.clicks -= 100
		GlobalClicks.data.click_power += 4


func _on_click_power_lvl_3_pressed() -> void:
	if GlobalClicks.data.clicks >= 750:
		GlobalClicks.data.clicks -= 750
		GlobalClicks.data.click_power += 10


func _on_click_power_lvl_4_pressed() -> void:
	if GlobalClicks.data.clicks >= 2000:
		GlobalClicks.data.clicks -= 2000
		GlobalClicks.data.click_power += 20


func _on_click_power_lvl_5_pressed() -> void:
	if GlobalClicks.data.clicks >= 7500:
		GlobalClicks.data.clicks -= 7500
		GlobalClicks.data.click_power += 40


func _on_click_power_lvl_6_pressed() -> void:
	if GlobalClicks.data.clicks >= 15000:
		GlobalClicks.data.clicks -= 15000
		GlobalClicks.data.click_power += 65


func _on_save_and_quit_pressed() -> void:
	GlobalClicks.save_game()
	get_tree().quit()
