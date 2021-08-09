using System;

namespace Ultralight.CAPI
{
	static
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
		
		/******************************************************************************
		* API Note:
		*
		* You should only destroy objects that you explicitly create. Do not destroy
		* any objects returned from the API or callbacks unless otherwise noted.
		*****************************************************************************/
		
		/******************************************************************************
		* Version
		*****************************************************************************/
		
		///
		/// Get the version string of the library in MAJOR.MINOR.PATCH format.
		///
		[CLink]
		public static extern char8* ulVersionString();
		
		///
		/// Get the numeric major version of the library.
		///
		[CLink]
		public static extern uint32 ulVersionMajor();
		
		///
		/// Get the numeric minor version of the library.
		///
		[CLink]
		public static extern uint32 ulVersionMinor();
		
		///
		/// Get the numeric patch version of the library.
		///
		[CLink]
		public static extern uint32 ulVersionPatch();
		
		/******************************************************************************
		* Config
		*****************************************************************************/
		
		///
		/// Create config with default values (see <Ultralight/platform/Config.h>).
		///
		[CLink]
		public static extern ULConfig ulCreateConfig();
		
		///
		/// Destroy config.
		///
		[CLink]
		public static extern void ulDestroyConfig(ULConfig config);
		
		///
		/// Set the file path to the directory that contains Ultralight's bundled
		/// resources (eg, cacert.pem and other localized resources).
		///
		[CLink]
		public static extern void ulConfigSetResourcePath(ULConfig config, ULString resource_path);
		
		///
		/// Set the file path to a writable directory that will be used to store
		/// cookies, cached resources, and other persistent data.
		///
		[CLink]
		public static extern void ulConfigSetCachePath(ULConfig config, ULString cache_path);
		
		///
		/// When enabled, each View will be rendered to an offscreen GPU texture
		/// using the GPU driver set in ulPlatformSetGPUDriver. You can fetch
		/// details for the texture via ulViewGetRenderTarget.
		///
		/// When disabled (the default), each View will be rendered to an offscreen
		/// pixel buffer. This pixel buffer can optionally be provided by the user--
		/// for more info see ulViewGetSurface.
		///
		[CLink]
		public static extern void ulConfigSetUseGPURenderer(ULConfig config, bool use_gpu);
		
		///
		/// Set the amount that the application DPI has been scaled, used for
		/// scaling device coordinates to pixels and oversampling raster shapes
		/// (Default = 1.0).
		///
		[CLink]
		public static extern void ulConfigSetDeviceScale(ULConfig config, double value);
		
		///
		/// The winding order for front-facing triangles. @see FaceWinding
		///
		/// Note: This is only used with custom GPUDrivers
		///
		[CLink]
		public static extern void ulConfigSetFaceWinding(ULConfig config, ULFaceWinding winding);
		
		///
		/// Set whether images should be enabled (Default = True).
		///
		[CLink]
		public static extern void ulConfigSetEnableImages(ULConfig config, bool enabled);
		
		///
		/// Set whether JavaScript should be eanbled (Default = True).
		///
		[CLink]
		public static extern void ulConfigSetEnableJavaScript(ULConfig config, bool enabled);
		
		///
		/// The hinting algorithm to use when rendering fonts. (Default = kFontHinting_Normal)
		/// @see ULFontHinting
		///
		[CLink]
		public static extern void ulConfigSetFontHinting(ULConfig config, ULFontHinting font_hinting);
		
		///
		/// The gamma to use when compositing font glyphs, change this value to
		/// adjust contrast (Adobe and Apple prefer 1.8, others may prefer 2.2).
		/// (Default = 1.8)
		///
		[CLink]
		public static extern void ulConfigSetFontGamma(ULConfig config, double font_gamma);
		
		///
		/// Set default font-family to use (Default = Times New Roman).
		///
		[CLink]
		public static extern void ulConfigSetFontFamilyStandard(ULConfig config, ULString font_name);
		
		///
		/// Set default font-family to use for fixed fonts, eg <pre> and <code>
		/// (Default = Courier New).
		///
		[CLink]
		public static extern void ulConfigSetFontFamilyFixed(ULConfig config, ULString font_name);
		
		///
		/// Set default font-family to use for serif fonts (Default = Times New Roman).
		///
		[CLink]
		public static extern void ulConfigSetFontFamilySerif(ULConfig config, ULString font_name);
		
		///
		/// Set default font-family to use for sans-serif fonts (Default = Arial).
		///
		[CLink]
		public static extern void ulConfigSetFontFamilySansSerif(ULConfig config, ULString font_name);
		
		///
		/// Set user agent string (See <Ultralight/platform/Config.h> for the default).
		///
		[CLink]
		public static extern void ulConfigSetUserAgent(ULConfig config, ULString agent_string);
		
		///
		/// Set user stylesheet (CSS) (Default = Empty).
		///
		[CLink]
		public static extern void ulConfigSetUserStylesheet(ULConfig config, ULString css_string);
		
		///
		/// Set whether or not we should continuously repaint any Views or compositor
		/// layers, regardless if they are dirty or not. This is mainly used to
		/// diagnose painting/shader issues. (Default = False)
		///
		[CLink]
		public static extern void ulConfigSetForceRepaint(ULConfig config, bool enabled);
		
		///
		/// Set the amount of time to wait before triggering another repaint when a
		/// CSS animation is active. (Default = 1.0 / 60.0)
		///
		[CLink]
		public static extern void ulConfigSetAnimationTimerDelay(ULConfig config, double delay);
		
		///
		/// When a smooth scroll animation is active, the amount of time (in seconds)
		/// to wait before triggering another repaint. Default is 60 Hz.
		///
		[CLink]
		public static extern void ulConfigSetScrollTimerDelay(ULConfig config, double delay);
		
		///
		/// The amount of time (in seconds) to wait before running the recycler (will
		/// attempt to return excess memory back to the system). (Default = 4.0)
		///
		[CLink]
		public static extern void ulConfigSetRecycleDelay(ULConfig config, double delay);
		
