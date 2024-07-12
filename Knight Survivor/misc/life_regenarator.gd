extends Node2D

@export var regenaration_amount: int = 10

func _ready():
	$Area2D.body_entered.connect(on_body_entered)

func on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		var player: Player = body
		player.heal(regenaration_amount)
		player.meat_collected.emit(regenaration_amount)
		queue_free()
