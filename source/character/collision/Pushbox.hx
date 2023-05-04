package character.collision;

import flixel.FlxSprite;

class Pushbox extends FlxSprite
{
	private var chr:Character;

	override public function new(c:Character)
	{
		chr = c;
		super(chr.position.x, chr.position.y);
		acceleration.y = 150;
		setSize(chr.width, chr.height);
		updateHitbox();
		makeGraphic(Math.round(chr.sprite.width), Math.round(chr.sprite.height), 0x52FBFF00);
	}

	override function update(elapsed:Float)
	{
		acceleration.y = chr.gravMod;
		super.update(elapsed);
	}
}
