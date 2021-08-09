using System;

namespace Ultralight
{
	static
	{
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
			kMessageSource_Other
		};
		
		public enum ULMessageLevel : int32
		{
			kMessageLevel_Log = 1,
			kMessageLevel_Warning = 2,
			kMessageLevel_Error = 3,
			kMessageLevel_Debug = 4,
			kMessageLevel_Info = 5
		};
		
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
		};
		
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
		};
		
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
			kKeyEventType_Char
		};
		
		public enum ULMouseEventType : int32
		{
			kMouseEventType_MouseMoved,
			kMouseEventType_MouseDown,
			kMouseEventType_MouseUp
		};
		
		public enum ULMouseButton : int32
		{
			kMouseButton_None = 0,
			kMouseButton_Left,
			kMouseButton_Middle,
			kMouseButton_Right
		};
		
		public enum ULScrollEventType : int32
		{
			kScrollEventType_ScrollByPixel,
			kScrollEventType_ScrollByPage
		};
		
		public enum ULFaceWinding : int32
		{
			kFaceWinding_Clockwise,
			kFaceWindow_CounterClockwise
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
			kFontHinting_Monochrome
		};
		
		public enum ULLogLevel : int32
		{
			kLogLevel_Error = 0,
			kLogLevel_Warning,
			kLogLevel_Info
		};
		
		///
		/// Vertex formats.
		///
		public enum ULVertexBufferFormat : int32
		{
			kVertexBufferFormat_2f_4ub_2f,
			kVertexBufferFormat_2f_4ub_2f_2f_28f
		};
		
		///
		/// Shader types, used with ULGPUState::shader_type
		///
		/// Each of these correspond to a vertex/pixel shader pair. You can find
		/// stock shader code for these in the `shaders` folder of the AppCore repo.
		///
		public enum ULShaderType : int32
		{
			kShaderType_Fill, // Shader program for quad geometry
			kShaderType_FillPath // Shader program for path geometry
		};
		
		///
		/// Command types, used with ULCommand::command_type
		///
		public enum ULCommandType : int32
		{
			kCommandType_ClearRenderBuffer,
			kCommandType_DrawGeometry
		};
		
		///
		/// Window creation flags. @see Window::Create
		///
		public enum ULWindowFlags : int32
		{
			kWindowFlags_Borderless = 1<<0,
			kWindowFlags_Titled = 1<<1,
			kWindowFlags_Resizable = 1<<2,
			kWindowFlags_Maximizable = 1<<3
		};
	}
}
