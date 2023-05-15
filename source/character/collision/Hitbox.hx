package character.collision;

import flixel.FlxObject;
import flixel.math.FlxPoint;
import haxe.Timer;
import flixel.util.FlxColor;

class Hitbox extends FlxObject
{
	private var box:Int;
	private var chr:Character;

	private var offsetFromChr:FlxPoint = new FlxPoint(0, 0);

	public var colliding:Bool;

	override public function new(character:Character, boxNumber:Int)
	{
		box = boxNumber;
		chr = character;
		colliding = false;
		super(0, 0);
		setSize(0, 0);

		#if FLX_DEBUG
		debugBoundingBoxColor = FlxColor.RED;
		#end
	}

	public function checkAction()
	{
		if (chr.actionJustStarted)
		{
			// switch action
			// {
			// 	case FrontAttack:
			// 	case NeutralAttack:
			// 	case BackAttack:
			// 	case FrontSpecial:
			// 	case NeutralSpecial:
			// 	case BackSpecial:
			// }
			if (chr.action == DebugAttack)
			{
				colliding = true;
				var phase1Time:Int = 500;
				var phase2Time:Int = 350;
				switch box
				{
					case 1:
						offsetFromChr = FlxPoint.weak(70, 55);
						setSize(25, 25);
						Timer.delay(function phase1()
						{
							offsetFromChr = FlxPoint.weak(70, 65);
							setSize(25, 25);
							Timer.delay(function endAttack()
							{
								setSize(0, 0);
								offsetFromChr = FlxPoint.weak(0, 0);
								colliding = false;
							}, phase2Time);
						}, phase1Time);
					case 2:
						offsetFromChr = FlxPoint.weak(90, 35);
						setSize(35, 35);
						Timer.delay(function phase1()
						{
							offsetFromChr = FlxPoint.weak(85, 65);
							setSize(35, 35);
							Timer.delay(function endAttack()
							{
								setSize(0, 0);
								offsetFromChr = FlxPoint.weak(0, 0);
								colliding = false;
							}, phase2Time);
						}, phase1Time);
					case 3:
						offsetFromChr = FlxPoint.weak(105, 20);
						setSize(45, 45);
						Timer.delay(function phase1()
						{
							offsetFromChr = FlxPoint.weak(105, 75);
							setSize(55, 55);
							Timer.delay(function endAttack()
							{
								setSize(0, 0);
								offsetFromChr = FlxPoint.weak(0, 0);
								colliding = false;
							}, phase2Time);
						}, phase1Time);
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (chr.player)
		{
			setPosition(chr.position.x + offsetFromChr.x, chr.position.y + offsetFromChr.y);
		}
		else
		{
			setPosition(chr.position.x - offsetFromChr.x, chr.position.y - offsetFromChr.y);
		}
		super.update(elapsed);
	}
}
