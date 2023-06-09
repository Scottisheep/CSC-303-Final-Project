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

		animation.add("none", [0], 0, true, !chr.player);
		animation.add("forwardWalk", [0, 1, 2, 3, 4], 15, true, !chr.player);
		animation.add("backWalk", [0, 4, 3, 2, 1], 15, true, !chr.player);
		animation.add("neutralAttack", [5, 6, 7, 8, 9, 10, 11, 12], 15, false, !chr.player);
		animation.add("backAttack", [13, 14, 15, 16, 17, 18, 19], 15, false, !chr.player);
		animation.add("frontAttack", [20, 21, 22, 23, 24, 25, 26, 27, 28, 29], 15, false, !chr.player);
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
		if (chr.player)
		{
			x = chr.position.x;
		}
		else
		{
			x = chr.position.x - chr.width * 1.5;
		}
		y = chr.position.y - (0.25 * chr.height);
		super.update(elapsed);
	}
}