		///
		/// Set the size of WebCore's memory cache for decoded images, scripts, and
		/// other assets in bytes. (Default = 64 * 1024 * 1024)
		///
		[CLink]
		public static extern void ulConfigSetMemoryCacheSize(ULConfig config, uint32 size);
		
		///
		/// Set the number of pages to keep in the cache. (Default = 0)
		///
		[CLink]
		public static extern void ulConfigSetPageCacheSize(ULConfig config, uint32 size);
		
		///
		/// JavaScriptCore tries to detect the system's physical RAM size to set
		/// reasonable allocation limits. Set this to anything other than 0 to
		/// override the detected value. Size is in bytes.
		///
		/// This can be used to force JavaScriptCore to be more conservative with
		/// its allocation strategy (at the cost of some performance).
		///
		[CLink]
		public static extern void ulConfigSetOverrideRAMSize(ULConfig config, uint32 size);
		
		///
		/// The minimum size of large VM heaps in JavaScriptCore. Set this to a
		/// lower value to make these heaps start with a smaller initial value.
		///
		[CLink]
		public static extern void ulConfigSetMinLargeHeapSize(ULConfig config, uint32 size);
		
		///
		/// The minimum size of small VM heaps in JavaScriptCore. Set this to a
		/// lower value to make these heaps start with a smaller initial value.
		///
		[CLink]
		public static extern void ulConfigSetMinSmallHeapSize(ULConfig config, uint32 size);
		
		/******************************************************************************
		* Renderer
		*****************************************************************************/
		
		///
		/// Create the Ultralight Renderer directly.
		///
		/// Unlike ulCreateApp(), this does not use any native windows for drawing
		/// and allows you to manage your own runloop and painting. This method is
		/// recommended for those wishing to integrate the library into a game.
		///
		/// This singleton manages the lifetime of all Views and coordinates all
		/// painting, rendering, network requests, and event dispatch.
		///
		/// You should only call this once per process lifetime.
		///
		/// You shoud set up your platform handlers (eg, ulPlatformSetLogger,
		/// ulPlatformSetFileSystem, etc.) before calling this.
		///
		/// You will also need to define a font loader before calling this--
		/// as of this writing (v1.2) the only way to do this in C API is by calling
		/// ulEnablePlatformFontLoader() (available in <AppCore/CAPI.h>).
		///
		/// @NOTE:  You should not call this if you are using ulCreateApp(), it
		///         creates its own renderer and provides default implementations for
		///         various platform handlers automatically.
		///
		[CLink]
		public static extern ULRenderer ulCreateRenderer(ULConfig config);
		
		///
		/// Destroy the renderer.
		///
		[CLink]
		public static extern void ulDestroyRenderer(ULRenderer renderer);
		
		///
		/// Update timers and dispatch internal callbacks (JavaScript and network).
		///
		[CLink]
		public static extern void ulUpdate(ULRenderer renderer);
		
		///
		/// Render all active Views.
		///
		[CLink]
		public static extern void ulRender(ULRenderer renderer);
		
		///
		/// Attempt to release as much memory as possible. Don't call this from any
		/// callbacks or driver code.
		///
		[CLink]
		public static extern void ulPurgeMemory(ULRenderer renderer);
		
		///
		/// Print detailed memory usage statistics to the log.
		/// (@see ulPlatformSetLogger)
		///
		[CLink]
		public static extern void ulLogMemoryUsage(ULRenderer renderer);
		
		/******************************************************************************
		* Session
		*****************************************************************************/
		
		///
		/// Create a Session to store local data in (such as cookies, local storage,
		/// application cache, indexed db, etc).
		///
		[CLink]
		public static extern ULSession ulCreateSession(ULRenderer renderer, bool is_persistent, ULString name);
		
		///
		/// Destroy a Session.
		///
		[CLink]
		public static extern void ulDestroySession(ULSession session);
		
		///
		/// Get the default session (persistent session named "default").
		///
		/// @note  This session is owned by the Renderer, you shouldn't destroy it.
		///
		[CLink]
		public static extern ULSession ulDefaultSession(ULRenderer renderer);
		
		///
		/// Whether or not is persistent (backed to disk).
		///
		[CLink]
		public static extern bool ulSessionIsPersistent(ULSession session);
		
		///
		/// Unique name identifying the session (used for unique disk path).
		///
		[CLink]
		public static extern ULString ulSessionGetName(ULSession session);
		
		///
		/// Unique numeric Id for the session.
		///
		[CLink]
		public static extern uint64 ulSessionGetId(ULSession session);
		
		///
		/// The disk path to write to (used by persistent sessions only).
		///
		[CLink]
		public static extern ULString ulSessionGetDiskPath(ULSession session);
		
		/******************************************************************************
		* View
		*****************************************************************************/
		
		///
		/// Create a View with certain size (in pixels).
		///
		/// @note  You can pass null to 'session' to use the default session.
		///
		[CLink]
		public static extern ULView ulCreateView(ULRenderer renderer, uint32 width, uint32 height, bool transparent, ULSession session, bool force_cpu_renderer);
		
		///
		/// Destroy a View.
		///
		[CLink]
		public static extern void ulDestroyView(ULView view);
		
		///
		/// Get current URL.
		///
		/// @note Don't destroy the returned string, it is owned by the View.
		///
		[CLink]
		public static extern ULString ulViewGetURL(ULView view);
		
		///
		/// Get current title.
		///
		/// @note Don't destroy the returned string, it is owned by the View.
		///
		[CLink]
		public static extern ULString ulViewGetTitle(ULView view);
		
		///
		/// Get the width, in pixels.
		///
		[CLink]
		public static extern uint32 ulViewGetWidth(ULView view);
		
		///
		/// Get the height, in pixels.
		///
		[CLink]
		public static extern uint32 ulViewGetHeight(ULView view);
		
		///
		/// Check if main frame is loading.
		///
		[CLink]
		public static extern bool ulViewIsLoading(ULView view);
		
