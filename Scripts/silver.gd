extends Area2D
@export var value : int = 1

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		body.score += value
		self.queue_free()
		print(body.score)
