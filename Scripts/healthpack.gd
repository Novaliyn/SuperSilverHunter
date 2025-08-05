extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Character and not body.lives ==5:
		body.lives += 1
		self.queue_free()
		print(body.lives)
	if body.lives == 5:
			print("You have the Max Ammount of lives!")