		///
		/// Get the RenderTarget for the View.
		///
		/// @note  Only valid when the GPU renderer is enabled in Config.
		///
		[CLink]
		public static extern ULRenderTarget ulViewGetRenderTarget(ULView view);
		
		///
		/// Get the Surface for the View (native pixel buffer container).
		///
		/// @note  Only valid when the GPU renderer is disabled in Config.
		///
		///        (Will return a nullptr when the GPU renderer is enabled.)
		///
		///        The default Surface is BitmapSurface but you can provide your
		///        own Surface implementation via ulPlatformSetSurfaceDefinition.
		///
		///        When using the default Surface, you can retrieve the underlying
		///        bitmap by casting ULSurface to ULBitmapSurface and calling
		///        ulBitmapSurfaceGetBitmap().
		///
		[CLink]
		public static extern ULSurface ulViewGetSurface(ULView view);
		
		///
		/// Load a raw string of HTML.
		///
		[CLink]
		public static extern void ulViewLoadHTML(ULView view, ULString html_string);
		
		///
		/// Load a URL into main frame.
		///
		[CLink]
		public static extern void ulViewLoadURL(ULView view, ULString url_string);
		
		///
		/// Resize view to a certain width and height (in pixels).
		///
		[CLink]
		public static extern void ulViewResize(ULView view, uint32 width, uint32 height);
		
		///
		/// Acquire the page's JSContext for use with JavaScriptCore API.
		///
		/// @note  This call locks the context for the current thread. You should
		///        call ulViewUnlockJSContext() after using the context so other
		///        worker threads can modify JavaScript state.
		///
		/// @note  The lock is recusive, it's okay to call this multiple times as long
		///        as you call ulViewUnlockJSContext() the same number of times.
		///
		[CLink]
		public static extern JSContextRef ulViewLockJSContext(ULView view);
		
		///
		/// Unlock the page's JSContext after a previous call to ulViewLockJSContext().
		///
		[CLink]
		public static extern void ulViewUnlockJSContext(ULView view);
		
		///
		/// Evaluate a string of JavaScript and return result.
		///
		/// @param  js_string  The string of JavaScript to evaluate.
		///
		/// @param  exception  The address of a ULString to store a description of the
		///                    last exception. Pass NULL to ignore this. Don't destroy
		///                    the exception string returned, it's owned by the View.
		///
		/// @note Don't destroy the returned string, it's owned by the View. This value
		///       is reset with every call-- if you want to retain it you should copy
		///       the result to a new string via ulCreateStringFromCopy().
		///
		/// @note An example of using this API:
		///       <pre>
		///         ULString script = ulCreateString("1 + 1");
		///         ULString exception;
		///         ULString result = ulViewEvaluateScript(view, script, &exception);
		///         /* Use the result ("2") and exception description (if any) here. */
		///         ulDestroyString(script);
		///       </pre>
		///
		[CLink]
		public static extern ULString ulViewEvaluateScript(ULView view, ULString js_string, ULString* exception);
		
		///
		/// Check if can navigate backwards in history.
		///
		[CLink]
		public static extern bool ulViewCanGoBack(ULView view);
		
		///
		/// Check if can navigate forwards in history.
		///
		[CLink]
		public static extern bool ulViewCanGoForward(ULView view);
		
		///
		/// Navigate backwards in history.
		///
		[CLink]
		public static extern void ulViewGoBack(ULView view);
		
		///
		/// Navigate forwards in history.
		///
		[CLink]
		public static extern void ulViewGoForward(ULView view);
		
		///
		/// Navigate to arbitrary offset in history.
		///
		[CLink]
		public static extern void ulViewGoToHistoryOffset(ULView view, int32 offset);
		
		///
		/// Reload current page.
		///
		[CLink]
		public static extern void ulViewReload(ULView view);
		
		///
		/// Stop all page loads.
		///
		[CLink]
		public static extern void ulViewStop(ULView view);
		
		///
		/// Give focus to the View.
		///
		/// You should call this to give visual indication that the View has input
		/// focus (changes active text selection colors, for example).
		///
		[CLink]
		public static extern void ulViewFocus(ULView view);
		
		///
		/// Remove focus from the View and unfocus any focused input elements.
		///
		/// You should call this to give visual indication that the View has lost
		/// input focus.
		///
		[CLink]
		public static extern void ulViewUnfocus(ULView view);
		
		///
		/// Whether or not the View has focus.
		///
		[CLink]
		public static extern bool ulViewHasFocus(ULView view);
		
		///
		/// Whether or not the View has an input element with visible keyboard focus
		/// (indicated by a blinking caret).
		///
		/// You can use this to decide whether or not the View should consume
		/// keyboard input events (useful in games with mixed UI and key handling).
		///
		[CLink]
		public static extern bool ulViewHasInputFocus(ULView view);
		
		///
		/// Fire a keyboard event.
		///
		[CLink]
		public static extern void ulViewFireKeyEvent(ULView view, ULKeyEvent key_event);
		
		///
		/// Fire a mouse event.
		///
		[CLink]
		public static extern void ulViewFireMouseEvent(ULView view, ULMouseEvent mouse_event);
		
		///
		/// Fire a scroll event.
		///
		[CLink]
		public static extern void ulViewFireScrollEvent(ULView view, ULScrollEvent scroll_event);
		
		public typealias ULChangeTitleCallback = function void(void* user_data, ULView caller, ULString title);
		
		///
		/// Set callback for when the page title changes.
		///
		[CLink]
		public static extern void ulViewSetChangeTitleCallback(ULView view, ULChangeTitleCallback callback, void* user_data);
		
		public typealias ULChangeURLCallback = function void(void* user_data, ULView caller, ULString url);
		
		///
		/// Set callback for when the page URL changes.
		///
		[CLink]
		public static extern void ulViewSetChangeURLCallback(ULView view, ULChangeURLCallback callback, void* user_data);
		
		public typealias ULChangeTooltipCallback = function void(void* user_data, ULView caller, ULString tooltip);
		
