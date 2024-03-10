extends Node2D

var player_lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI

var game_over_scene = preload("res://Scenes/game_over_screen.tscn")

# sets score to 0 at start of game
func _ready() -> void:
	hud.set_score_label(score)
	hud.set_lives(player_lives)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.queue_free()

func _on_player_took_damage() -> void:
	player_lives -= 1
	hud.set_lives(player_lives)
	if player_lives == 0:
		print("Game Over")
		player.die()
		
		await get_tree().create_timer(0.5).timeout
		
		var gos = game_over_scene.instantiate()
		gos.set_score(score)
		ui.add_child(gos)

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

# updating score when enemy is killed
func _on_enemy_died():
	score += 100
	hud.set_score_label(score)
