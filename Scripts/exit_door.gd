extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		Global.Level += 1
		Signaler.changeLevel.emit(int(Global.Level))
