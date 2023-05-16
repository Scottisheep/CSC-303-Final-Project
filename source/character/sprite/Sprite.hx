package character.sprite;

import flixel.FlxSprite;

class Sprite extends FlxSprite
{
	private var chr:Character;

	override public function new(c:Character)
	{
		chr = c;

		super(chr.position.x, chr.position.y);

		loadGraphic(AssetPaths.fullAnimations__png, true, 75, 75);
		setGraphicSize(Math.round(chr.width * 2.5), Math.round(chr.height * 1.25));
		updateHitbox();

		animation.add("none", [0], 0, true);
		animation.add("forwardWalk", [0, 1, 2, 3, 4], 10, true);
		animation.add("backWalk", [0, 4, 3, 2, 1], 10, true);
		animation.add("neutralAttack", [5, 6, 7, 8, 9, 10, 11, 12], 10, false);
		animation.add("backAttack", [13, 14, 15, 16, 17, 18, 19], 10, false);
		animation.add("frontAttack", [20, 21, 22, 23, 24, 25, 26, 27, 28, 29], 10, false);
	}

	private function pickAnimation()
	{
		switch chr.action
		{
			case Ready:
				if (chr.direction == Forwards)
				{
					animation.play("forwardWalk");
				}
				else if (chr.direction == Backwards)
				{
					animation.play("backWalk");
				}
				else
				{
					animation.play("none");
				}
			case FrontAttack:
				animation.play("frontAttack");
			case BackAttack:
				animation.play("backAttack");
			case NeutralAttack:
				animation.play("neutralAttack");
				// case FrontSpecial:
				// 	animation.play("none");
				// case BackSpecial:
				// 	animation.play("none");
				// case NeutralSpecial:
				// 	animation.play("none");
		}
	}

	override function update(elapsed:Float)
	{
		pickAnimation();
		x = chr.position.x;
		y = chr.position.y - (0.25 * chr.height);
		super.update(elapsed);
	}
}
