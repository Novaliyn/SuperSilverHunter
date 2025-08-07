extends Node


@onready var hud: Control = $HUD
@onready var gamelevel: Node2D = $Gamelevel
@onready var lives: Label = $HUD/CanvasLayer/Lives
@onready var silver: Label = $HUD/CanvasLayer/Silver
var levelInstance : Node2D


func _ready():
	loadNewLevel(Global.Level)
	Signaler.connect("changeLevel", loadNewLevel)
	Signaler.connect("UpdateScore", updateScore)
	Signaler.connect("GameEnd", endGame)


func unloadLevel():
	if (is_instance_valid(levelInstance)):
		levelInstance.queue_free()
	levelInstance = null
   
func loadNewLevel(levelnumber):
	Global.Level = levelnumber
	unloadLevel()
	Global.GravDirection = 1
	var levelPath : String
	if levelnumber is int:
		levelPath = "res://Levels/Level%s.tscn" % str(levelnumber)
		var levelResource : PackedScene = load(levelPath)
		if levelResource:
			levelInstance = levelResource.instantiate()
			gamelevel.call_deferred("add_child", levelInstance)

func updateScore():
	if Global.lives == 5:
		lives.text = str(str(Global.lives)+' Lives (MAX)')
	else:
		lives.text = str(str(Global.lives)+' Lives')
	silver.text = str(str(Global.score)+' Silver')

func endGame():
	loadNewLevel(0)
