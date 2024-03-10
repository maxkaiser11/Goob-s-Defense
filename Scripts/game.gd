extends Node2D

var player_lives = 3

@onready var player = $Player

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.kill_enemy()


func _on_player_took_damage() -> void:
	player_lives -= 1
	if player_lives == 0:
		print("Game Over")
		player.die()
	else:
		print(player_lives)
