using System;
using ultralight.JavaScriptCore;

namespace ultralight
{
	public static class Ultralight
	{
		public typealias ULChar16 = uint16;

		public struct C_Config;
		public typealias ULConfig = C_Config*;

		public struct C_Renderer;
		public typealias ULRenderer = C_Renderer*;

		public struct C_Session;
		public typealias ULSession = C_Session*;

		public struct C_View;
		public typealias ULView = C_View*;

		public struct C_Bitmap;
		public typealias ULBitmap = C_Bitmap*;

		public struct C_String;
		public typealias ULString = C_String*;

		public struct C_Buffer;
		public typealias ULBuffer = C_Buffer*;

		public struct C_KeyEvent;
		public typealias ULKeyEvent = C_KeyEvent*;

		public struct C_MouseEvent;
		public typealias ULMouseEvent = C_MouseEvent*;

		public struct C_ScrollEvent;
		public typealias ULScrollEvent = C_ScrollEvent*;

		public struct C_Surface;
		public typealias ULSurface = C_Surface*;
		public typealias ULBitmapSurface = C_Surface*;

		public enum ULMessageSource : int32
		{
			kMessageSource_XML = 0,
			kMessageSource_JS,
			kMessageSource_Network,
			kMessageSource_ConsoleAPI,
			kMessageSource_Storage,
			kMessageSource_AppCache,
			kMessageSource_Rendering,
			kMessageSource_CSS,
			kMessageSource_Security,
			kMessageSource_ContentBlocker,
			kMessageSource_Other,
		};

		public enum ULMessageLevel : int32
		{
			kMessageLevel_Log = 1,
			kMessageLevel_Warning = 2,
			kMessageLevel_Error = 3,
			kMessageLevel_Debug = 4,
			kMessageLevel_Info = 5,
		}

		public enum ULCursor : int32
		{
			kCursor_Pointer = 0,
			kCursor_Cross,
			kCursor_Hand,
			kCursor_IBeam,
			kCursor_Wait,
			kCursor_Help,
			kCursor_EastResize,
			kCursor_NorthResize,
			kCursor_NorthEastResize,
			kCursor_NorthWestResize,
			kCursor_SouthResize,
			kCursor_SouthEastResize,
			kCursor_SouthWestResize,
			kCursor_WestResize,
			kCursor_NorthSouthResize,
			kCursor_EastWestResize,
			kCursor_NorthEastSouthWestResize,
			kCursor_NorthWestSouthEastResize,
			kCursor_ColumnResize,
			kCursor_RowResize,
			kCursor_MiddlePanning,
			kCursor_EastPanning,
			kCursor_NorthPanning,
			kCursor_NorthEastPanning,
			kCursor_NorthWestPanning,
			kCursor_SouthPanning,
			kCursor_SouthEastPanning,
			kCursor_SouthWestPanning,
			kCursor_WestPanning,
			kCursor_Move,
			kCursor_VerticalText,
			kCursor_Cell,
			kCursor_ContextMenu,
			kCursor_Alias,
			kCursor_Progress,
			kCursor_NoDrop,
			kCursor_Copy,
			kCursor_None,
			kCursor_NotAllowed,
			kCursor_ZoomIn,
			kCursor_ZoomOut,
			kCursor_Grab,
			kCursor_Grabbing,
			kCursor_Custom
		}

		public enum ULBitmapFormat : int32
		{
			///
			/// Alpha channel only, 8-bits per pixel.
			///
			/// Encoding: 8-bits per channel, unsigned normalized.
			///
			/// Color-space: Linear (no gamma), alpha-coverage only.
			///
			kBitmapFormat_A8_UNORM,

			///
			/// Blue Green Red Alpha channels, 32-bits per pixel.
			/// 
			/// Encoding: 8-bits per channel, unsigned normalized.
			///
			/// Color-space: sRGB gamma with premultiplied linear alpha channel.
			///
			kBitmapFormat_BGRA8_UNORM_SRGB
		}

		public enum ULKeyEventType : int32
		{
			///
			/// Key-Down event type. (Does not trigger accelerator commands in WebCore)
			///
			/// @NOTE: You should probably use RawKeyDown instead when a physical key
			///        is pressed. This member is only here for historic compatibility
			///        with WebCore's key event types.
			///
			kKeyEventType_KeyDown,

			///
			/// Key-Up event type. Use this when a physical key is released.
			///
			kKeyEventType_KeyUp,

			///
			/// Raw Key-Down type. Use this when a physical key is pressed.
			///
			/// @NOTE: You should use RawKeyDown for physical key presses since it
			///        allows WebCore to do additional command translation.
			///
			kKeyEventType_RawKeyDown,

			///
			/// Character input event type. Use this when the OS generates text from
			/// a physical key being pressed (eg, WM_CHAR on Windows).
			///
			kKeyEventType_Char,
		}

		[AllowDuplicates]
		public enum ULKeyCode : int32
		{
			// GK_BACK (08) BACKSPACE key
			GK_BACK = 0x08,


			// GK_TAB (09) TAB key
			GK_TAB = 0x09,

			// GK_CLEAR (0C) CLEAR key
			GK_CLEAR = 0x0C,

			// GK_RETURN (0D)
			GK_RETURN = 0x0D,

			// GK_SHIFT (10) SHIFT key
			GK_SHIFT = 0x10,

			// GK_CONTROL (11) CTRL key
			GK_CONTROL = 0x11,

			// GK_MENU (12) ALT key
			GK_MENU = 0x12,

			// GK_PAUSE (13) PAUSE key
			GK_PAUSE = 0x13,

			// GK_CAPITAL (14) CAPS LOCK key
			GK_CAPITAL = 0x14,

			// GK_KANA (15) Input Method Editor (IME) Kana mode
			GK_KANA = 0x15,

			// GK_HANGUEL (15) IME Hanguel mode (maintained for compatibility; use GK_HANGUL)
			// GK_HANGUL (15) IME Hangul mode
			GK_HANGUL = 0x15,

			// GK_JUNJA (17) IME Junja mode
			GK_JUNJA = 0x17,

			// GK_FINAL (18) IME final mode
			GK_FINAL = 0x18,

			// GK_HANJA (19) IME Hanja mode
			GK_HANJA = 0x19,

			// GK_KANJI (19) IME Kanji mode
			GK_KANJI = 0x19,

			// GK_ESCAPE (1B) ESC key
			GK_ESCAPE = 0x1B,

			// GK_CONVERT (1C) IME convert
			GK_CONVERT = 0x1C,

