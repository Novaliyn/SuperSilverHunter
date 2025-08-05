extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		var currentscene = get_tree().current_scene
		if currentscene:
			var currentLevel = currentscene.get("levelnumber")
			var nextLevel = currentLevel + 1
			Signaler.changeLevel.emit(int(nextLevel))
