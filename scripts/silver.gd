extends Area2D
@export var value: int = 1

func _on_body_entered(body: Node2D) -> void :
	if body.is_in_group("Player"):
		Global.score += value
		Signaler.UpdateScore.emit()
		self.queue_free()
