import flixel.FlxSprite;

class WinPopup extends FlxSprite
{
	private static var X_POS:Float = 200;
	private static var Y_POS:Float = 100;

	override public function new(player:Bool)
	{
		if (player)
		{
			super(X_POS, Y_POS, AssetPaths.Player1Win__png);
		}
		else
		{
			super(X_POS, Y_POS, AssetPaths.Player1Win__png);
		}
		setGraphicSize(Math.round(width * 2), Math.round(height * 2));
	}
}
