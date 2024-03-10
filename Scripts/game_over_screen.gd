extends Control


func set_score(new_score):
	$Panel/Score.text = "SCORE: " + str(new_score)

# resets game on button press
func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()