		///
		/// Set callback for when the tooltip changes (usually result of a mouse hover).
		///
		[CLink]
		public static extern void ulViewSetChangeTooltipCallback(ULView view, ULChangeTooltipCallback callback, void* user_data);
		
		public typealias ULChangeCursorCallback = function void(void* user_data, ULView caller, ULCursor cursor);
		
		///
		/// Set callback for when the mouse cursor changes.
		///
		[CLink]
		public static extern void ulViewSetChangeCursorCallback(ULView view, ULChangeCursorCallback callback, void* user_data);
		
		public typealias ULAddConsoleMessageCallback = function void(void* user_data, ULView caller, ULMessageSource source, ULMessageLevel level, ULString message, uint32 line_number, uint32 column_number, ULString source_id);
		
		///
		/// Set callback for when a message is added to the console (useful for
		/// JavaScript / network errors and debugging).
		///
		[CLink]
		public static extern void ulViewSetAddConsoleMessageCallback(ULView view, ULAddConsoleMessageCallback callback, void* user_data);
		
		public typealias ULCreateChildViewCallback = function ULView(void* user_data, ULView caller, ULString opener_url, ULString target_url, bool is_popup, ULIntRect popup_rect);
		
		///
		/// Set callback for when the page wants to create a new View.
		///
		/// This is usually the result of a user clicking a link with target="_blank"
		/// or by JavaScript calling window.open(url).
		///
		/// To allow creation of these new Views, you should create a new View in
		/// this callback, resize it to your container,
		/// and return it. You are responsible for displaying the returned View.
		///
		/// You should return NULL if you want to block the action.
		///
		[CLink]
		public static extern void ulViewSetCreateChildViewCallback(ULView view, ULCreateChildViewCallback callback, void* user_data);
		
		public typealias ULBeginLoadingCallback = function void(void* user_data, ULView caller, uint64 frame_id, bool is_main_frame, ULString url);
		
		///
		/// Set callback for when the page begins loading a new URL into a frame.
		///
		[CLink]
		public static extern void ulViewSetBeginLoadingCallback(ULView view, ULBeginLoadingCallback callback, void* user_data);
		
		public typealias ULFinishLoadingCallback = function void(void* user_data, ULView caller, uint64 frame_id, bool is_main_frame, ULString url);
		
		///
		/// Set callback for when the page finishes loading a URL into a frame.
		///
		[CLink]
		public static extern void ulViewSetFinishLoadingCallback(ULView view, ULFinishLoadingCallback callback, void* user_data);
		
		public typealias ULFailLoadingCallback = function void(void* user_data, ULView caller, uint64 frame_id, bool is_main_frame, ULString url, ULString description, ULString error_domain, int32 error_code);
		
		///
		/// Set callback for when an error occurs while loading a URL into a frame.
		///
		[CLink]
		public static extern void ulViewSetFailLoadingCallback(ULView view, ULFailLoadingCallback callback, void* user_data);
		
		public typealias ULWindowObjectReadyCallback = function void(void* user_data, ULView caller, uint64 frame_id, bool is_main_frame, ULString url);
		
		///
		/// Set callback for when the JavaScript window object is reset for a new
		/// page load.
		///
		/// This is called before any scripts are executed on the page and is the
		/// earliest time to setup any initial JavaScript state or bindings.
		///
		/// The document is not guaranteed to be loaded/parsed at this point. If
		/// you need to make any JavaScript calls that are dependent on DOM elements
		/// or scripts on the page, use DOMReady instead.
		///
		/// The window object is lazily initialized (this will not be called on pages
		/// with no scripts).
		///
		[CLink]
		public static extern void ulViewSetWindowObjectReadyCallback(ULView view, ULWindowObjectReadyCallback callback, void* user_data);
		
		public typealias ULDOMReadyCallback = function void(void* user_data, ULView caller, uint64 frame_id, bool is_main_frame, ULString url);
		
		///
		/// Set callback for when all JavaScript has been parsed and the document is
		/// ready.
		///
		/// This is the best time to make any JavaScript calls that are dependent on
		/// DOM elements or scripts on the page.
		///
		[CLink]
		public static extern void ulViewSetDOMReadyCallback(ULView view, ULDOMReadyCallback callback, void* user_data);
		
		public typealias ULUpdateHistoryCallback = function void(void* user_data, ULView caller);
		
		///
		/// Set callback for when the history (back/forward state) is modified.
		///
		[CLink]
		public static extern void ulViewSetUpdateHistoryCallback(ULView view, ULUpdateHistoryCallback callback, void* user_data);
		
		///
		/// Set whether or not a view should be repainted during the next call to
		/// ulRender.
		///
		/// @note  This flag is automatically set whenever the page content changes
		///        but you can set it directly in case you need to force a repaint.
		///
		[CLink]
		public static extern void ulViewSetNeedsPaint(ULView view, bool needs_paint);
		
		///
		/// Whether or not a view should be painted during the next call to ulRender.
		///
		[CLink]
		public static extern bool ulViewGetNeedsPaint(ULView view);
		
		///
		/// Create an inspector for this View, this is useful for debugging and
		/// inspecting pages locally. This will only succeed if you have the
		/// inspector assets in your filesystem-- the inspector will look for
		/// file:///inspector/Main.html when it loads.
		///
		/// @note  The initial dimensions of the returned View are 10x10, you should
		///        call ulViewResize on the returned View to resize it to your desired
		///        dimensions.
		///
		/// @note  You will need to call ulDestroyView on the returned instance
		///        when you're done using it.
		///
		[CLink]
		public static extern ULView ulViewCreateInspectorView(ULView view);
		
		/******************************************************************************
		* String
		*****************************************************************************/
		
		///
		/// Create string from null-terminated ASCII C-string.
		///
		[CLink]
		public static extern ULString ulCreateString(char8* str);
		
		///
		/// Create string from UTF-8 buffer.
		///
		[CLink]
		public static extern ULString ulCreateStringUTF8(char8* str, uint32 len);
		
