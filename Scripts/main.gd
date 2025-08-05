extends Node











func unloadLevel():
	if (is_instance_valid(levelInstance)):
		levelInstance.queue_free();
	levelInstance = null;
   
 func loadNewLevel(levelnumber):
	unloadLevel();
	var levelPath : String
	if levelnumber is int:
		levelPath = "res://Levels/Level%s.tscn" % str(levelnumber);
		var levelResource : PackedScene = load(levelPath);
		if levelResource:
			levelInstance = levelResource.instantiate();
			Gamelevel.add_child(levelInstance);