			// GK_NONCONVERT (1D) IME nonconvert
			GK_NONCONVERT = 0x1D,

			// GK_ACCEPT (1E) IME accept
			GK_ACCEPT = 0x1E,

			// GK_MODECHANGE (1F) IME mode change request
			GK_MODECHANGE = 0x1F,

			// GK_SPACE (20) SPACEBAR
			GK_SPACE = 0x20,

			// GK_PRIOR (21) PAGE UP key
			GK_PRIOR = 0x21,

			// GK_NEXT (22) PAGE DOWN key
			GK_NEXT = 0x22,

			// GK_END (23) END key
			GK_END = 0x23,

			// GK_HOME (24) HOME key
			GK_HOME = 0x24,

			// GK_LEFT (25) LEFT ARROW key
			GK_LEFT = 0x25,

			// GK_UP (26) UP ARROW key
			GK_UP = 0x26,

			// GK_RIGHT (27) RIGHT ARROW key
			GK_RIGHT = 0x27,

			// GK_DOWN (28) DOWN ARROW key
			GK_DOWN = 0x28,

			// GK_SELECT (29) SELECT key
			GK_SELECT = 0x29,

			// GK_PRINT (2A) PRINT key
			GK_PRINT = 0x2A,

			// GK_EXECUTE (2B) EXECUTE key
			GK_EXECUTE = 0x2B,

			// GK_SNAPSHOT (2C) PRINT SCREEN key
			GK_SNAPSHOT = 0x2C,

			// GK_INSERT (2D) INS key
			GK_INSERT = 0x2D,

			// GK_DELETE (2E) DEL key
			GK_DELETE = 0x2E,

			// GK_HELP (2F) HELP key
			GK_HELP = 0x2F,

			// (30) 0 key
			GK_0 = 0x30,

			// (31) 1 key
			GK_1 = 0x31,

			// (32) 2 key
			GK_2 = 0x32,

			// (33) 3 key
			GK_3 = 0x33,

			// (34) 4 key
			GK_4 = 0x34,

			// (35) 5 key;
			GK_5 = 0x35,

			// (36) 6 key
			GK_6 = 0x36,

			// (37) 7 key
			GK_7 = 0x37,

			// (38) 8 key
			GK_8 = 0x38,

			// (39) 9 key
			GK_9 = 0x39,

			// (41) A key
			GK_A = 0x41,

			// (42) B key
			GK_B = 0x42,

			// (43) C key
			GK_C = 0x43,

			// (44) D key
			GK_D = 0x44,

			// (45) E key
			GK_E = 0x45,

			// (46) F key
			GK_F = 0x46,

			// (47) G key
			GK_G = 0x47,

			// (48) H key
			GK_H = 0x48,

			// (49) I key
			GK_I = 0x49,

			// (4A) J key
			GK_J = 0x4A,

			// (4B) K key
			GK_K = 0x4B,

			// (4C) L key
			GK_L = 0x4C,

			// (4D) M key
			GK_M = 0x4D,

			// (4E) N key
			GK_N = 0x4E,

			// (4F) O key
			GK_O = 0x4F,

			// (50) P key
			GK_P = 0x50,

			// (51) Q key
			GK_Q = 0x51,

			// (52) R key
			GK_R = 0x52,

			// (53) S key
			GK_S = 0x53,

			// (54) T key
			GK_T = 0x54,

			// (55) U key
			GK_U = 0x55,

			// (56) V key
			GK_V = 0x56,

			// (57) W key
			GK_W = 0x57,

			// (58) X key
			GK_X = 0x58,

			// (59) Y key
			GK_Y = 0x59,

			// (5A) Z key
			GK_Z = 0x5A,

			// GK_LWIN (5B) Left Windows key (Microsoft Natural keyboard)
			GK_LWIN = 0x5B,

			// GK_RWIN (5C) Right Windows key (Natural keyboard)
			GK_RWIN = 0x5C,

			// GK_APPS (5D) Applications key (Natural keyboard)
			GK_APPS = 0x5D,

			// GK_SLEEP (5F) Computer Sleep key
			GK_SLEEP = 0x5F,

			// GK_NUMPAD0 (60) Numeric keypad 0 key
			GK_NUMPAD0 = 0x60,

			// GK_NUMPAD1 (61) Numeric keypad 1 key
			GK_NUMPAD1 = 0x61,

			// GK_NUMPAD2 (62) Numeric keypad 2 key
			GK_NUMPAD2 = 0x62,

			// GK_NUMPAD3 (63) Numeric keypad 3 key
			GK_NUMPAD3 = 0x63,

			// GK_NUMPAD4 (64) Numeric keypad 4 key
			GK_NUMPAD4 = 0x64,

			// GK_NUMPAD5 (65) Numeric keypad 5 key
			GK_NUMPAD5 = 0x65,

			// GK_NUMPAD6 (66) Numeric keypad 6 key
			GK_NUMPAD6 = 0x66,

			// GK_NUMPAD7 (67) Numeric keypad 7 key
			GK_NUMPAD7 = 0x67,

			// GK_NUMPAD8 (68) Numeric keypad 8 key
			GK_NUMPAD8 = 0x68,

			// GK_NUMPAD9 (69) Numeric keypad 9 key
			GK_NUMPAD9 = 0x69,

			// GK_MULTIPLY (6A) Multiply key
			GK_MULTIPLY = 0x6A,

			// GK_ADD (6B) Add key
			GK_ADD = 0x6B,

			// GK_SEPARATOR (6C) Separator key
			GK_SEPARATOR = 0x6C,

			// GK_SUBTRACT (6D) Subtract key
			GK_SUBTRACT = 0x6D,

			// GK_DECIMAL (6E) Decimal key
			GK_DECIMAL = 0x6E,

			// GK_DIVIDE (6F) Divide key
			GK_DIVIDE = 0x6F,

			// GK_F1 (70) F1 key
			GK_F1 = 0x70,

			// GK_F2 (71) F2 key
			GK_F2 = 0x71,

			// GK_F3 (72) F3 key
			GK_F3 = 0x72,

			// GK_F4 (73) F4 key
			GK_F4 = 0x73,

			// GK_F5 (74) F5 key
			GK_F5 = 0x74,

			// GK_F6 (75) F6 key
			GK_F6 = 0x75,

			// GK_F7 (76) F7 key
			GK_F7 = 0x76,

			// GK_F8 (77) F8 key
			GK_F8 = 0x77,

			// GK_F9 (78) F9 key
			GK_F9 = 0x78,

			// GK_F10 (79) F10 key
			GK_F10 = 0x79,

