extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var animationplayer: AnimationPlayer = $"../Spikes/AnimationPlayer2"


func _ready():
	sprite.play("default")

func _on_body_entered(body: Node2D) -> void:
	sprite.play("broken")
	animationplayer.play("Spike")
