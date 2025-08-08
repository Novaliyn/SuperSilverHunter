extends Area2D

@export var Enabled: int = 0



func _on_body_entered(body: Node2D) -> void :
	if body.is_in_group("Player") and Enabled == 1:
		Signaler.GameEnd.emit()