			// GK_F11 (7A) F11 key
			GK_F11 = 0x7A,

			// GK_F12 (7B) F12 key
			GK_F12 = 0x7B,

			// GK_F13 (7C) F13 key
			GK_F13 = 0x7C,

			// GK_F14 (7D) F14 key
			GK_F14 = 0x7D,

			// GK_F15 (7E) F15 key
			GK_F15 = 0x7E,

			// GK_F16 (7F) F16 key
			GK_F16 = 0x7F,

			// GK_F17 (80H) F17 key
			GK_F17 = 0x80,

			// GK_F18 (81H) F18 key
			GK_F18 = 0x81,

			// GK_F19 (82H) F19 key
			GK_F19 = 0x82,

			// GK_F20 (83H) F20 key
			GK_F20 = 0x83,

			// GK_F21 (84H) F21 key
			GK_F21 = 0x84,

			// GK_F22 (85H) F22 key
			GK_F22 = 0x85,

			// GK_F23 (86H) F23 key
			GK_F23 = 0x86,

			// GK_F24 (87H) F24 key
			GK_F24 = 0x87,

			// GK_NUMLOCK (90) NUM LOCK key
			GK_NUMLOCK = 0x90,

			// GK_SCROLL (91) SCROLL LOCK key
			GK_SCROLL = 0x91,

			// GK_LSHIFT (A0) Left SHIFT key
			GK_LSHIFT = 0xA0,

			// GK_RSHIFT (A1) Right SHIFT key
			GK_RSHIFT = 0xA1,

			// GK_LCONTROL (A2) Left CONTROL key
			GK_LCONTROL = 0xA2,

			// GK_RCONTROL (A3) Right CONTROL key
			GK_RCONTROL = 0xA3,

			// GK_LMENU (A4) Left MENU key
			GK_LMENU = 0xA4,

			// GK_RMENU (A5) Right MENU key
			GK_RMENU = 0xA5,

			// GK_BROWSER_BACK (A6) Windows 2000/XP: Browser Back key
			GK_BROWSER_BACK = 0xA6,

			// GK_BROWSER_FORWARD (A7) Windows 2000/XP: Browser Forward key
			GK_BROWSER_FORWARD = 0xA7,

			// GK_BROWSER_REFRESH (A8) Windows 2000/XP: Browser Refresh key
			GK_BROWSER_REFRESH = 0xA8,

			// GK_BROWSER_STOP (A9) Windows 2000/XP: Browser Stop key
			GK_BROWSER_STOP = 0xA9,

			// GK_BROWSER_SEARCH (AA) Windows 2000/XP: Browser Search key
			GK_BROWSER_SEARCH = 0xAA,

			// GK_BROWSER_FAVORITES (AB) Windows 2000/XP: Browser Favorites key
			GK_BROWSER_FAVORITES = 0xAB,

			// GK_BROWSER_HOME (AC) Windows 2000/XP: Browser Start and Home key
			GK_BROWSER_HOME = 0xAC,

			// GK_VOLUME_MUTE (AD) Windows 2000/XP: Volume Mute key
			GK_VOLUME_MUTE = 0xAD,

			// GK_VOLUME_DOWN (AE) Windows 2000/XP: Volume Down key
			GK_VOLUME_DOWN = 0xAE,

			// GK_VOLUME_UP (AF) Windows 2000/XP: Volume Up key
			GK_VOLUME_UP = 0xAF,

			// GK_MEDIA_NEXT_TRACK (B0) Windows 2000/XP: Next Track key
			GK_MEDIA_NEXT_TRACK = 0xB0,

			// GK_MEDIA_PREV_TRACK (B1) Windows 2000/XP: Previous Track key
			GK_MEDIA_PREV_TRACK = 0xB1,

			// GK_MEDIA_STOP (B2) Windows 2000/XP: Stop Media key
			GK_MEDIA_STOP = 0xB2,

			// GK_MEDIA_PLAY_PAUSE (B3) Windows 2000/XP: Play/Pause Media key
			GK_MEDIA_PLAY_PAUSE = 0xB3,

			// GK_LAUNCH_MAIL (B4) Windows 2000/XP: Start Mail key
			GK_MEDIA_LAUNCH_MAIL = 0xB4,

			// GK_LAUNCH_MEDIA_SELECT (B5) Windows 2000/XP: Select Media key
			GK_MEDIA_LAUNCH_MEDIA_SELECT = 0xB5,

			// GK_LAUNCH_APP1 (B6) Windows 2000/XP: Start Application 1 key
			GK_MEDIA_LAUNCH_APP1 = 0xB6,

			// GK_LAUNCH_APP2 (B7) Windows 2000/XP: Start Application 2 key
			GK_MEDIA_LAUNCH_APP2 = 0xB7,

			// GK_OEM_1 (BA) Used for miscellaneous characters; it can vary by keyboard. Windows 2000/XP: For the US
			// standard keyboard, the ';:' key
			GK_OEM_1 = 0xBA,

			// GK_OEM_PLUS (BB) Windows 2000/XP: For any country/region, the '+' key
			GK_OEM_PLUS = 0xBB,

			// GK_OEM_COMMA (BC) Windows 2000/XP: For any country/region, the ',' key
			GK_OEM_COMMA = 0xBC,

			// GK_OEM_MINUS (BD) Windows 2000/XP: For any country/region, the '-' key
			GK_OEM_MINUS = 0xBD,

			// GK_OEM_PERIOD (BE) Windows 2000/XP: For any country/region, the '.' key
			GK_OEM_PERIOD = 0xBE,

			// GK_OEM_2 (BF) Used for miscellaneous characters; it can vary by keyboard. Windows 2000/XP: For the US
			// standard keyboard, the '/?' key
			GK_OEM_2 = 0xBF,

			// GK_OEM_3 (C0) Used for miscellaneous characters; it can vary by keyboard. Windows 2000/XP: For the US
			// standard keyboard, the '`~' key
			GK_OEM_3 = 0xC0,

			// GK_OEM_4 (DB) Used for miscellaneous characters; it can vary by keyboard. Windows 2000/XP: For the US
			// standard keyboard, the '[{' key
			GK_OEM_4 = 0xDB,

			// GK_OEM_5 (DC) Used for miscellaneous characters; it can vary by keyboard. Windows 2000/XP: For the US
			// standard keyboard, the '\|' key
			GK_OEM_5 = 0xDC,

			// GK_OEM_6 (DD) Used for miscellaneous characters; it can vary by keyboard. Windows 2000/XP: For the US
			// standard keyboard, the ']}' key
			GK_OEM_6 = 0xDD,

