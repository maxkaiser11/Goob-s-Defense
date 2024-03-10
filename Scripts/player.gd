extends CharacterBody2D

signal took_damage

var speed = 300

var rocket_scence = preload("res://Scenes/rocket.tscn")

@onready var rocket_container =  $RocketContainer #get_node("RocketContainer")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta: float) -> void:
	move_player()
	clamping_player()
	
# Moving the player
func move_player():
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	
	move_and_slide()

# clamping player to not leave the screen
func clamping_player():
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0, 0), screen_size)

func shoot():
	var rocket_instance = rocket_scence.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 75

func take_damage():
	emit_signal("took_damage")

func die():
	queue_free()
