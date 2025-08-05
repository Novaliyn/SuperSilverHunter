extends Area2D
@export var damage : int = 1

func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		Global.lives -= damage
		print(Global.lives)
		if Global.lives <= 0:
			print("you have failed. the mothership lives")
			Global.GravDirection = 1
			get_tree().reload_current_scene()
