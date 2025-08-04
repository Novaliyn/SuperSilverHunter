extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		body.lives -= 1
		print(body.lives)
		if body.lives == 0:
			print("you have failed. the mothership lives")
			get_tree().reload_current_scene()
