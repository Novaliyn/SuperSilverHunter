extends Area2D

@export var Active : int = 1
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var Finished = 0
# 1 Means active, 0 is deactivated.
func _ready():
	sprite.play("Start")

func _on_body_entered(body: Node2D):
	if body is Character and Active == 1:
		sprite.play("Use")
		Finished = 1


func _on_animated_sprite_2d_animation_finished() -> void:
	if Finished == 1:
		Global.Level += 1
		Signaler.changeLevel.emit(int(Global.Level))
	else:
		sprite.play("Standbye")
