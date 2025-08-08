extends CharacterBody2D

var SPEED = 600.0
var JUMP_VELOCITY = -500.0
var Jump = false

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	sprite.play("Idle")

func _physics_process(delta: float) -> void :
	if not is_on_floor() and not is_on_wall() and Input.is_action_just_pressed("Spacebar") and Jump == false:
		velocity.y = JUMP_VELOCITY * Global.GravDirection
		Jump = true

	if not is_on_floor() or not is_on_ceiling() and Global.GravDirection == -1:
		velocity += get_gravity() * delta * Global.GravDirection

	if is_on_floor() and Global.GravDirection == 1 or is_on_ceiling() and Global.GravDirection == -1:
		Jump = false

	if Input.is_action_just_pressed("Spacebar") and is_on_floor() or Input.is_action_just_pressed("Spacebar") and is_on_wall():
		velocity.y = JUMP_VELOCITY * Global.GravDirection

	var direction: = Input.get_axis("KEYA", "KEYD")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x < 0:
		sprite.play("Left")
	elif velocity.x > 0:
		sprite.play("Right")
	else:
		sprite.play("Idle")

	move_and_slide()
