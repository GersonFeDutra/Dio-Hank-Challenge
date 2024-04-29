## Implementa a lógica do desafio
extends Hero

const HANKS := {
	9: "Iron",
	20: "Bronze",
	50: "Silver",
	80: "Gold",
	90: "Diamond",
	100: "Legendary",
	INFI: "Imortal",
}
var ordered_hanks := HANKS.keys()

func obter_saldo(vitorias: int, derrotas: int) -> int:
	return vitorias - derrotas

func atualizar(vitorias: int, derrotas: int) -> void:
	var novo_saldo = obter_saldo(vitorias, derrotas)
	_update_balance(novo_saldo)  # Avisar à Godot da mudança
	
	for hank in HANKS.keys():
		if vitorias <= hank:
			var novo_nivel: String = HANKS[hank]
			
			print_rich("O herói tem saldo de [b]%s[/b] " % novo_saldo,
				"está no nível de [b]%s[/b]" % niveis[novo_nivel])
			
			_update_hank(novo_nivel)  # Avisar à Godot do novo nível
			break

const niveis := {
	"Iron": "Ferro",
	"Bronze": "Bronze",
	"Silver": "Prata",
	"Gold": "Ouro",
	"Diamond": "Diamante",
	"Legendary": "Legendário",
	"Imortal": "Imortal",
}

func _input(event):
	if event.is_action_pressed("ui_copy"):
		var image = get_viewport().get_texture().get_image() # We get what our player sees
		image.save_jpg("user://screenshot.jpg")
		prints("Image saved to %s/screenshot.jpg" % OS.get_user_data_dir())
		OS.shell_open(OS.get_user_data_dir())
