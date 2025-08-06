extends Area2D
@export var value : int = 1

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		Global.score += value
		self.queue_free()
		Signaler.UpdateScore.emit()
