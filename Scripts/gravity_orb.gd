extends Area2D

@export var Active: int = 0


func _on_body_entered(body: Node2D) -> void :
	if body.is_in_group("Player") and Active == 1 and Global.GravDirection == 1:
		Global.GravDirection = -1
	elif body.is_in_group("Player") and Active == 1 and Global.GravDirection == -1:
		Global.GravDirection = 1
	if body.is_in_group("Player") and Active == 0:
		Global.GravDirection = 1
