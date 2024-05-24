class_name GridHelper
extends TileMap

@onready var hud: CanvasLayer = $"../HUD"
@export var player: CharacterBody2D
@export var grid_helper: Sprite2D
@export var currentSeed: SeedData

var plantedVetgetables: Dictionary = {}
#var plantedFlowers: Dictionary = {}

func _ready() -> void:
	Global_AutoLoad.seed_changed.connect(_on_seed_changed)

func _physics_process(delta: float) -> void:
	var playerMapCoord = local_to_map(player.position)
	var playerDir = player.direction 
	var playerMapsCoord = playerMapCoord + Vector2i(playerDir) / 32
	grid_helper.position = playerMapCoord * 16
	grid_helper.centered = false
	
func _on_player_plant_seed() -> void:
	var cellLocalCoord = local_to_map(grid_helper.position) #Player position on tilemap
	var tile: TileData = get_cell_tile_data(3, cellLocalCoord)

	if tile == null or currentSeed == null:
		return
	if tile.get_custom_data("Garden"):
		if not plantedVetgetables.has(cellLocalCoord):
			currentSeed.substract_quantity()
			plant_seed(cellLocalCoord)
		elif is_havestable(cellLocalCoord):
			harvest_plant(cellLocalCoord)
	else:
		print("No tile data found for cell")

func harvest_plant(key) -> void:
	var plant: Vetgetable = plantedVetgetables.get(key)
	#var plant_Flower: Flower = plantedFlowers.get(key)
	if plant.has_method("harvest"): #.has_method is check method if you have in scripts
		plant.harvest()
		plantedVetgetables.erase(key) # For Replant on same position

func is_havestable(key) -> bool: # Key = var on dictionary
	var data = plantedVetgetables.get(key)
	#var data_Flower = plantedFlowers.get(key)
	return data.harvest_ready if data != null else false

	
func plant_seed(coord) -> void:
	var plant = currentSeed.vegetableScene.instantiate()
	get_node("Game/Plant/Vetgetables").add_child(plant)
	plantedVetgetables[coord] = plant
	plant.global_position = map_to_local(coord)
	

func _on_seed_changed(new_seed) -> void:
	print("_on_seed_changed function")
	currentSeed = new_seed
