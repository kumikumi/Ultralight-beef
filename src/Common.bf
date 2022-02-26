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
		
		[CRepr]
		public struct ULRect
		{
			public float left;
			public float top;
			public float right;
			public float bottom;
		};
		
		[CRepr]
		public struct ULIntRect
		{
			public int32 left;
			public int32 top;
			public int32 right;
			public int32 bottom;
		};
		
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
		};
		
		public enum ULLogLevel : int32
		{
			kLogLevel_Error = 0,
			kLogLevel_Warning,
			kLogLevel_Info
		};
		
		///
		/// Render buffer description.
		///
		[CRepr]
		public struct ULRenderBuffer
		{
			public uint32 texture_id; // The backing texture for this RenderBuffer
			public uint32 width; // The width of the RenderBuffer texture
			public uint32 height; // The height of the RenderBuffer texture
			public bool has_stencil_buffer; // Currently unused, always false.
			public bool has_depth_buffer; // Currently unsued, always false.
		};
		
		///
		/// Vertex layout for path vertices.
		///
		/// (this struct's members aligned on single-byte boundaries)
		///
		[CRepr, Packed]
		public struct ULVertex_2f_4ub_2f
		{
			public float[2] pos;
			public uint8[4] color;
			public float[2] obj;
		};
		
		///
		/// Vertex layout for quad vertices.
		///
		/// (this struct's members aligned on single-byte boundaries)
		///
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
		
		///
		/// Vertex formats.
		///
		public enum ULVertexBufferFormat : int32
		{
			kVertexBufferFormat_2f_4ub_2f,
			kVertexBufferFormat_2f_4ub_2f_2f_28f
		};
		
		///
		/// Vertex buffer data.
		///
		[CRepr]
		public struct ULVertexBuffer
		{
			public ULVertexBufferFormat format;
			public uint32 size;
			public uint8* data;
		};
		
		///
		/// Vertex index buffer data.
		///
		[CRepr]
		public struct ULIndexBuffer
		{
			public uint32 size;
			public uint8* data;
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
		/// Raw 4x4 matrix as an array of floats
		///
		[CRepr]
		public struct ULMatrix4x4
		{
			public float[16] data;
		};
		
		///
		/// 4-component float vector
		///
		[CRepr]
		public struct ULvec4
		{
			public float[4] value;
		};
		
		///
		/// GPU State description.
		///
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
		
		///
		/// Command types, used with ULCommand::command_type
		///
		public enum ULCommandType : int32
		{
			kCommandType_ClearRenderBuffer,
			kCommandType_DrawGeometry
		};
		
		///
		/// Command description.
		///
		[CRepr]
		public struct ULCommand
		{
			public uint8 command_type; // The type of command to dispatch.
			public ULGPUState gpu_state; // GPU state parameters for current command.
		
			/// The following members are only used with kCommandType_DrawGeometry
			public uint32 geometry_id; // The geometry ID to bind
			public uint32 indices_count; // The number of indices
			public uint32 indices_offset; // The index to start from
		};
		
		///
		/// Command list, @see ULGPUDriverUpdateCommandList
		[CRepr]
		public struct ULCommandList
		{
			public uint32 size;
			public ULCommand* commands;
		};
		
		///
		/// Window creation flags. @see Window::Create
		///
		public enum ULWindowFlags : int32
		{
			kWindowFlags_Borderless = 1<<0,
			kWindowFlags_Titled = 1<<1,
			kWindowFlags_Resizable = 1<<2,
			kWindowFlags_Maximizable = 1<<3,
			kWindowFlags_Hidden = 1<<4
		};
	}
}
