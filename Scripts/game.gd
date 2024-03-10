extends Node2D

var player_lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD

# sets score to 0 at start of game
func _ready() -> void:
	hud.set_score_label(score)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.kill_enemy()

func _on_player_took_damage() -> void:
	player_lives -= 1
	if player_lives == 0:
		print("Game Over")
		player.die()
	else:
		print(player_lives)

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

# updating score when enemy is killed
func _on_enemy_died():
	score += 100
	hud.set_score_label(score)
