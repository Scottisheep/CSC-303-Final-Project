package character;

import character.sprite.Sprite;

class Character
{
	public function new(Player:Int, Character:Int)
	{
		var sprite = new Sprite(Player, Character);
	}
}
