extends Area2D
@export var HealthPoints: int = 1

func _on_body_entered(body: Node2D) -> void :
	if body.is_in_group("Player") and not Global.lives == 5:
		Global.lives += 1
		Signaler.UpdateScore.emit()
		self.queue_free()
