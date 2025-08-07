extends Node2D

@onready var animation_player: AnimationPlayer = $"Moving platforms/AnimationPlayer"


func _ready() -> void:
	animation_player.play("Forward")
	