		///
		/// Create string from UTF-16 buffer.
		///
		[CLink]
		public static extern ULString ulCreateStringUTF16(ULChar16* str, uint32 len);
		
		///
		/// Create string from copy of existing string.
		///
		[CLink]
		public static extern ULString ulCreateStringFromCopy(ULString str);
		
		///
		/// Destroy string (you should destroy any strings you explicitly Create).
		///
		[CLink]
		public static extern void ulDestroyString(ULString str);
		
		///
		/// Get internal UTF-16 buffer data.
		///
		[CLink]
		public static extern ULChar16* ulStringGetData(ULString str);
		
		///
		/// Get length in UTF-16 characters.
		///
		[CLink]
		public static extern uint32 ulStringGetLength(ULString str);
		
		///
		/// Whether this string is empty or not.
		///
		[CLink]
		public static extern bool ulStringIsEmpty(ULString str);
		
		///
		/// Replaces the contents of 'str' with the contents of 'new_str'
		///
		[CLink]
		public static extern void ulStringAssignString(ULString str, ULString new_str);
		
		///
		/// Replaces the contents of 'str' with the contents of a C-string.
		///
		[CLink]
		public static extern void ulStringAssignCString(ULString str, char8* c_str);
		
		/******************************************************************************
		* Bitmap
		*****************************************************************************/
		
		///
		/// Create empty bitmap.
		///
		[CLink]
		public static extern ULBitmap ulCreateEmptyBitmap();
		
		///
		/// Create bitmap with certain dimensions and pixel format.
		///
		[CLink]
		public static extern ULBitmap ulCreateBitmap(uint32 width, uint32 height, ULBitmapFormat format);
		
		///
		/// Create bitmap from existing pixel buffer. @see Bitmap for help using
		/// this function.
		///
		[CLink]
		public static extern ULBitmap ulCreateBitmapFromPixels(uint32 width, uint32 height, ULBitmapFormat format, uint32 row_bytes, void* pixels, uint32 size, bool should_copy);
		
		///
		/// Create bitmap from copy.
		///
		[CLink]
		public static extern ULBitmap ulCreateBitmapFromCopy(ULBitmap existing_bitmap);
		
		///
		/// Destroy a bitmap (you should only destroy Bitmaps you have explicitly
		/// created via one of the creation functions above.
		///
		[CLink]
		public static extern void ulDestroyBitmap(ULBitmap bitmap);
		
		///
		/// Get the width in pixels.
		///
		[CLink]
		public static extern uint32 ulBitmapGetWidth(ULBitmap bitmap);
		
		///
		/// Get the height in pixels.
		///
		[CLink]
		public static extern uint32 ulBitmapGetHeight(ULBitmap bitmap);
		
		///
		/// Get the pixel format.
		///
		[CLink]
		public static extern ULBitmapFormat ulBitmapGetFormat(ULBitmap bitmap);
		
		///
		/// Get the bytes per pixel.
		///
		[CLink]
		public static extern uint32 ulBitmapGetBpp(ULBitmap bitmap);
		
		///
		/// Get the number of bytes per row.
		///
		[CLink]
		public static extern uint32 ulBitmapGetRowBytes(ULBitmap bitmap);
		
		///
		/// Get the size in bytes of the underlying pixel buffer.
		///
		[CLink]
		public static extern uint32 ulBitmapGetSize(ULBitmap bitmap);
		
		///
		/// Whether or not this bitmap owns its own pixel buffer.
		///
		[CLink]
		public static extern bool ulBitmapOwnsPixels(ULBitmap bitmap);
		
		///
		/// Lock pixels for reading/writing, returns pointer to pixel buffer.
		///
		[CLink]
		public static extern void* ulBitmapLockPixels(ULBitmap bitmap);
		
		///
		/// Unlock pixels after locking.
		///
		[CLink]
		public static extern void ulBitmapUnlockPixels(ULBitmap bitmap);
		
		///
		/// Get raw pixel buffer-- you should only call this if Bitmap is already
		/// locked.
		///
		[CLink]
		public static extern void* ulBitmapRawPixels(ULBitmap bitmap);
		
		///
		/// Whether or not this bitmap is empty.
		///
		[CLink]
		public static extern bool ulBitmapIsEmpty(ULBitmap bitmap);
		
		///
		/// Reset bitmap pixels to 0.
		///
		[CLink]
		public static extern void ulBitmapErase(ULBitmap bitmap);
		
		///
		/// Write bitmap to a PNG on disk.
		///
		[CLink]
		public static extern bool ulBitmapWritePNG(ULBitmap bitmap, char8* path);
		
		///
		/// This converts a BGRA bitmap to RGBA bitmap and vice-versa by swapping
		/// the red and blue channels.
		///
		[CLink]
		public static extern void ulBitmapSwapRedBlueChannels(ULBitmap bitmap);
		
		/******************************************************************************
		* Key Event
		******************************************************************************/
		
		///
		/// Create a key event, @see KeyEvent for help with the following parameters.
		///
		[CLink]
		public static extern ULKeyEvent ulCreateKeyEvent(ULKeyEventType type, uint32 modifiers, int32 virtual_key_code, int32 native_key_code, ULString text, ULString unmodified_text, bool is_keypad, bool is_auto_repeat, bool is_system_key);
		
		#if BF_PLATFORM_WINDOWS
		///
		/// Create a key event from native Windows event.
		///
		[CLink]
		public static extern ULKeyEvent ulCreateKeyEventWindows(ULKeyEventType type, uint wparam, int lparam, bool is_system_key);
		
		#endif
		#if BF_PLATFORM_MACOS
		///
		/// Create a key event from native macOS event.
		///
		[CLink]
		public static extern ULKeyEvent ulCreateKeyEventMacOS(NSEvent* evt);
		
		#endif
		///
		/// Destroy a key event.
		///
		[CLink]
		public static extern void ulDestroyKeyEvent(ULKeyEvent evt);
		
		/******************************************************************************
		* Mouse Event
		*****************************************************************************/
		
