package character.sprite;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Sprite extends FlxSprite
{
	private var chr:Character;

	override public function new(c:Character)
	{
		chr = c;

		super(chr.position.x, chr.position.y);

		switch chr.fighter
		{
			case 1:
				makeGraphic(chr.width, chr.height, FlxColor.BLUE);
			case 2:
				makeGraphic(chr.width, chr.height, FlxColor.RED);
		}
		updateHitbox();
	}

	override function update(elapsed:Float)
	{
		x = chr.position.x;
		y = chr.position.y;
		super.update(elapsed);
	}
}
