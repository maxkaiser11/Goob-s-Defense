extends Area2D

signal died

@export var speed = 200

func _physics_process(delta: float) -> void:
	move_enemy(delta)
	
func move_enemy(delta: float):
	global_position.x += -speed * delta

func kill_enemy():
	queue_free()
	emit_signal("died")


func _on_body_entered(body: Node2D) -> void:
	body.take_damage()
	kill_enemy()
