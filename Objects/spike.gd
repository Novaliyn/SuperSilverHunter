extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Character":
		body.lives -= 1
		print(body.lives)
