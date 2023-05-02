package character.sprite;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

class Sprite extends FlxSprite
{
	private static var PLAYER_1_START_X:Float = 30;
	private static var PLAYER_2_START_X:Float = 350;
	private static var PLAYER_START_Y:Float = 280;

	override public function new(Player:Int, Character:Int)
	{
		var startPos:FlxPoint;

		switch Player
		{
			case 1:
				startPos = FlxPoint.weak(PLAYER_1_START_X, PLAYER_START_Y);

			case 2:
				startPos = FlxPoint.weak(PLAYER_2_START_X, PLAYER_START_Y);
		}

		super(startPos.x, startPos.y);

		switch Character
		{
			case 1:
				makeGraphic(100, 250, FlxColor.BLUE);
			case 2:
				makeGraphic(110, 240, FlxColor.RED);
		}
	}
}