			// GK_OEM_7 (DE) Used for miscellaneous characters; it can vary by keyboard. Windows 2000/XP: For the US
			// standard keyboard, the 'single-quote/double-quote' key
			GK_OEM_7 = 0xDE,

			// GK_OEM_8 (DF) Used for miscellaneous characters; it can vary by keyboard.
			GK_OEM_8 = 0xDF,

			// GK_OEM_102 (E2) Windows 2000/XP: Either the angle bracket key or the backslash key on the RT 102-key
			// keyboard
			GK_OEM_102 = 0xE2,

			// GK_PROCESSKEY (E5) Windows 95/98/Me, Windows NT 4.0, Windows 2000/XP: IME PROCESS key
			GK_PROCESSKEY = 0xE5,

			// GK_PACKET (E7) Windows 2000/XP: Used to pass Unicode characters as if they were keystrokes. The
			// GK_PACKET key is the low word of a 32-bit Virtual Key value used for non-keyboard input methods. For more
			// information, see Remark in KEYBDINPUT,SendInput, WM_KEYDOWN, and WM_KEYUP
			GK_PACKET = 0xE7,

			// GK_ATTN (F6) Attn key
			GK_ATTN = 0xF6,

			// GK_CRSEL (F7) CrSel key
			GK_CRSEL = 0xF7,

			// GK_EXSEL (F8) ExSel key
			GK_EXSEL = 0xF8,

			// GK_EREOF (F9) Erase EOF key
			GK_EREOF = 0xF9,

			// GK_PLAY (FA) Play key
			GK_PLAY = 0xFA,

			// GK_ZOOM (FB) Zoom key
			GK_ZOOM = 0xFB,

			// GK_NONAME (FC) Reserved for future use
			GK_NONAME = 0xFC,

			// GK_PA1 (FD) PA1 key
			GK_PA1 = 0xFD,

			// GK_OEM_CLEAR (FE) Clear key
			GK_OEM_CLEAR = 0xFE,

			GK_UNKNOWN = 0,
		}

		public enum ULModifier : uint8
		{
			// Whether or not an ALT key is down
			kMod_AltKey = 1 << 0,

			// Whether or not a Control key is down
			kMod_CtrlKey = 1 << 1,

			// Whether or not a meta key (Command-key on Mac, Windows-key on Win) is down
			kMod_MetaKey = 1 << 2,

			// Whether or not a Shift key is down
			kMod_ShiftKey = 1 << 3,
		};

		public enum ULMouseEventType : int32
		{
			kMouseEventType_MouseMoved,
			kMouseEventType_MouseDown,
			kMouseEventType_MouseUp,
		}

		public enum ULMouseButton : int32
		{
			kMouseButton_None = 0,
			kMouseButton_Left,
			kMouseButton_Middle,
			kMouseButton_Right,
		}

		public enum ULScrollEventType : int32
		{
			kScrollEventType_ScrollByPixel,
			kScrollEventType_ScrollByPage,
		}

		public enum ULFaceWinding : int32
		{
			kFaceWinding_Clockwise,
			kFaceWindow_CounterClockwise,
		};

		public enum ULFontHinting : int32
		{
			///
			/// Lighter hinting algorithm-- glyphs are slightly fuzzier but better
			/// resemble their original shape. This is achieved by snapping glyphs to the
			/// pixel grid only vertically which better preserves inter-glyph spacing.
			///
			kFontHinting_Smooth,

			///
			/// Default hinting algorithm-- offers a good balance between sharpness and
			/// shape at smaller font sizes.
			///
			kFontHinting_Normal,

			///
			/// Strongest hinting algorithm-- outputs only black/white glyphs. The result
			/// is usually unpleasant if the underlying TTF does not contain hints for
			/// this type of rendering.
			///
			kFontHinting_Monochrome,
		}

		[CRepr]
		public struct ULRect
		{
			public float left;
			public float top;
			public float right;
			public float bottom;
		}

		[CRepr]
		public struct ULIntRect
		{
			public int32 left;
			public int32 top;
			public int32 right;
			public int32 bottom;
		}

		[CRepr]
		public struct ULRenderTarget
		{
			public bool is_empty;
			public uint32 width;
			public uint32 height;
			public uint32 texture_id;
			public uint32 texture_width;
			public uint32 texture_height;
			public ULBitmapFormat texture_format;
			public ULRect uv_coords;
			public uint32 render_buffer_id;
		}


		/******************************************************************************
		* Version
		*****************************************************************************/

		[CLink]
		public static extern char8* ulVersionString();

		[CLink]
		public static extern uint32 ulVersionMajor();

		[CLink]
		public static extern uint32 ulVersionMinor();

		[CLink]
		public static extern uint32 ulVersionPatch();

		/******************************************************************************
		* Config
		*****************************************************************************/

		[CLink]
		public static extern ULConfig ulCreateConfig();

		[CLink]
		public static extern ULConfig ulDestroyConfig(ULConfig config);

		[CLink]
		public static extern void ulConfigSetResourcePath(ULConfig config, ULString resource_path);

		[CLink]
		public static extern void ulConfigSetCachePath(ULConfig config, ULString cache_path);

		[CLink]
		public static extern void ulConfigSetUseGPURenderer(ULConfig config, bool use_gpu);

		[CLink]
		public static extern void ulConfigSetDeviceScale(ULConfig config, double value);

		[CLink]
		public static extern void ulConfigSetFaceWinding(ULConfig config, ULFaceWinding value);

		[CLink]
		public static extern void ulConfigSetEnableImages(ULConfig config, bool enabled);

		[CLink]
		public static extern void ulConfigSetEnableJavaScript(ULConfig config, bool enabled);

		[CLink]
		public static extern void ulConfigSetFontHinting(ULConfig config, ULFontHinting font_hinting);

		[CLink]
		public static extern void ulConfigSetFontGamma(ULConfig config, double font_gamma);

		[CLink]
		public static extern void ulConfigSetFontFamilyStandard(ULConfig config, ULString font_name);

		[CLink]
		public static extern void ulConfigSetFontFamilyFixed(ULConfig config, ULString font_name);

		[CLink]
		public static extern void ulConfigSetFontFamilySerif(ULConfig config, ULString font_name);

		[CLink]
		public static extern void ulConfigSetFontFamilySansSerif(ULConfig config, ULString font_name);

		[CLink]
		public static extern void ulConfigSetUserAgent(ULConfig config, ULString agent_string);

		[CLink]
		public static extern void ulConfigSetUserStylesheet(ULConfig config, ULString css_string);

