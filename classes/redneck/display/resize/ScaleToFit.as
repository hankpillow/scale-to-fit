/**
*	@author: igor almeida
*	@version: 1.2;
*/
package redneck.display.resize
{	
	import flash.display.*;
	import flash.geom.*;

	public class ScaleToFit
	{
		private var to_resize : Object;
		private var original : Rectangle;
		private var simulating : Boolean;
		private var multiple : uint = 1;

		private var _bounds : Rectangle;
		public function get bounds():Rectangle{return _bounds;}
		/**
		* Resize and object keeping its proportions.
		* 
		* @see toFitIn
		* 
		* @param p_to_resize		Object	Object to be resized
		* @param original_bounds	Object	If for some reason you are afraid of losing the proportion or even if your object has already changed its proportion, you can give an extra parameter with the original width and height.
		* 
		* @return ScaleToFit
		*/
		public function ScaleToFit( p_to_resize : Object , original_bounds : Object = null ):void
		{

			if (!p_to_resize || p_to_resize is Stage || !p_to_resize.hasOwnProperty("width") || !p_to_resize.hasOwnProperty("height"))
			{
				throw new Error("Invalid param. It can't be null or Stage.")
				return;
			}

			to_resize = p_to_resize;

			original = new Rectangle(to_resize.x, to_resize.y, to_resize.width, to_resize.height);

			if (original_bounds)
			{
				original.width = original_bounds.width || original.width;
				original.height = original_bounds.height || original.height;
			}
		}
		/**
		* 
		* Will keep your object as it is even after calling <code>toFitIn</code>.
		* To get the desired value and resize by yourself, use the <code>bounds</code> value.
		* 
		* @usage
		* var r = new ScaleToFit( a ).simulate().toFitIn( b ).bounds;
		* Tweener.addTween( a, {width:r.width, height:r.height, time:0.5} );
		* 
		* @see toFitIn
		* @see bounds
		* 
		* @return Resize
		**/
		public function simulate():ScaleToFit
		{
			simulating = true;
			return this
		}
		/**
		* Scale using multiples of <code>value</code>
		* Good for scaling videos
		* 
		* @see http://labs.influxis.com/?p=6
		* 
		* @usage
		* new ScaleToFit(a).multipleOf(16).toFitIn(b);
		* 
		* @return ScaleToFit
		**/
		public function multipleOf(value:int):ScaleToFit
		{
			multiple = value<0?multiple:value;
			//avoiding zeros
			multiple = Math.max(1,multiple);
			return this
		}
		/**
		* Will resize the given object (when this has instance was created) using <code>p_reference</code> as reference.
		* 
		* @param p_reference	Object
		* @param crop			Boolean  if true it will fit using the bigger dimension
		* 
		* @return Resize
		*/
		public function toFitIn( p_reference:Object, crop : Boolean = false ) : ScaleToFit
		{
			if (!p_reference || p_reference is Stage || !p_reference.hasOwnProperty("width") || !p_reference.hasOwnProperty("height"))
			{
				throw new Error("Invalid parameter");
				return;
			}

			var reference : Rectangle = new Rectangle
				reference.width = p_reference.width;
				reference.height = p_reference.height;

			if (p_reference is Stage)
			{
				reference.width = p_reference.stageWidth;
				reference.height = p_reference.stageHeight;
			}

			_bounds = new Rectangle( to_resize.x, to_resize.y );

			if (!crop)
			{
				if ((original.width / reference.width) < (original.height / reference.height))
				{
					_bounds.height = reference.height;
					_bounds.width = original.width * (reference.height / original.height);
				}
				else
				{
					_bounds.width = reference.width;
					_bounds.height = original.height * (reference.width / original.width);
				}
			}
			else
			{
				if ((original.width / reference.width) > (original.height / reference.height))
				{
					_bounds.height = reference.height;
					_bounds.width = original.width * (reference.height / original.height);
				}
				else
				{
					_bounds.width = reference.width;
					_bounds.height = original.height * (reference.width / original.width);
				}
			}

			//round values
			_bounds.width = _bounds.width|0;
			_bounds.height = _bounds.height|0;

			// getting next value multiple of <code>multiple</code>
			if (multiple!=1 && _bounds.width%multiple!=0)
			{
				do{
					_bounds.width++;
					_bounds.height++;
				}
				while( _bounds.width%multiple!=0 )
			}

			if (!simulating)
			{
				to_resize.scaleX = 
				to_resize.scaleY = _bounds.width/original.width;
			}

			return this;
		}
		/**
		* Round width and height
		* 
		* @return ScaleToFit
		*/
		public function round():ScaleToFit
		{
			to_resize.width = to_resize.width|0;
			to_resize.height = to_resize.height|0;
			_bounds = new Rectangle( to_resize.x, to_resize.y,to_resize.width,to_resize.height );
			return this;
		}
	}
}