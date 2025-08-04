extends CharacterBody2D
class_name Character

var SPEED = 1000.0
var JUMP_VELOCITY = -800.0
var score = 0
var lives = 3

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		

	if Input.is_action_just_pressed("ui_accept") and is_on_floor() or Input.is_action_just_pressed("ui_accept") and is_on_wall():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("KEYA", "KEYD")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
