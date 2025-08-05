extends Node


@onready var hud: Control = $HUD
@onready var gamelevel: Node2D = $Gamelevel
var levelInstance : Node2D


func _ready():
	loadNewLevel(Global.Level)
	Signaler.connect("changeLevel", loadNewLevel)


func unloadLevel():
	if (is_instance_valid(levelInstance)):
		levelInstance.queue_free()
	levelInstance = null
   
func loadNewLevel(levelnumber):
	unloadLevel()
	var levelPath : String
	if levelnumber is int:
		levelPath = "res://Levels/Level%s.tscn" % str(levelnumber)
		var levelResource : PackedScene = load(levelPath)
		if levelResource:
			levelInstance = levelResource.instantiate()
			gamelevel.add_child(levelInstance)
