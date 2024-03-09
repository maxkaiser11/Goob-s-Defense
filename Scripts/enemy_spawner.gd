extends Node2D

var enemy_scene = preload("res://Scenes/enemy.tscn")

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = Vector2(1350, 300)
	add_child(enemy_instance)
