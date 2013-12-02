package 
{

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.events.SampleDataEvent;
	import flash.utils.ByteArray;
	import flash.events.Event;
	import flash.media.Microphone;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.SampleDataEvent;


	public class sequences extends MovieClip
	{

		private var timer:Timer;

		private var drumArray:Array;
		private var guitarArray:Array;
		private var clapArray:Array;
		private var heyArray:Array;
		private var tamtamArray:Array;
		private var saksArray:Array;

		private var drumsound:Sound = new Sound();
		private var guitarsound:Sound = new Sound();
		private var clapsound:Sound = new Sound();
		private var heysound:Sound = new Sound();
		private var tamtamsound:Sound = new Sound();
		private var sakssound:Sound = new Sound();


		public function sequences()
		{

			// constructor code

			var drum:DrumSwitch;
			var guitar:GuiltarSwitch;
			var clap:ClapSwitch;
			var hey:HeySwitch;
			var tamtam:TamtamSwitch;
			var saks:SaksSwitch;

			drumArray = new Array();
			guitarArray = new Array();
			clapArray = new Array();
			heyArray = new Array();
			tamtamArray = new Array();
			saksArray = new Array();

			var s:Sound = new Sound();


			var reqdrum:URLRequest = new URLRequest("drum.mp3");
			drumsound.load(reqdrum);

			var reqguitar:URLRequest = new URLRequest("guitar.mp3");
			guitarsound.load(reqguitar);

			var reqclap:URLRequest = new URLRequest("clap.mp3");
			clapsound.load(reqclap);

			var reqhey:URLRequest = new URLRequest("hey.mp3");
			heysound.load(reqhey);

			var reqtamtam:URLRequest = new URLRequest("tamtam.mp3");
			tamtamsound.load(reqtamtam);

			var reqsaks:URLRequest = new URLRequest("saks.mp3");
			sakssound.load(reqsaks);


			for (var i:int=0; i < 16; i++)
			{
				drum = new DrumSwitch();
				drum.x = 80 + (i * 30);
				drum.y = 30;

				drum.addEventListener(MouseEvent.CLICK, handledrumClick);

				drumArray.push(drum);

				this.addChild(drum);

				// guitar

				guitar = new GuiltarSwitch();
				guitar.x = 80 + (i * 30);
				guitar.y = 70;

				guitar.addEventListener(MouseEvent.CLICK, handleguitarClick);

				guitarArray.push(guitar);

				this.addChild(guitar);

				// clap
				clap = new ClapSwitch();
				clap.x = 80 + (i * 30);
				clap.y = 110;

				clap.addEventListener(MouseEvent.CLICK, handleclapClick);

				clapArray.push(clap);

				this.addChild(clap);

				//hey
				hey = new HeySwitch();
				hey.x = 80 + (i * 30);
				hey.y = 150;

				hey.addEventListener(MouseEvent.CLICK, handleheyClick);

				heyArray.push(hey);

				this.addChild(hey);

				//tamtam
				tamtam = new TamtamSwitch();
				tamtam.x = 80 + (i * 30);
				tamtam.y = 190;

				tamtam.addEventListener(MouseEvent.CLICK, handletamtamClick);

				tamtamArray.push(tamtam);

				this.addChild(tamtam);

				//tamtam
				saks = new SaksSwitch();
				saks.x = 80 + (i * 30);
				saks.y = 230;

				saks.addEventListener(MouseEvent.CLICK, handlesaksClick);

				saksArray.push(saks);

				this.addChild(saks);


			}

			playButton.addEventListener(MouseEvent.CLICK, handlePlayClick);

			timer = new Timer(1000,16);
			timer.addEventListener(TimerEvent.TIMER, handleTimerStep);

		}

		private function handledrumClick(e:MouseEvent):void
		{
			e.target.alpha = 0.5;

			if (e.target.alpha == 0.5)
			{

				//drumsound.addEventListener(Event.COMPLETE, playSound);


			}

		}

		private function handleguitarClick(e:MouseEvent):void
		{
			e.target.alpha = 0.5;
		}

		private function handleclapClick(e:MouseEvent):void
		{
			e.target.alpha = 0.5;
		}

		private function handleheyClick(e:MouseEvent):void
		{
			e.target.alpha = 0.5;
		}

		private function handletamtamClick(e:MouseEvent):void
		{
			e.target.alpha = 0.5;
		}

		private function handlesaksClick(e:MouseEvent):void
		{
			e.target.alpha = 0.5;
		}

		private function handlePlayClick(e:MouseEvent):void
		{
			trace("playing");
			timer.start();
			var s:Sound = new Sound();

			s.addEventListener(Event.COMPLETE, playSound);

			var req:URLRequest = new URLRequest("BM.mp3");

			s.load(req);
		}


		function playSound(theEvent:Event):void
		{
			var s:Sound = theEvent.target as Sound;
			s.play();
		}


		private function handleTimerStep(e:TimerEvent):void
		{
			trace("GO..." + timer.currentCount);
			//Array[timer.currentCount-1].alpha = 0.5;

			if (drumArray[timer.currentCount - 1].alpha == 0.5)
			{
				trace("drum");
				drumsound.play();
			}

			if (guitarArray[timer.currentCount - 1].alpha == 0.5)
			{
				trace("guitar");
				guitarsound.play();
			}

			if (clapArray[timer.currentCount - 1].alpha == 0.5)
			{
				trace("clap");
				clapsound.play();
			}

			if (heyArray[timer.currentCount - 1].alpha == 0.5)
			{
				trace("hey");
				heysound.play();
			}

			if (tamtamArray[timer.currentCount - 1].alpha == 0.5)
			{
				trace("tamtam");
				tamtamsound.play();
			}

			if (saksArray[timer.currentCount - 1].alpha == 0.5)
			{
				trace("saks");
				sakssound.play();
			}


		}


	}

}