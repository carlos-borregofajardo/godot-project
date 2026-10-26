extends Camera2D
@onready var game_manager: Node = %GameManager

@export var velocidad: float = 200.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.max_fps = 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += velocidad * delta * (1.0 + game_manager.score * 0.15)
	position.y = $"../../Escenario/Player".position.y
