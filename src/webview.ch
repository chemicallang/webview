public namespace webview {

public struct WebView {
    private var handle : *mut void = null;

    @constructor
    public func new(debug : bool = false, window : *mut void = null) {
        return WebView {
            handle : ffi::webview_create(if(debug) 1 else 0, window)
        }
    }

    @delete
    func delete(&mut self) {
        if(self.handle != null) {
            ffi::webview_destroy(self.handle);
            self.handle = null;
        }
    }

    public func run(&self) {
        ffi::webview_run(self.handle);
    }

    public func terminate(&self) {
        ffi::webview_terminate(self.handle);
    }

    public func dispatch(&self, fn : (w : *mut void, arg : *mut void) => void, arg : *mut void) {
        ffi::webview_dispatch(self.handle, fn, arg);
    }

    public func get_window(&self) : *mut void {
        return ffi::webview_get_window(self.handle);
    }

    public func set_title(&self, title : *char) {
        ffi::webview_set_title(self.handle, title);
    }

    public func set_size(&self, width : int, height : int, hints : WindowHint) {
        ffi::webview_set_size(self.handle, width, height, hints as int);
    }

    public func navigate(&self, url : *char) {
        ffi::webview_navigate(self.handle, url);
    }

    public func set_html(&self, html : *char) {
        ffi::webview_set_html(self.handle, html);
    }

    public func init(&self, js : *char) {
        ffi::webview_init(self.handle, js);
    }

    public func eval(&self, js : *char) {
        ffi::webview_eval(self.handle, js);
    }

    public func bind(&self, name : *char, fn : (seq : *char, req : *char, arg : *mut void) => void, arg : *mut void) {
        ffi::webview_bind(self.handle, name, fn, arg);
    }

    public func unbind(&self, name : *char) {
        ffi::webview_unbind(self.handle, name);
    }

    public func return_result(&self, seq : *char, status : int, result : *char) {
        ffi::webview_return(self.handle, seq, status, result);
    }
}

}