		///
		/// Create a mouse event, @see MouseEvent for help using this function.
		///
		[CLink]
		public static extern ULMouseEvent ulCreateMouseEvent(ULMouseEventType type, int32 x, int32 y, ULMouseButton button);
		
		///
		/// Destroy a mouse event.
		///
		[CLink]
		public static extern void ulDestroyMouseEvent(ULMouseEvent evt);
		
		/******************************************************************************
		* Scroll Event
		*****************************************************************************/
		
		///
		/// Create a scroll event, @see ScrollEvent for help using this function.
		///
		[CLink]
		public static extern ULScrollEvent ulCreateScrollEvent(ULScrollEventType type, int32 delta_x, int32 delta_y);
		
		///
		/// Destroy a scroll event.
		///
		[CLink]
		public static extern void ulDestroyScrollEvent(ULScrollEvent evt);
		
		/******************************************************************************
		* Rect
		*****************************************************************************/
		
		///
		/// Whether or not a ULRect is empty (all members equal to 0)
		///
		[CLink]
		public static extern bool ulRectIsEmpty(ULRect rect);
		
		///
		/// Create an empty ULRect (all members equal to 0)
		///
		[CLink]
		public static extern ULRect ulRectMakeEmpty();
		
		/******************************************************************************
		* IntRect
		*****************************************************************************/
		
		///
		/// Whether or not a ULIntRect is empty (all members equal to 0)
		///
		[CLink]
		public static extern bool ulIntRectIsEmpty(ULIntRect rect);
		
		///
		/// Create an empty ULIntRect (all members equal to 0)
		///
		[CLink]
		public static extern ULIntRect ulIntRectMakeEmpty();
		
		/******************************************************************************
		* Surface
		*****************************************************************************/
		
		///
		/// Width (in pixels).
		///
		[CLink]
		public static extern uint32 ulSurfaceGetWidth(ULSurface surface);
		
		///
		/// Height (in pixels).
		///
		[CLink]
		public static extern uint32 ulSurfaceGetHeight(ULSurface surface);
		
		///
		/// Number of bytes between rows (usually width * 4)
		///
		[CLink]
		public static extern uint32 ulSurfaceGetRowBytes(ULSurface surface);
		
		///
		/// Size in bytes.
		///
		[CLink]
		public static extern uint32 ulSurfaceGetSize(ULSurface surface);
		
		///
		/// Lock the pixel buffer and get a pointer to the beginning of the data
		/// for reading/writing.
		///
		/// Native pixel format is premultiplied BGRA 32-bit (8 bits per channel).
		///
		[CLink]
		public static extern void* ulSurfaceLockPixels(ULSurface surface);
		
		///
		/// Unlock the pixel buffer.
		///
		[CLink]
		public static extern void ulSurfaceUnlockPixels(ULSurface surface);
		
		///
		/// Resize the pixel buffer to a certain width and height (both in pixels).
		///
		/// This should never be called while pixels are locked.
		///
		[CLink]
		public static extern void ulSurfaceResize(ULSurface surface, uint32 width, uint32 height);
		
		///
		/// Set the dirty bounds to a certain value.
		///
		/// This is called after the Renderer paints to an area of the pixel buffer.
		/// (The new value will be joined with the existing dirty_bounds())
		///
		[CLink]
		public static extern void ulSurfaceSetDirtyBounds(ULSurface surface, ULIntRect bounds);
		
		///
		/// Get the dirty bounds.
		///
		/// This value can be used to determine which portion of the pixel buffer has
		/// been updated since the last call to ulSurfaceClearDirtyBounds().
		///
		/// The general algorithm to determine if a Surface needs display is:
		/// <pre>
		///   if (!ulIntRectIsEmpty(ulSurfaceGetDirtyBounds(surface))) {
		///       // Surface pixels are dirty and needs display.
		///       // Cast Surface to native Surface and use it here (pseudo code)
		///       DisplaySurface(surface);
		///
		///       // Once you're done, clear the dirty bounds:
		///       ulSurfaceClearDirtyBounds(surface);
		///  }
		///  </pre>
		///
		[CLink]
		public static extern ULIntRect ulSurfaceGetDirtyBounds(ULSurface surface);
		
		///
		/// Clear the dirty bounds.
		///
		/// You should call this after you're done displaying the Surface.
		///
		[CLink]
		public static extern void ulSurfaceClearDirtyBounds(ULSurface surface);
		
		///
		/// Get the underlying user data pointer (this is only valid if you have
		/// set a custom surface implementation via ulPlatformSetSurfaceDefinition).
		///
		/// This will return nullptr if this surface is the default ULBitmapSurface.
		///
		[CLink]
		public static extern void* ulSurfaceGetUserData(ULSurface surface);
		
		/******************************************************************************
		* BitmapSurface
		*****************************************************************************/
		
		///
		/// Get the underlying Bitmap from the default Surface.
		///
		/// @note  Do not call ulDestroyBitmap() on the returned value, it is owned
		///        by the surface.
		///
		[CLink]
		public static extern ULBitmap ulBitmapSurfaceGetBitmap(ULBitmapSurface surface);
		
		/******************************************************************************
		* Surface Definition
		*****************************************************************************/
		
		///
		/// The callback invoked when a Surface is created.
		///
		/// @param  width  The width in pixels.
		/// @param  height  The height in pixels.
		///
		/// @return  This callback should return a pointer to user-defined data for the
		///          instance. This user data pointer will be passed to all other
		///          callbacks when operating on the instance.
		///
		public typealias ULSurfaceDefinitionCreateCallback = function void*(uint32 width, uint32 height);
		
		///
		/// The callback invoked when a Surface is destroyed.
		///
		/// @param  user_data  User data pointer uniquely identifying the surface.
		///
		public typealias ULSurfaceDefinitionDestroyCallback = function void(void* user_data);
		
		///
		/// The callback invoked when a Surface's width (in pixels) is requested.
		///
		/// @param  user_data  User data pointer uniquely identifying the surface.
		///
		public typealias ULSurfaceDefinitionGetWidthCallback = function uint32(void* user_data);
		
