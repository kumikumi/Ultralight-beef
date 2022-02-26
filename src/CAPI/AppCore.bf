using System;

namespace Ultralight.CAPI
{
	static
	{
		public struct C_Settings;
		public typealias ULSettings = C_Settings*;
		
		public struct C_App;
		public typealias ULApp = C_App*;
		
		public struct C_Window;
		public typealias ULWindow = C_Window*;
		
		public struct C_Monitor;
		public typealias ULMonitor = C_Monitor*;
		
		public struct C_Overlay;
		public typealias ULOverlay = C_Overlay*;
		
		///
		/// Create settings with default values (see <AppCore/App.h>).
		///
		[CLink]
		public static extern ULSettings ulCreateSettings();
		
		///
		/// Destroy settings.
		///
		[CLink]
		public static extern void ulDestroySettings(ULSettings settings);
		
		///
		/// Set the name of the developer of this app.
		///
		/// This is used to generate a unique path to store local application data
		/// on the user's machine.
		///
		/// Default is "MyCompany"
		///
		[CLink]
		public static extern void ulSettingsSetDeveloperName(ULSettings settings, ULString name);
		
		///
		/// Set the name of this app.
		///
		/// This is used to generate a unique path to store local application data
		/// on the user's machine.
		///
		/// Default is "MyApp"
		///
		[CLink]
		public static extern void ulSettingsSetAppName(ULSettings settings, ULString name);
		
		///
		/// Set the root file path for our file system, you should set this to the
		/// relative path where all of your app data is.
		///
		/// This will be used to resolve all file URLs, eg file:///page.html
		///
		/// @note  The default path is "./assets/"
		///
		///        This relative path is resolved using the following logic:
		///         - Windows: relative to the executable path
		///         - Linux:   relative to the executable path
		///         - macOS:   relative to YourApp.app/Contents/Resources/
		///
		[CLink]
		public static extern void ulSettingsSetFileSystemPath(ULSettings settings, ULString path);
		
		///
		/// Set whether or not we should load and compile shaders from the file system
		/// (eg, from the /shaders/ path, relative to file_system_path).
		///
		/// If this is false (the default), we will instead load pre-compiled shaders
		/// from memory which speeds up application startup time.
		///
		[CLink]
		public static extern void ulSettingsSetLoadShadersFromFileSystem(ULSettings settings, bool enabled);
		
		///
		/// We try to use the GPU renderer when a compatible GPU is detected.
		///
		/// Set this to true to force the engine to always use the CPU renderer.
		///
		[CLink]
		public static extern void ulSettingsSetForceCPURenderer(ULSettings settings, bool force_cpu);
		
		///
		/// Create the App singleton.
		///
		/// @param  settings  Settings to customize App runtime behavior. You can pass
		///                   NULL for this parameter to use default settings.
		///
		/// @param  config  Config options for the Ultralight renderer. You can pass
		///                 NULL for this parameter to use default config.
		///
		/// @note  You should only create one of these per application lifetime.
		///
		/// @note  Certain Config options may be overridden during App creation,
		///        most commonly Config::face_winding and Config::device_scale_hint.
		///
		[CLink]
		public static extern ULApp ulCreateApp(ULSettings settings, ULConfig config);
		
		///
		/// Destroy the App instance.
		///
		[CLink]
		public static extern void ulDestroyApp(ULApp app);
		
		public typealias ULUpdateCallback = function void(void* user_data);
		
		///
		/// Set a callback for whenever the App updates. You should update all app
		/// logic here.
		///
		/// @note  This event is fired right before the run loop calls
		///        Renderer::Update and Renderer::Render.
		///
		[CLink]
		public static extern void ulAppSetUpdateCallback(ULApp app, ULUpdateCallback callback, void* user_data);
		
		///
		/// Whether or not the App is running.
		///
		[CLink]
		public static extern bool ulAppIsRunning(ULApp app);
		
		///
		/// Get the main monitor (this is never NULL).
		///
		/// @note  We'll add monitor enumeration later.
		///
		[CLink]
		public static extern ULMonitor ulAppGetMainMonitor(ULApp app);
		
		///
		/// Get the underlying Renderer instance.
		///
		[CLink]
		public static extern ULRenderer ulAppGetRenderer(ULApp app);
		
		///
		/// Run the main loop.
		///
		[CLink]
		public static extern void ulAppRun(ULApp app);
		
		///
		/// Quit the application.
		///
		[CLink]
		public static extern void ulAppQuit(ULApp app);
		
		///
		/// Get the monitor's DPI scale (1.0 = 100%).
		///
		[CLink]
		public static extern double ulMonitorGetScale(ULMonitor monitor);
		
		///
		/// Get the width of the monitor (in pixels).
		///
		[CLink]
		public static extern uint32 ulMonitorGetWidth(ULMonitor monitor);
		
		///
		/// Get the height of the monitor (in pixels).
		///
		[CLink]
		public static extern uint32 ulMonitorGetHeight(ULMonitor monitor);
		
		///
		/// Create a new Window.
		///
		/// @param  monitor       The monitor to create the Window on.
		///
		/// @param  width         The width (in screen coordinates).
		///
		/// @param  height        The height (in screen coordinates).
		///
		/// @param  fullscreen    Whether or not the window is fullscreen.
		///
		/// @param  window_flags  Various window flags.
		///
		[CLink]
		public static extern ULWindow ulCreateWindow(ULMonitor monitor, uint32 width, uint32 height, bool fullscreen, uint32 window_flags);
		
		///
		/// Destroy a Window.
		///
		[CLink]
		public static extern void ulDestroyWindow(ULWindow window);
		
		public typealias ULCloseCallback = function void(void* user_data, ULWindow window);
		
		///
		/// Set a callback to be notified when a window closes.
		///
		[CLink]
		public static extern void ulWindowSetCloseCallback(ULWindow window, ULCloseCallback callback, void* user_data);
		
		public typealias ULResizeCallback = function void(void* user_data, ULWindow window, uint32 width, uint32 height);
		
		///
		/// Set a callback to be notified when a window resizes
		/// (parameters are passed back in pixels).
		///
		[CLink]
		public static extern void ulWindowSetResizeCallback(ULWindow window, ULResizeCallback callback, void* user_data);
		
		///
		/// Get window width (in screen coordinates).
		///
		[CLink]
		public static extern uint32 ulWindowGetScreenWidth(ULWindow window);
		
		///
		/// Get window width (in pixels).
		///
		[CLink]
		public static extern uint32 ulWindowGetWidth(ULWindow window);
		
		///
		/// Get window height (in screen coordinates).
		///
		[CLink]
		public static extern uint32 ulWindowGetScreenHeight(ULWindow window);
		
		///
		/// Get window height (in pixels).
		///
		[CLink]
		public static extern uint32 ulWindowGetHeight(ULWindow window);
		
		///
		/// Move the window to a new position (in screen coordinates) relative to the top-left of the
		/// monitor area.
		///
		[CLink]
		public static extern void ulWindowMoveTo(ULWindow window, int32 x, int32 y);
		
		///
		/// Move the window to the center of the monitor.
		///
		[CLink]
		public static extern void ulWindowMoveToCenter(ULWindow param);
		
		///
		/// Get the x-position of the window (in screen coordinates) relative to the top-left of the
		/// monitor area.
		///
		[CLink]
		public static extern int32 ulWindowGetPositionX(ULWindow window);
		
		///
		/// Get the y-position of the window (in screen coordinates) relative to the top-left of the
		/// monitor area.
		///
		[CLink]
		public static extern int32 ulWindowGetPositionY(ULWindow window);
		
		///
		/// Get whether or not a window is fullscreen.
		///
		[CLink]
		public static extern bool ulWindowIsFullscreen(ULWindow window);
		
		///
		/// Get the DPI scale of a window.
		///
		[CLink]
		public static extern double ulWindowGetScale(ULWindow window);
		
		///
		/// Set the window title.
		///
		[CLink]
		public static extern void ulWindowSetTitle(ULWindow window, char8* title);
		
		///
		/// Set the cursor for a window.
		///
		[CLink]
		public static extern void ulWindowSetCursor(ULWindow window, ULCursor cursor);
		
		///
		/// Show the window (if it was previously hidden).
		///
		[CLink]
		public static extern void ulWindowShow(ULWindow window);
		
		///
		/// Hide the window.
		///
		[CLink]
		public static extern void ulWindowHide(ULWindow window);
		
		///
		/// Whether or not the window is currently visible (not hidden).
		///
		[CLink]
		public static extern bool ulWindowIsVisible(ULWindow window);
		
		///
		/// Close a window.
		///
		[CLink]
		public static extern void ulWindowClose(ULWindow window);
		
		///
		/// Convert screen coordinates to pixels using the current DPI scale.
		///
		[CLink]
		public static extern int32 ulWindowScreenToPixels(ULWindow window, int32 val);
		
		///
		/// Convert pixels to screen coordinates using the current DPI scale.
		///
		[CLink]
		public static extern int32 ulWindowPixelsToScreen(ULWindow window, int32 val);
		
		///
		/// Get the underlying native window handle.
		///
		/// @note This is:  - HWND on Windows
		///                 - NSWindow* on macOS
		///                 - GLFWwindow* on Linux
		///
		[CLink]
		public static extern void* ulWindowGetNativeHandle(ULWindow window);
		
		///
		/// Create a new Overlay.
		///
		/// @param  window  The window to create the Overlay in.
		///
		/// @param  width   The width in pixels.
		///
		/// @param  height  The height in pixels.
		///
		/// @param  x       The x-position (offset from the left of the Window), in
		///                 pixels.
		///
		/// @param  y       The y-position (offset from the top of the Window), in
		///                 pixels.
		///
		/// @note  Each Overlay is essentially a View and an on-screen quad. You should
		///        create the Overlay then load content into the underlying View.
		///
		[CLink]
		public static extern ULOverlay ulCreateOverlay(ULWindow window, uint32 width, uint32 height, int32 x, int32 y);
		
		///
		/// Create a new Overlay, wrapping an existing View.
		///
		/// @param  window  The window to create the Overlay in. (we currently only
		///                 support one window per application)
		///
		/// @param  view    The View to wrap (will use its width and height).
		///
		/// @param  x       The x-position (offset from the left of the Window), in
		///                 pixels.
		///
		/// @param  y       The y-position (offset from the top of the Window), in
		///                 pixels.
		///
		/// @note  Each Overlay is essentially a View and an on-screen quad. You should
		///        create the Overlay then load content into the underlying View.
		///
		[CLink]
		public static extern ULOverlay ulCreateOverlayWithView(ULWindow window, ULView view, int32 x, int32 y);
		
		///
		/// Destroy an overlay.
		///
		[CLink]
		public static extern void ulDestroyOverlay(ULOverlay overlay);
		
		///
		/// Get the underlying View.
		///
		[CLink]
		public static extern ULView ulOverlayGetView(ULOverlay overlay);
		
		///
		/// Get the width (in pixels).
		///
		[CLink]
		public static extern uint32 ulOverlayGetWidth(ULOverlay overlay);
		
		///
		/// Get the height (in pixels).
		///
		[CLink]
		public static extern uint32 ulOverlayGetHeight(ULOverlay overlay);
		
		///
		/// Get the x-position (offset from the left of the Window), in pixels.
		///
		[CLink]
		public static extern int32 ulOverlayGetX(ULOverlay overlay);
		
		///
		/// Get the y-position (offset from the top of the Window), in pixels.
		///
		[CLink]
		public static extern int32 ulOverlayGetY(ULOverlay overlay);
		
		///
		/// Move the overlay to a new position (in pixels).
		///
		[CLink]
		public static extern void ulOverlayMoveTo(ULOverlay overlay, int32 x, int32 y);
		
		///
		/// Resize the overlay (and underlying View), dimensions should be
		/// specified in pixels.
		///
		[CLink]
		public static extern void ulOverlayResize(ULOverlay overlay, uint32 width, uint32 height);
		
		///
		/// Whether or not the overlay is hidden (not drawn).
		///
		[CLink]
		public static extern bool ulOverlayIsHidden(ULOverlay overlay);
		
		///
		/// Hide the overlay (will no longer be drawn).
		///
		[CLink]
		public static extern void ulOverlayHide(ULOverlay overlay);
		
		///
		/// Show the overlay.
		///
		[CLink]
		public static extern void ulOverlayShow(ULOverlay overlay);
		
		///
		/// Whether or not an overlay has keyboard focus.
		///
		[CLink]
		public static extern bool ulOverlayHasFocus(ULOverlay overlay);
		
		///
		/// Grant this overlay exclusive keyboard focus.
		///
		[CLink]
		public static extern void ulOverlayFocus(ULOverlay overlay);
		
		///
		/// Remove keyboard focus.
		///
		[CLink]
		public static extern void ulOverlayUnfocus(ULOverlay overlay);
		
		/******************************************************************************
		* Platform
		*****************************************************************************/
		
		///
		/// This is only needed if you are not calling ulCreateApp().
		///
		/// Initializes the platform font loader and sets it as the current FontLoader.
		///
		[CLink]
		public static extern void ulEnablePlatformFontLoader();
		
		///
		/// This is only needed if you are not calling ulCreateApp().
		///
		/// Initializes the platform file system (needed for loading file:/// URLs) and
		/// sets it as the current FileSystem.
		///
		/// You can specify a base directory path to resolve relative paths against.
		///
		[CLink]
		public static extern void ulEnablePlatformFileSystem(ULString base_dir);
		
		///
		/// This is only needed if you are not calling ulCreateApp().
		///
		/// Initializes the default logger (writes the log to a file).
		///
		/// You should specify a writable log path to write the log to
		/// for example "./ultralight.log".
		///
		[CLink]
		public static extern void ulEnableDefaultLogger(ULString log_path);
	}
}
