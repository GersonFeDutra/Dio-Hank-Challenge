class_name Hero
extends Node

## Infinity Integer: Max int value
const INFI = 9223372036854775807
#endregion

@export var hero_name: String:
	set = set_hero_name
func set_hero_name(value):
	hero_name = value
	%Hero.text = value

## Get starting hank silently. Just a hack for ease this exercise
@onready
var current_hank = get("HANKS")[get("HANKS").keys()[0]]

func _update_hank(value: String) -> void:
	var changed: bool = value != current_hank
	
	if changed:
		current_hank = value
		%Hank.text = value
		%Portrait.change_color(value)
		print(value)

func _update_balance(value: int) -> void:
	%Balance.text = str(value)
	
	if value == 0:
		%Face.set_expression("preocupied")
	elif value <= 0:
		%Face.set_expression("unhappy")
	else:
		%Face.set_expression("normal")

func _ready() -> void:
	%Hank.text = str(current_hank)

# @Virtual
func atualizar(_vitorias: int, _derrotas: int) -> void:
	pass

var wins: float:
	set = set_wins
func set_wins(value: float) -> void:
	wins = value
	atualizar(int(wins), int(losses))

var losses: float:
	set = set_losses
func set_losses(value: float) -> void:
	losses = value
	atualizar(int(wins), int(losses))
