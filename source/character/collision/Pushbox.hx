package character.collision;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Pushbox extends FlxSprite
{
	private var chr:Character;

	override public function new(c:Character)
	{
		chr = c;
		super(chr.position.x, chr.position.y);
		drag.y = 100;
		setSize(chr.width, chr.height);
		makeGraphic(chr.width, chr.height, FlxColor.YELLOW);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
