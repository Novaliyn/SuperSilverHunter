extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		var currentlevel = get_tree().current_scene.scene_file_path
		var nextlevel = currentlevel.to_int() + 1
