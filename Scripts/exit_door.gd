extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		var currentlevel = get_tree().current_scene.scene_file_path
		var numnextlevel = currentlevel.to_int() + 1
		var nextlevel = "res://Levels/Level%s.tscn" % str(numnextlevel)
		get_tree().change_scene_to_file(nextlevel)
