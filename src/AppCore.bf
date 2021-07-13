using System;
using static ultralight.Ultralight;

namespace ultralight
{
	public static class AppCore
	{
		[CLink]
		public static extern void ulEnablePlatformFontLoader();

		[CLink]
		public static extern void ulEnablePlatformFileSystem(ULString base_dir);

		[CLink]
		public static extern void ulEnableDefaultLogger(ULString log_path);
	}
}
