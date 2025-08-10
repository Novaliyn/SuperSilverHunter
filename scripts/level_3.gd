extends Node2D

@onready var animation_player: AnimationPlayer = $"Moving platforms/AnimationPlayer"


func _ready():
	animation_player.play("Forward")
