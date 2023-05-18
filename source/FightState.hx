package;

import flixel.util.FlxColor;
import haxe.Timer;
import character.Character;
import flixel.FlxG;
import flixel.FlxState;
import stage.ScreenBound;
import stage.Stage;

class FightState extends FlxState
{
	var player1:Character;
	var player2:Character;
	var stage:Stage;
	var leftScreenBound:ScreenBound;
	var rightScreenBound:ScreenBound;
	var winScreen:WinPopup;

	override function create()
	{
		bgColor = FlxColor.CYAN;
		super.create();
		initCharacters();
		initStage();
	}

	override function update(elapsed:Float)
	{
		doCollision();
		super.update(elapsed);
	}

	private function initCharacters()
	{
		player1 = new Character(true, 1);
		player2 = new Character(false, 2);

		add(player1);
		add(player2);
	}

	private function initStage()
	{
		stage = new Stage(1);
		leftScreenBound = new ScreenBound(true);
		rightScreenBound = new ScreenBound(false);

		add(stage);
		add(leftScreenBound);
		add(rightScreenBound);
	}

	private function doCollision()
	{
		FlxG.collide(player1.pushbox, player2.pushbox);
		FlxG.collide(player1.pushbox, stage);
		FlxG.collide(player2.pushbox, stage);
		FlxG.collide(player1.pushbox, leftScreenBound);
		FlxG.collide(player2.pushbox, rightScreenBound);

		if (FlxG.overlap(player1.hitboxes, player2.hurtboxes))
		{
			winScreen = new WinPopup(true);
			add(winScreen);
			Timer.delay(function resetGame()
			{
				FlxG.resetState();
			}, 3000);
		}
		if (FlxG.overlap(player2.hitboxes, player1.hurtboxes))
		{
			winScreen = new WinPopup(false);
			add(winScreen);
			Timer.delay(function resetGame()
			{
				FlxG.resetState();
			}, 3000);
		}
	}
}
