public namespace webview {

protected struct ffi {
    @extern
    func webview_create(debug : int, window : *mut void) : *mut void;

    @extern
    func webview_destroy(w : *mut void) : void;

    @extern
    func webview_run(w : *mut void) : void;

    @extern
    func webview_terminate(w : *mut void) : void;

    @extern
    func webview_dispatch(w : *mut void, fn : (w : *mut void, arg : *mut void) => void, arg : *mut void) : void;

    @extern
    func webview_get_window(w : *mut void) : *mut void;

    @extern
    func webview_set_title(w : *mut void, title : *char) : void;

    @extern
    func webview_set_size(w : *mut void, width : int, height : int, hints : int) : void;

    @extern
    func webview_navigate(w : *mut void, url : *char) : void;

    @extern
    func webview_set_html(w : *mut void, html : *char) : void;

    @extern
    func webview_init(w : *mut void, js : *char) : void;

    @extern
    func webview_eval(w : *mut void, js : *char) : void;

    @extern
    func webview_bind(w : *mut void, name : *char, fn : (seq : *char, req : *char, arg : *mut void) => void, arg : *mut void) : void;

    @extern
    func webview_unbind(w : *mut void, name : *char) : void;

    @extern
    func webview_return(w : *mut void, seq : *char, status : int, result : *char) : void;
}

}