		[CLink]
		public static extern void ulConfigSetForceRepaint(ULConfig config, bool enabled);

		[CLink]
		public static extern void ulConfigSetAnimationTimerDelay(ULConfig config, double delay);

		[CLink]
		public static extern void ulConfigSetScrollTimerDelay(ULConfig config, double delay);

		[CLink]
		public static extern void ulConfigSetRecycleDelay(ULConfig config, double delay);

		[CLink]
		public static extern void ulConfigSetMemoryCacheSize(ULConfig config, uint32 size);

		[CLink]
		public static extern void ulConfigSetPageCacheSize(ULConfig config, uint32 size);

		[CLink]
		public static extern void ulConfigSetOverrideRAMSize(ULConfig config, uint32 size);

		[CLink]
		public static extern void ulConfigSetMinLargeHeapSize(ULConfig config, uint32 size);

		[CLink]
		public static extern void ulConfigSetMinSmallHeapSize(ULConfig config, uint32 size);


		/******************************************************************************
		* Renderer
		*****************************************************************************/

		[CLink]
		public static extern ULRenderer ulCreateRenderer(ULConfig config);


		[CLink]
		public static extern void ulDestroyRenderer(ULRenderer renderer);


		[CLink]
		public static extern void ulUpdate(ULRenderer renderer);


		[CLink]
		public static extern void ulRender(ULRenderer renderer);


		[CLink]
		public static extern void ulPurgeMemory(ULRenderer renderer);


		[CLink]
		public static extern void ulLogMemoryUsage(ULRenderer renderer);


		/******************************************************************************
		* Session
		*****************************************************************************/

		[CLink]
		public static extern ULSession ulCreateSession(ULRenderer renderer, bool is_persistent,
			ULString name);

		[CLink]
		public static extern void ulDestroySession(ULSession session);

		[CLink]
		public static extern ULSession ulDefaultSession(ULRenderer renderer);

		[CLink]
		public static extern bool ulSessionIsPersistent(ULSession session);

		[CLink]
		public static extern ULString ulSessionGetName(ULSession session);

		[CLink]
		public static extern int64 ulSessionGetId(ULSession session);

		[CLink]
		public static extern ULString ulSessionGetDiskPath(ULSession session);


		/******************************************************************************
		* View
		*****************************************************************************/


		[CLink]
		public static extern ULView ulCreateView(ULRenderer renderer, uint32 width,
			uint32 height, bool transparent,
			ULSession session, bool force_cpu_renderer);


		[CLink]
		public static extern void ulDestroyView(ULView view);

		[CLink]
		public static extern ULString ulViewGetURL(ULView view);

		[CLink]
		public static extern ULString ulViewGetTitle(ULView view);

		[CLink]
		public static extern uint32 ulViewGetWidth(ULView view);

		[CLink]
		public static extern uint32 ulViewGetHeight(ULView view);

		[CLink]
		public static extern bool ulViewIsLoading(ULView view);

		[CLink]
		public static extern ULRenderTarget ulViewGetRenderTarget(ULView view);

		[CLink]
		public static extern ULSurface ulViewGetSurface(ULView view);

		[CLink]
		public static extern void ulViewLoadHTML(ULView view, ULString html_string);

		[CLink]
		public static extern void ulViewLoadURL(ULView view, ULString url_string);

		[CLink]
		public static extern void ulViewResize(ULView view, uint32 width,
			uint32 height);

		[CLink]
		public static extern JSContextRef ulViewLockJSContext(ULView view);

		[CLink]
		public static extern void ulViewUnlockJSContext(ULView view);

		[CLink]
		public static extern ULString ulViewEvaluateScript(ULView view, ULString js_string, ULString* exception);

		[CLink]
		public static extern bool ulViewCanGoBack(ULView view);

		[CLink]
		public static extern bool ulViewCanGoForward(ULView view);

		[CLink]
		public static extern void ulViewGoBack(ULView view);

		[CLink]
		public static extern void ulViewGoForward(ULView view);

		[CLink]
		public static extern void ulViewGoToHistoryOffset(ULView view, int offset);

		[CLink]
		public static extern void ulViewReload(ULView view);

		[CLink]
		public static extern void ulViewStop(ULView view);

		[CLink]
		public static extern void ulViewFocus(ULView view);

		[CLink]
		public static extern void ulViewUnfocus(ULView view);

		[CLink]
		public static extern bool ulViewHasFocus(ULView view);

		[CLink]
		public static extern bool ulViewHasInputFocus(ULView view);

		[CLink]
		public static extern void ulViewFireKeyEvent(ULView view, ULKeyEvent key_event);

		[CLink]
		public static extern void ulViewFireMouseEvent(ULView view, ULMouseEvent mouse_event);

		[CLink]
		public static extern void ulViewFireScrollEvent(ULView view, ULScrollEvent scroll_event);


		public typealias ULChangeTitleCallback = function void(void* user_data, ULView caller, ULString title);

		[CLink]
		public static extern void ulViewSetChangeTitleCallback(ULView view,
			ULChangeTitleCallback callback,
			void* user_data);

		public typealias ULChangeURLCallback = function void(void* user_data, ULView caller, ULString url);

		public typealias ULChangeTooltipCallback = function void(void* user_data, ULView caller, ULString tooltip);

		[CLink]
		public static extern void ulViewSetChangeTooltipCallback(ULView view,
			ULChangeTooltipCallback callback,
			void* user_data);

		public typealias ULChangeCursorCallback = function void(void*, ULView, ULCursor);

		[CLink]
		public static extern void ulViewSetChangeCursorCallback(ULView view,
			ULChangeCursorCallback callback,
			void* user_data);

		public typealias ULAddConsoleMessageCallback = function void(void* user_data, ULView caller,
			ULMessageSource source, ULMessageLevel level,
			ULString message, uint32 line_number,
			uint32 column_number,
			ULString source_id);

		[CLink]
		public static extern void ulViewSetAddConsoleMessageCallback(ULView view,
			ULAddConsoleMessageCallback callback,
			void* user_data);

		public typealias ULCreateChildViewCallback = function ULView(void* user_data, ULView caller,
			ULString opener_url, ULString target_url, bool is_popup,
			ULIntRect popup_rect);

		[CLink]
		public static extern void ulViewSetCreateChildViewCallback(ULView view,
			ULCreateChildViewCallback callback,
			void* user_data);

		public typealias ULBeginLoadingCallback = function void(void* user_data, ULView caller,
			uint64 frame_id, bool is_main_frame, ULString url);

