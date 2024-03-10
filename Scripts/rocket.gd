extends Area2D

@export var speed = 500

@onready var visible_notifier = $VisibleNotifier

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta: float) -> void:
	# delta makes the speed framerate independent
	global_position.x += speed * delta

# deletes instance of rocket when it exits the screen
func _on_screen_exited():
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.kill_enemy()