		///
		/// The callback invoked when a Surface's height (in pixels) is requested.
		///
		/// @param  user_data  User data pointer uniquely identifying the surface.
		///
		public typealias ULSurfaceDefinitionGetHeightCallback = function uint32(void* user_data);
		
		///
		/// The callback invoked when a Surface's row bytes is requested.
		///
		/// @note  This value is also known as "stride". Usually width * 4.
		///
		/// @param  user_data  User data pointer uniquely identifying the surface.
		///
		public typealias ULSurfaceDefinitionGetRowBytesCallback = function uint32(void* user_data);
		
		///
		/// The callback invoked when a Surface's size (in bytes) is requested.
		///
		/// @param  user_data  User data pointer uniquely identifying the surface.
		///
		public typealias ULSurfaceDefinitionGetSizeCallback = function uint32(void* user_data);
		
		///
		/// The callback invoked when a Surface's pixel buffer is requested to be
		/// locked for reading/writing (should return a pointer to locked bytes).
		///
		/// @param  user_data  User data pointer uniquely identifying the surface.
		///
		public typealias ULSurfaceDefinitionLockPixelsCallback = function void*(void* user_data);
		
		///
		/// The callback invoked when a Surface's pixel buffer is requested to be
		/// unlocked after previously being locked.
		///
		/// @param  user_data  User data pointer uniquely identifying the surface.
		///
		public typealias ULSurfaceDefinitionUnlockPixelsCallback = function void(void* user_data);
		
		///
		/// The callback invoked when a Surface is requested to be resized to a
		/// certain width/height.
		///
		/// @param  user_data  User data pointer uniquely identifying the surface.
		/// @param  width      Width in pixels.
		/// @param  height     Height in pixels.
		///
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
		
		///
		/// File Handle type used as unique ID for opened files.
		///
		#if BF_PLATFORM_WINDOWS
		public typealias ULFileHandle = uint32;
		#else
		public typealias ULFileHandle = int32;
		#endif
		///
		/// Handle used to denote an invalid file.
		///
		public const ULFileHandle ULInvalidFileHandle = (ULFileHandle)-1;
		
		///
		/// The callback invoked when the FileSystem wants to check if a file path
		/// exists, return true if it exists.
		///
		public typealias ULFileSystemFileExistsCallback = function bool(ULString path);
		
		///
		/// The callback invoked when the FileSystem wants to get the file size of a
		/// previously opened file, store result in 'result'. Return true on success.
		///
		public typealias ULFileSystemGetFileSizeCallback = function bool(ULFileHandle handle, int64* result);
		
		///
		/// The callback invoked when the FileSystem wants to get the mime type of a
		/// file (eg "text/html"), store result in 'result'. Return true on success.
		///
		public typealias ULFileSystemGetFileMimeTypeCallback = function bool(ULString path, ULString result);
		
		///
		/// The callback invoked when the FileSystem wants to open a file path for
		/// reading or writing. Return file handle on success, or ULInvalidFileHandle
		/// on failure.
		///
		/// @NOTE:  As of this writing (v1.2), this function is only used for reading.
		///
		public typealias ULFileSystemOpenFileCallback = function ULFileHandle(ULString path, bool open_for_writing);
		
		///
		/// The callback invoked when the FileSystem wants to close a previously-opened
		/// file.
		///
		public typealias ULFileSystemCloseFileCallback = function void(ULFileHandle handle);
		
		///
		/// The callback invoked when the FileSystem wants to read from a
		/// currently-opened file, return number of bytes read or -1 on failure.
		///
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
		
		///
		/// The callback invoked when the library wants to print a message to the log.
		///
		public typealias ULLoggerLogMessageCallback = function void(ULLogLevel log_level, ULString message);
		
		[CRepr]
		public struct ULLogger
		{
			public ULLoggerLogMessageCallback log_message;
		};
		
		/******************************************************************************
		* GPUDriver
		*****************************************************************************/
		
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
		/// @note  This pragma pack(push, 1) command is important! Vertex layouts
		///	       should not be padded with any bytes.
		///
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
		/// End single-byte alignment.
		///
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
		/// Vertex index type.
		///
		public typealias ULIndexType = uint32;
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
		/// The callback invoked when the GPUDriver will begin dispatching commands
		/// (such as CreateTexture and UpdateCommandList) during the current call to
		/// ulRender().
		///
		public typealias ULGPUDriverBeginSynchronizeCallback = function void();
		
		///
		/// The callback invoked when the GPUDriver has finished dispatching commands.
		/// during the current call to ulRender().
		///
		public typealias ULGPUDriverEndSynchronizeCallback = function void();
		
		///
		/// The callback invoked when the GPUDriver wants to get the next available
		/// texture ID.
		///
		public typealias ULGPUDriverNextTextureIdCallback = function uint32();
		
		///
		/// The callback invoked when the GPUDriver wants to create a texture with a
		/// certain ID and optional bitmap.
		///
		/// **NOTE**: If the Bitmap is empty (ulBitmapIsEmpty), then a RTT Texture
		///           should be created instead. This will be used as a backing
		///           texture for a new RenderBuffer.
		///
		public typealias ULGPUDriverCreateTextureCallback = function void(uint32 texture_id, ULBitmap bitmap);
		
		///
		/// The callback invoked when the GPUDriver wants to update an existing non-RTT
		/// texture with new bitmap data.
		///
		public typealias ULGPUDriverUpdateTextureCallback = function void(uint32 texture_id, ULBitmap bitmap);
		
		///
		/// The callback invoked when the GPUDriver wants to destroy a texture.
		///
		public typealias ULGPUDriverDestroyTextureCallback = function void(uint32 texture_id);
		
		///
		/// The callback invoked when the GPUDriver wants to generate the next
		/// available render buffer ID.
		///
		public typealias ULGPUDriverNextRenderBufferIdCallback = function uint32();
		
