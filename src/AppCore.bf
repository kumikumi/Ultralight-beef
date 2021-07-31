using System;
using Ultralight.Ultralight;

namespace Ultralight.AppCore
{
	static
	{
		[CLink]
		public static extern void ulEnablePlatformFontLoader();

		[CLink]
		public static extern void ulEnablePlatformFileSystem(ULString base_dir);

		[CLink]
		public static extern void ulEnableDefaultLogger(ULString log_path);
	}
}
