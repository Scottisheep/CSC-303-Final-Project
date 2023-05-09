package character.collision;

import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Pushbox extends FlxSprite
{
	private var chr:Character;

	override public function new(c:Character)
	{
		chr = c;
		super(chr.position.x, chr.position.y);
		maxVelocity = FlxPoint.weak(chr.speedCap, chr.gravMod);
		acceleration.y = chr.gravMod;
		drag.x = chr.moveAccel;
		makeGraphic(chr.width, chr.height, 0x2AFFFB00);
		setSize(chr.width, chr.height);
	}

	private function doMovement()
	{
		switch chr.direction
		{
			case Forwards:
				maxVelocity = FlxPoint.weak(chr.speedCap, chr.gravMod);
				if (chr.player)
				{
					acceleration.x = chr.moveAccel;
				}
				else
				{
					acceleration.x = -chr.moveAccel;
				}
			case Backwards:
				maxVelocity = FlxPoint.weak(chr.speedCap * chr.backwardsSpeedModifier, chr.gravMod);
				if (chr.player)
				{
					acceleration.x = -chr.moveAccel * chr.backwardsSpeedModifier;
				}
				else
				{
					acceleration.x = chr.moveAccel * chr.backwardsSpeedModifier;
				}
			case Stationary:
				acceleration.x = 0;
		}
	}

	override function update(elapsed:Float)
	{
		doMovement();
		super.update(elapsed);
	}
}