		[CLink]
		public static extern void ulViewSetBeginLoadingCallback(ULView view,
			ULBeginLoadingCallback callback,
			void* user_data);

		public typealias ULFinishLoadingCallback = function void(void* user_data, ULView caller,
			uint64 frame_id, bool is_main_frame, ULString url);

		[CLink]
		public static extern void ulViewSetFinishLoadingCallback(ULView view,
			ULFinishLoadingCallback callback,
			void* user_data);

		public typealias ULFailLoadingCallback = function void(void* user_data, ULView caller,
			uint64 frame_id, bool is_main_frame, ULString url,
			ULString description, ULString error_domain, int32 error_code);

		[CLink]
		public static extern void ulViewSetFailLoadingCallback(ULView view,
			ULFailLoadingCallback callback,
			void* user_data);

		public typealias ULWindowObjectReadyCallback = function void(void* user_data, ULView caller,
			uint64 frame_id, bool is_main_frame, ULString url);

		[CLink]
		public static extern void ulViewSetWindowObjectReadyCallback(ULView view,
			ULWindowObjectReadyCallback callback,
			void* user_data);

		public typealias ULDOMReadyCallback = function void(void* user_data, ULView caller,
			uint64 frame_id, bool is_main_frame, ULString url);

		[CLink]
		public static extern void ulViewSetDOMReadyCallback(ULView view,
			ULDOMReadyCallback callback,
			void* user_data);

		public typealias ULUpdateHistoryCallback = function void(void* user_data, ULView caller);

		[CLink]
		public static extern void ulViewSetUpdateHistoryCallback(ULView view,
			ULUpdateHistoryCallback callback,
			void* user_data);

		[CLink]
		public static extern void ulViewSetNeedsPaint(ULView view, bool needs_paint);

		[CLink]
		public static extern bool ulViewGetNeedsPaint(ULView view);

		[CLink]
		public static extern ULView ulViewCreateInspectorView(ULView view);

		/******************************************************************************
		* String
		*****************************************************************************/

		[CLink]
		public static extern ULString ulCreateString(char8* str);

		[CLink]
		public static extern ULString ulCreateStringUTF8(char8* str, uint len);

		[CLink]
		public static extern ULString ulCreateStringUTF16(ULChar16* str, uint len);

		[CLink]
		public static extern ULString ulCreateStringFromCopy(ULString str);

		[CLink]
		public static extern void ulDestroyString(ULString str);

		[CLink]
		public static extern ULChar16* ulStringGetData(ULString str);

		[CLink]
		public static extern uint ulStringGetLength(ULString str);

		[CLink]
		public static extern bool ulStringIsEmpty(ULString str);

		[CLink]
		public static extern void ulStringAssignString(ULString str, ULString new_str);

		[CLink]
		public static extern void ulStringAssignCString(ULString str, char8* c_str);

		/******************************************************************************
		* Bitmap
		*****************************************************************************/

		[CLink]
		public static extern ULBitmap ulCreateEmptyBitmap();

		[CLink]
		public static extern ULBitmap ulCreateBitmap(uint32 width, uint32 height,
			ULBitmapFormat format);

		[CLink]
		public static extern ULBitmap ulCreateBitmapFromPixels(uint32 width,
			uint32 height,
			ULBitmapFormat format,
			uint32 row_bytes,
			void* pixels, uint size,
			bool should_copy);

		[CLink]
		public static extern ULBitmap ulCreateBitmapFromCopy(ULBitmap existing_bitmap);

		[CLink]
		public static extern void ulDestroyBitmap(ULBitmap bitmap);

		[CLink]
		public static extern uint32 ulBitmapGetWidth(ULBitmap bitmap);

		[CLink]
		public static extern uint32 ulBitmapGetHeight(ULBitmap bitmap);

		[CLink]
		public static extern ULBitmapFormat ulBitmapGetFormat(ULBitmap bitmap);

		[CLink]
		public static extern uint32 ulBitmapGetBpp(ULBitmap bitmap);

		[CLink]
		public static extern uint32 ulBitmapGetRowBytes(ULBitmap bitmap);

		[CLink]
		public static extern uint ulBitmapGetSize(ULBitmap bitmap);

		[CLink]
		public static extern bool ulBitmapOwnsPixels(ULBitmap bitmap);

		[CLink]
		public static extern void* ulBitmapLockPixels(ULBitmap bitmap);

		[CLink]
		public static extern void ulBitmapUnlockPixels(ULBitmap bitmap);

		[CLink]
		public static extern void* ulBitmapRawPixels(ULBitmap bitmap);

		[CLink]
		public static extern bool ulBitmapIsEmpty(ULBitmap bitmap);

		[CLink]
		public static extern void ulBitmapErase(ULBitmap bitmap);

		[CLink]
		public static extern bool ulBitmapWritePNG(ULBitmap bitmap, char8* path);

		[CLink]
		public static extern void ulBitmapSwapRedBlueChannels(ULBitmap bitmap);

		/******************************************************************************
		* Key Event
		******************************************************************************/

		[CLink]
		public static extern ULKeyEvent ulCreateKeyEvent(ULKeyEventType type,
			uint32 modifiers,
			int virtual_key_code, int native_key_code,
			ULString text, ULString unmodified_text,
			bool is_keypad, bool is_auto_repeat,
			bool is_system_key);

#if BF_PLATFORM_WINDOWS
		[CLink]
		public static extern ULKeyEvent ulCreateKeyEventWindows(ULKeyEventType type,
			uint wparam, int lparam,
			bool is_system_key);
#endif

#if BF_PLATFORM_MACOS
		// Untested
		[CLink]
		public static extern ULKeyEvent ulCreateKeyEventMacOS(void* evt);
#endif

		[CLink]
		public static extern void ulDestroyKeyEvent(ULKeyEvent evt);

		/******************************************************************************
		* Mouse Event
		*****************************************************************************/

		[CLink]
		public static extern ULMouseEvent ulCreateMouseEvent(ULMouseEventType type, int x, int y,
			ULMouseButton button);

		[CLink]
		public static extern void ulDestroyMouseEvent(ULMouseEvent evt);

		/******************************************************************************
		* Scroll Event
		*****************************************************************************/

		[CLink]
		public static extern ULScrollEvent ulCreateScrollEvent(ULScrollEventType type, int delta_x,
			int delta_y);

		[CLink]
		public static extern void ulDestroyScrollEvent(ULScrollEvent evt);


		/******************************************************************************
		* Rect
		*****************************************************************************/

		[CLink]
		public static extern bool ulRectIsEmpty(ULRect rect);