		///
		/// The callback invoked when the GPUDriver wants to create a render buffer
		/// with certain ID and buffer description.
		///
		public typealias ULGPUDriverCreateRenderBufferCallback = function void(uint32 render_buffer_id, ULRenderBuffer buffer);
		
		///
		/// The callback invoked when the GPUDriver wants to destroy a render buffer
		///
		public typealias ULGPUDriverDestroyRenderBufferCallback = function void(uint32 render_buffer_id);
		
		///
		/// The callback invoked when the GPUDriver wants to generate the next
		/// available geometry ID.
		///
		public typealias ULGPUDriverNextGeometryIdCallback = function uint32();
		
		///
		/// The callback invoked when the GPUDriver wants to create geometry with
		/// certain ID and vertex/index data.
		///
		public typealias ULGPUDriverCreateGeometryCallback = function void(uint32 geometry_id, ULVertexBuffer vertices, ULIndexBuffer indices);
		
		///
		/// The callback invoked when the GPUDriver wants to update existing geometry
		/// with new vertex/index data.
		///
		public typealias ULGPUDriverUpdateGeometryCallback = function void(uint32 geometry_id, ULVertexBuffer vertices, ULIndexBuffer indices);
		
		///
		/// The callback invoked when the GPUDriver wants to destroy geometry.
		///
		public typealias ULGPUDriverDestroyGeometryCallback = function void(uint32 geometry_id);
		
		///
		/// The callback invoked when the GPUDriver wants to update the command list
		/// (you should copy the commands to your own structure).
		///
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
		
		///
		/// Sets up an orthographic projection matrix with a certain viewport width
		/// and height, multiplies it by 'transform', and returns the result.
		///
		/// This should be used to calculate the model-view projection matrix for the
		/// vertex shaders using the current ULGPUState.
		///
		/// The 'flip_y' can be optionally used to flip the Y coordinate-space.
		/// (Usually flip_y == true for OpenGL)
		///
		[CLink]
		public static extern ULMatrix4x4 ulApplyProjection(ULMatrix4x4 transform, float viewport_width, float viewport_height, bool flip_y);
		
		/******************************************************************************
		* Clipboard
		*****************************************************************************/
		
		///
		/// The callback invoked when the library wants to clear the system's
		/// clipboard.
		///
		public typealias ULClipboardClearCallback = function void();
		
		///
		/// The callback invoked when the library wants to read from the system's
		/// clipboard.
		///
		/// You should store the result (if any) in 'result'.
		///
		public typealias ULClipboardReadPlainTextCallback = function void(ULString result);
		
		///
		/// The callback invoked when the library wants to write to the system's
		/// clipboard.
		///
		public typealias ULClipboardWritePlainTextCallback = function void(ULString text);
		
		[CRepr]
		public struct ULClipboard
		{
			public ULClipboardClearCallback clear;
			public ULClipboardReadPlainTextCallback read_plain_text;
			public ULClipboardWritePlainTextCallback write_plain_text;
		};
		
		/******************************************************************************
		* Platform
		*****************************************************************************/
		
		///
		/// Set a custom Logger implementation.
		///
		/// This is used to log debug messages to the console or to a log file.
		///
		/// You should call this before ulCreateRenderer() or ulCreateApp().
		///
		/// @note  ulCreateApp() will use the default logger if you never call this.
		///
		/// @note  If you're not using ulCreateApp(), (eg, using ulCreateRenderer())
		///        you can still use the default logger by calling
		///        ulEnableDefaultLogger() (@see <AppCore/CAPI.h>)
		///
		[CLink]
		public static extern void ulPlatformSetLogger(ULLogger logger);
		
		///
		/// Set a custom FileSystem implementation.
		///
		/// This is used for loading File URLs (eg, <file:///page.html>). If you don't
		/// call this, and are not using ulCreateApp() or ulEnablePlatformFileSystem(),
		/// you will not be able to load any File URLs.
		///
		/// You should call this before ulCreateRenderer() or ulCreateApp().
		///
		/// @note  ulCreateApp() will use the default platform file system if you never
		///        call this.
		///
		/// @note  If you're not using ulCreateApp(), (eg, using ulCreateRenderer())
		///        you can still use the default platform file system by calling
		///        ulEnablePlatformFileSystem() (@see <AppCore/CAPI.h>)
		///
		[CLink]
		public static extern void ulPlatformSetFileSystem(ULFileSystem file_system);
		
		///
		/// Set a custom Surface implementation.
		///
		/// This can be used to wrap a platform-specific GPU texture, Windows DIB,
		/// macOS CGImage, or any other pixel buffer target for display on screen.
		///
		/// By default, the library uses a bitmap surface for all surfaces but you can
		/// override this by providing your own surface definition here.
		///
		/// You should call this before ulCreateRenderer() or ulCreateApp().
		///
		[CLink]
		public static extern void ulPlatformSetSurfaceDefinition(ULSurfaceDefinition surface_definition);
		
		///
		/// Set a custom GPUDriver implementation.
		///
		/// This should be used if you have enabled the GPU renderer in the Config and
		/// are using ulCreateRenderer() (which does not provide its own GPUDriver
		/// implementation).
		///
		/// The GPUDriver interface is used by the library to dispatch GPU calls to
		/// your native GPU context (eg, D3D11, Metal, OpenGL, Vulkan, etc.) There
		/// are reference implementations for this interface in the AppCore repo.
		///
		/// You should call this before ulCreateRenderer().
		///
		[CLink]
		public static extern void ulPlatformSetGPUDriver(ULGPUDriver gpu_driver);
		
		///
		/// Set a custom Clipboard implementation.
		///
		/// This should be used if you are using ulCreateRenderer() (which does not
		/// provide its own clipboard implementation).
		///
		/// The Clipboard interface is used by the library to make calls to the
		/// system's native clipboard (eg, cut, copy, paste).
		///
		/// You should call this before ulCreateRenderer().
		///
		[CLink]
		public static extern void ulPlatformSetClipboard(ULClipboard clipboard);
	}
}
