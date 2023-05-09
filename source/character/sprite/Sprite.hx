package character.sprite;

import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	private var chr:Character;

	override public function new(c:Character)
	{
		chr = c;

		super(chr.position.x, chr.position.y);

		makeGraphic(chr.width, chr.height, 0x00000000);

		updateHitbox();
	}

	override function update(elapsed:Float)
	{
		x = chr.position.x;
		y = chr.position.y;
		super.update(elapsed);
	}
}