		[CLink]
		public static extern ULRect ulRectMakeEmpty();

		/******************************************************************************
		* IntRect
		*****************************************************************************/

		[CLink]
		public static extern bool ulIntRectIsEmpty(ULIntRect rect);

		[CLink]
		public static extern ULIntRect ulIntRectMakeEmpty();

		/******************************************************************************
		* Surface
		*****************************************************************************/

		[CLink]
		public static extern uint32 ulSurfaceGetWidth(ULSurface surface);

		[CLink]
		public static extern uint32 ulSurfaceGetHeight(ULSurface surface);

		[CLink]
		public static extern uint32 ulSurfaceGetRowBytes(ULSurface surface);

		[CLink]
		public static extern uint ulSurfaceGetSize(ULSurface surface);

		[CLink]
		public static extern void* ulSurfaceLockPixels(ULSurface surface);

		[CLink]
		public static extern void ulSurfaceUnlockPixels(ULSurface surface);

		[CLink]
		public static extern void ulSurfaceResize(ULSurface surface, uint32 width, uint32 height);

		[CLink]
		public static extern void ulSurfaceSetDirtyBounds(ULSurface surface, ULIntRect bounds);

		[CLink]
		public static extern ULIntRect ulSurfaceGetDirtyBounds(ULSurface surface);

		[CLink]
		public static extern void ulSurfaceClearDirtyBounds(ULSurface surface);

		[CLink]
		public static extern void* ulSurfaceGetUserData(ULSurface surface);

		/******************************************************************************
		* BitmapSurface
		*****************************************************************************/

		[CLink]
		public static extern ULBitmap ulBitmapSurfaceGetBitmap(ULBitmapSurface surface);

		/******************************************************************************
		* Surface Definition
		*****************************************************************************/

		public typealias ULSurfaceDefinitionCreateCallback = function void*(uint32 width, uint32 height);

		public typealias ULSurfaceDefinitionDestroyCallback = function void(void* user_data);

		public typealias ULSurfaceDefinitionGetWidthCallback = function uint32(void* user_data);

		public typealias ULSurfaceDefinitionGetHeightCallback = function uint32(void* user_data);

		public typealias ULSurfaceDefinitionGetRowBytesCallback = function uint32(void* user_data);

		public typealias ULSurfaceDefinitionGetSizeCallback = function uint(void* user_data);

		public typealias ULSurfaceDefinitionLockPixelsCallback = function void*(void* user_data);

		public typealias ULSurfaceDefinitionUnlockPixelsCallback = function void(void* user_data);

		public typealias ULSurfaceDefinitionResizeCallback = function void(void* user_data, uint32 width, uint32 height);

		[CRepr]
		public struct ULSurfaceDefinition
		{
			public ULSurfaceDefinitionCreateCallback create;
			public ULSurfaceDefinitionDestroyCallback destroy;
			public ULSurfaceDefinitionGetWidthCallback get_width;
			public ULSurfaceDefinitionGetHeightCallback get_height;
			public ULSurfaceDefinitionGetRowBytesCallback get_row_bytes;
			public ULSurfaceDefinitionGetSizeCallback get_size;
			public ULSurfaceDefinitionLockPixelsCallback lock_pixels;
			public ULSurfaceDefinitionUnlockPixelsCallback unlock_pixels;
			public ULSurfaceDefinitionResizeCallback resize;
		};

		/******************************************************************************
		* File System
		*****************************************************************************/

#if BF_PLATFORM_WINDOWS		
		public typealias ULFileHandle = uint32;
#else
		public typealias ULFileHandle = int32;
#endif

		public const ULFileHandle ULInvalidFileHandle = (ULFileHandle) - 1;

		public typealias ULFileSystemFileExistsCallback = function bool(ULString path);

		public typealias ULFileSystemGetFileSizeCallback = function bool(ULFileHandle handle, int64* result);

		public typealias ULFileSystemGetFileMimeTypeCallback = function bool(ULString path, ULString result);

		public typealias ULFileSystemOpenFileCallback = function ULFileHandle(ULString path, bool open_for_writing);

		public typealias ULFileSystemCloseFileCallback = function void(ULFileHandle handle);

		public typealias ULFileSystemReadFromFileCallback = function int64(ULFileHandle handle, char8* data, int64 length);

		[CRepr]
		public struct ULFileSystem
		{
			public ULFileSystemFileExistsCallback file_exists;
			public ULFileSystemGetFileSizeCallback get_file_size;
			public ULFileSystemGetFileMimeTypeCallback get_file_mime_type;
			public ULFileSystemOpenFileCallback open_file;
			public ULFileSystemCloseFileCallback close_file;
			public ULFileSystemReadFromFileCallback read_from_file;
		};

		/******************************************************************************
		* Logger
		*****************************************************************************/

		public enum ULLogLevel : int32
		{
			kLogLevel_Error = 0,
			kLogLevel_Warning,
			kLogLevel_Info
		}

		public typealias ULLoggerLogMessageCallback = function void(ULLogLevel log_level, ULString message);

		[CRepr]
		public struct ULLogger
		{
			public ULLoggerLogMessageCallback log_message;
		}

		/******************************************************************************
		* GPUDriver
		*****************************************************************************/

		[CRepr]
		public struct ULRenderBuffer
		{
			public uint32 texture_id;// The backing texture for this RenderBuffer
			public uint32 width;// The width of the RenderBuffer texture
			public uint32 height;// The height of the RenderBuffer texture
			public bool has_stencil_buffer;// Currently unused, always false.
			public bool has_depth_buffer;// Currently unused, always false.
		};

		[CRepr, Packed]
		public struct ULVertex_2f_4ub_2f
		{
			public float[2] pos;
			public uint8[4] color;
			public float[2] obj;
		}

		[CRepr, Packed]
		public struct ULVertex_2f_4ub_2f_2f_28f
		{
			public float[2] pos;
			public uint8[4] color;
			public float[2] tex;
			public float[2] obj;
			public float[4] data0;
			public float[4] data1;
			public float[4] data2;
			public float[4] data3;
			public float[4] data4;
			public float[4] data5;
			public float[4] data6;
		};

		public enum ULVertexBufferFormat : int32
		{
			kVertexBufferFormat_2f_4ub_2f,
			kVertexBufferFormat_2f_4ub_2f_2f_28f,
		};

		[CRepr]
		public struct ULVertexBuffer
		{
			public ULVertexBufferFormat format;
			public uint32 size;
			public uint8* data;
		};

		typealias ULIndexType = uint32;

		[CRepr]
		public struct ULIndexBuffer
		{
			public uint32 size;
			public uint8* data;
		};

