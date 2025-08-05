extends Area2D

@export var Active : int = 0
# 1 Means gravity is reversed (in relation to character), 0 is gravity is normal.

func _on_body_entered(body: Node2D) -> void:
	if body is Character and Active == 1 and Global.GravDirection == 1:
		Global.GravDirection = -1
	elif body is Character and Active == 1 and Global.GravDirection == -1:
		Global.GravDirection = 1
	if body is Character and Active == 0:
		Global.GravDirection = 1
