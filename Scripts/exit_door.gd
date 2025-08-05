extends Area2D

@export var Active : int = 1
# 1 Means active, 0 is deactivated.
func _on_body_entered(body: Node2D) -> void:
	if body is Character and Active == 1:
		Global.Level += 1
		Signaler.changeLevel.emit(int(Global.Level))