		public enum ULShaderType : int32
		{
			kShaderType_Fill,// Shader program for quad geometry
			kShaderType_FillPath,// Shader program for path geometry
		};

		[CRepr]
		public struct ULMatrix4x4
		{
			public float[16] data;
		};

		[CRepr]
		public struct ULvec4
		{
			public float[4] value;
		};


		[CRepr]
		public struct ULGPUState
		{
			/// Viewport width in pixels
			public uint32 viewport_width;

			/// Viewport height in pixels
			public uint32 viewport_height;

			/// Transform matrix-- you should multiply this with the screen-space
			/// orthographic projection matrix then pass to the vertex shader.
			public ULMatrix4x4 transform;

			/// Whether or not we should enable texturing for the current draw command.
			public bool enable_texturing;

			/// Whether or not we should enable blending for the current draw command.
			/// If blending is disabled, any drawn pixels should overwrite existing.
			/// Mainly used so we can modify alpha values of the RenderBuffer during
			/// scissored clears.
			public bool enable_blend;

			/// The vertex/pixel shader program pair to use for the current draw command.
			/// You should cast this to ShaderType to get the corresponding enum.
			public uint8 shader_type;

			/// The render buffer to use for the current draw command.
			public uint32 render_buffer_id;

			/// The texture id to bind to slot #1. (Will be 0 if none)
			public uint32 texture_1_id;

			/// The texture id to bind to slot #2. (Will be 0 if none)
			public uint32 texture_2_id;

			/// The texture id to bind to slot #3. (Will be 0 if none)
			public uint32 texture_3_id;

			/// The following four members are passed to the pixel shader via uniforms.
			public float[8] uniform_scalar;
			public ULvec4[8] uniform_vector;
			public uint8 clip_size;
			public ULMatrix4x4[8] clip;

			/// Whether or not scissor testing should be used for the current draw
			/// command.
			public bool enable_scissor;

			/// The scissor rect to use for scissor testing (units in pixels)
			public ULIntRect scissor_rect;
		};

		public enum ULCommandType : int32
		{
			kCommandType_ClearRenderBuffer,
			kCommandType_DrawGeometry,
		};

		[CRepr]
		public struct ULCommand
		{
			public uint8 command_type;// The type of command to dispatch.
			public ULGPUState gpu_state;// GPU state parameters for current command.

			/// The following members are only used with kCommandType_DrawGeometry
			public uint32 geometry_id;// The geometry ID to bind
			public uint32 indices_count;// The number of indices
			public uint32 indices_offset;// The index to start from
		};

		[CRepr]
		public struct ULCommandList
		{
			public uint32 size;
			public ULCommand* commands;
		};

		public typealias ULGPUDriverBeginSynchronizeCallback = function void();

		public typealias ULGPUDriverEndSynchronizeCallback = function void();

		public typealias ULGPUDriverNextTextureIdCallback = function void();

		public typealias ULGPUDriverCreateTextureCallback = function void(uint32 texture_id,
			ULBitmap bitmap);

		public typealias ULGPUDriverUpdateTextureCallback = function void(uint32 texture_id,
			ULBitmap bitmap);

		public typealias ULGPUDriverDestroyTextureCallback = function void(uint32 texture_id);

		public typealias ULGPUDriverNextRenderBufferIdCallback = function uint32();

		public typealias ULGPUDriverCreateRenderBufferCallback = function void(uint32 render_buffer_id,
			ULRenderBuffer buffer);

		public typealias ULGPUDriverDestroyRenderBufferCallback = function void(uint32 render_buffer_id);

		public typealias ULGPUDriverNextGeometryIdCallback = function uint32();

		public typealias ULGPUDriverCreateGeometryCallback = function void(uint32 geometry_id,
			ULVertexBuffer vertices,
			ULIndexBuffer indices);

		public typealias ULGPUDriverUpdateGeometryCallback = function void(uint32 geometry_id,
			ULVertexBuffer vertices,
			ULIndexBuffer indices);

		public typealias ULGPUDriverDestroyGeometryCallback = function void(uint32 geometry_id);

		public typealias ULGPUDriverUpdateCommandListCallback = function void(ULCommandList list);

		[CRepr]
		public struct ULGPUDriver
		{
			public ULGPUDriverBeginSynchronizeCallback begin_synchronize;
			public ULGPUDriverEndSynchronizeCallback end_synchronize;
			public ULGPUDriverNextTextureIdCallback next_texture_id;
			public ULGPUDriverCreateTextureCallback create_texture;
			public ULGPUDriverUpdateTextureCallback update_texture;
			public ULGPUDriverDestroyTextureCallback destroy_texture;
			public ULGPUDriverNextRenderBufferIdCallback next_render_buffer_id;
			public ULGPUDriverCreateRenderBufferCallback create_render_buffer;
			public ULGPUDriverDestroyRenderBufferCallback destroy_render_buffer;
			public ULGPUDriverNextGeometryIdCallback next_geometry_id;
			public ULGPUDriverCreateGeometryCallback create_geometry;
			public ULGPUDriverUpdateGeometryCallback update_geometry;
			public ULGPUDriverDestroyGeometryCallback destroy_geometry;
			public ULGPUDriverUpdateCommandListCallback update_command_list;
		};

		[CLink]
		public static extern ULMatrix4x4 ulApplyProjection(ULMatrix4x4 transform,
			float viewport_width,
			float viewport_height,
			bool flip_y);

		/******************************************************************************
		* Clipboard
		*****************************************************************************/

		public typealias ULClipboardClearCallback = function void();

		public typealias ULClipboardReadPlainTextCallback = function void(ULString result);

		public typealias ULClipboardWritePlainTextCallback = function void(ULString text);

		[CRepr]
		public struct ULClipboard
		{
			public ULClipboardClearCallback clear;
			public ULClipboardReadPlainTextCallback read_plain_text;
			public ULClipboardWritePlainTextCallback write_plain_text;
		}

		/******************************************************************************
		* Platform
		*****************************************************************************/

		[CLink]
		public static extern void ulPlatformSetLogger(ULLogger logger);

		[CLink]
		public static extern void ulPlatformSetFileSystem(ULFileSystem file_system);

		[CLink]
		public static extern void ulPlatformSetSurfaceDefinition(ULSurfaceDefinition surface_definition);

		[CLink]
		public static extern void ulPlatformSetGPUDriver(ULGPUDriver gpu_driver);

		[CLink]
		public static extern void ulPlatformSetClipboard(ULClipboard clipboard);
	}
}
