extends Path2D

@onready var pathfollow = $PathFollowEnemy
@onready var enemy = $PathFollowEnemy/Enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pathfollow.set_progress_ratio(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pathfollow.progress_ratio -= 0.25 * delta
	if pathfollow.progress_ratio == 0:
		queue_free()
