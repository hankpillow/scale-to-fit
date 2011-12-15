package
{	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import redneck.display.resize.*;

	[SWF(width='800', height='600', frameRate='60')]

	public class ScaleToFitTest extends Sprite
	{
		public function ScaleToFitTest()
		{
			super();

			var b : Sprite = addChild( getPlaceHolder(150,40,0x00ff,0.5,0,0) ) as Sprite;
			var a : Sprite = addChild( getPlaceHolder(512,288,0xff00,0.3,0,0.1) ) as Sprite;
			a.mouseEnabled = a.mouseChildren = false;

			b.addEventListener(MouseEvent.CLICK,function(...rest):void{
				trace("ScaleToFitTest::ScaleToFitTest()");
				resize(a).toFitIn(b).round();
			})

			//using the lower value.
			//resize(a).toFitIn(b,true);

			//resize(a,{width:160,height:90}).multipleOf(16).toFitIn(b);

			//var r:* = resize(a).simulate().multipleOf(16).toFitIn(b).bounds;
			//a.width = r.width
			//a.height = r.height
		}
		public function getPlaceHolder( p_width:Number, p_height:Number, p_fillColor: int = 0xffffff, p_fillAlpha: Number = 0, p_lineColor:int = 0xff0000, p_lineAlpha:Number = 1 ) : Sprite
		{
			const place_holder : Sprite = new Sprite();
				place_holder.graphics.beginFill( p_fillColor,p_fillAlpha );
				place_holder.graphics.drawRect( 0,0,p_width, p_height );
				place_holder.graphics.endFill();
				if (p_lineAlpha>0){
					place_holder.graphics.lineStyle( 1, p_lineColor, p_lineAlpha );
					place_holder.graphics.lineTo( p_width, p_height );
					place_holder.graphics.moveTo( p_width, 0 );
					place_holder.graphics.lineTo( 0, p_height );
					place_holder.graphics.endFill();
					place_holder.graphics.lineStyle( 1, p_lineColor, p_lineAlpha );
					place_holder.graphics.drawRect( 0,0,p_width, p_height );
					place_holder.graphics.endFill();
				}			
			return place_holder;
		}
	}
}