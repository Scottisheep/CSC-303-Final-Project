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

	override public function new(character:Character, boxNumber:Int)
	{
		box = boxNumber;
		chr = character;
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
			switch chr.action
			{
				case FrontAttack:
					Timer.delay(function waitForStartup()
					{
						switch box
						{
							case 1:
								offsetFromChr = FlxPoint.weak(110, 90);
								setSize(35, 25);
							case 2:
								offsetFromChr = FlxPoint.weak(145, 95);
								setSize(35, 25);
							case 3:
								offsetFromChr = FlxPoint.weak(180, 90);
								setSize(30, 25);
						}
						Timer.delay(function activeFrame23()
						{
							switch box
							{
								case 1:
									offsetFromChr = FlxPoint.weak(110, 90);
									setSize(35, 25);
								case 2:
									offsetFromChr = FlxPoint.weak(145, 95);
									setSize(35, 25);
								case 3:
									offsetFromChr = FlxPoint.weak(180, 90);
									setSize(35, 25);
							}

							Timer.delay(function activeFrame4()
							{
								switch box
								{
									case 1:
										offsetFromChr = FlxPoint.weak(110, 90);
										setSize(35, 25);
									case 2:
										offsetFromChr = FlxPoint.weak(145, 95);
										setSize(35, 25);
									case 3:
										offsetFromChr = FlxPoint.weak(180, 90);
										setSize(30, 25);
								}
								Timer.delay(function recovery()
								{
									// hitbox deactivation
									offsetFromChr = FlxPoint.weak(0, 0);
									setSize(0, 0);
								}, 67);
							}, 67);
						}, 133);
					}, 266);
				case NeutralAttack:
					Timer.delay(function waitForStartup()
					{
						switch box
						{
							case 1:
								offsetFromChr = FlxPoint.weak(80, 60);
								setSize(25, 25);
							case 2:
								offsetFromChr = FlxPoint.weak(100, 35);
								setSize(25, 25);
							case 3:
								offsetFromChr = FlxPoint.weak(120, 15);
								setSize(25, 25);
						}
						Timer.delay(function activeFrame23()
						{
							switch box
							{
								case 1:
									offsetFromChr = FlxPoint.weak(70, 80);
									setSize(30, 25);
								case 2:
									offsetFromChr = FlxPoint.weak(100, 85);
									setSize(30, 25);
								case 3:
									offsetFromChr = FlxPoint.weak(130, 80);
									setSize(30, 25);
							}

							Timer.delay(function activeFrame4()
							{
								switch box
								{
									case 1:
										offsetFromChr = FlxPoint.weak(70, 105);
										setSize(30, 25);
									case 2:
										offsetFromChr = FlxPoint.weak(100, 110);
										setSize(30, 25);
									case 3:
										offsetFromChr = FlxPoint.weak(130, 115);
										setSize(20, 25);
								}
								Timer.delay(function recovery()
								{
									offsetFromChr = FlxPoint.weak(0, 0);
									setSize(0, 0);
								}, 66);
							}, 67);
						}, 66);
					}, 200);
				case BackAttack:
					Timer.delay(function waitForStartup()
					{
						switch box
						{
							case 1:
								offsetFromChr = FlxPoint.weak(70, 80);
								setSize(30, 25);
							case 2:
								offsetFromChr = FlxPoint.weak(100, 85);
								setSize(30, 25);
							case 3:
								offsetFromChr = FlxPoint.weak(130, 95);
								setSize(30, 25);
						}
						Timer.delay(function activeFrame23()
						{
							switch box
							{
								case 1:
									offsetFromChr = FlxPoint.weak(70, 50);
									setSize(30, 25);
								case 2:
									offsetFromChr = FlxPoint.weak(100, 45);
									setSize(35, 25);
								case 3:
									offsetFromChr = FlxPoint.weak(135, 50);
									setSize(30, 25);
							}

							Timer.delay(function recovery()
							{
								offsetFromChr = FlxPoint.weak(0, 0);
								setSize(0, 0);
							}, 66);
						}, 67);
					}, 200);
				case Ready:
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
			setPosition((chr.position.x + chr.width) - (offsetFromChr.x + width), chr.position.y + offsetFromChr.y);
		}
		super.update(elapsed);
	}
}
