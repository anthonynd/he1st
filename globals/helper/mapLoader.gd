extends Node

var maps = {}

func _init():
	var mapListFile = File.new()
	mapListFile.open("res://levels/mapList.json", File.READ)
	maps = parse_json(mapListFile.get_as_text())
	mapListFile.close()
	
func printMaps():
	print(maps)
	
func getMapList() -> Array:
	return maps.keys()
	
func getMap(mapName: String) -> Dictionary:
	return maps[mapName]