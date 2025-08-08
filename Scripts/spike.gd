extends Area2D
@export var damage: int = 1

func _on_body_entered(body: Node2D) -> void :
	if body.is_in_group("Player"):
		Global.lives -= damage
		if Global.lives <= 0:
			print("you have failed. the mothership lives")
			Global.GravDirection = 1
			Global.lives = 3
			Global.score = 0
			Signaler.changeLevel.emit(Global.Level)
		Signaler.UpdateScore.emit()
