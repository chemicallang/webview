# webview

Webview Library Bindings for Chemical Programming Language

## Usage

```chmod
import "github.com/chemicallang/webview"
```

## Example

```chemical
using webview::WebView;
using webview::WindowHint;

var count = 0;

func on_click(seq : *char, req : *char, arg : *mut void) {
    var wv = arg as *WebView;
    count++;
    var buf : [128]char;
    sprintf(&mut buf[0], "{\"count\": %d}", count);
    wv.return_result(seq, 0, &buf[0]);
}

func on_exit(seq : *char, req : *char, arg : *mut void) {
    var wv = arg as *WebView;
    wv.terminate();
}

public func main() : int {
    var wv = WebView.new(true);
    wv.set_title("Chemical Language - Webview Demo");
    wv.set_size(800, 580, WindowHint.Fixed);
    wv.bind("clickBtn", on_click, &mut wv);
    wv.bind("exitApp", on_exit, &mut wv);
    wv.set_html("<!DOCTYPE html><html><head><style>*{box-sizing:border-box;margin:0}body{background:#0b0e14;color:#e6edf3;font-family:sans-serif;display:flex;align-items:center;justify-content:center;height:100vh}.card{background:#161b22;padding:2.5rem;border-radius:12px;border:1px solid #30363d;text-align:center;width:400px}h1{color:#00ffcc;font-size:2rem;margin-bottom:.5rem}.sub{color:#8b949e;margin-bottom:2rem;font-size:.9rem}#cnt{font-size:3rem;font-weight:bold;color:#00d4ff;margin:1.5rem 0}.btn{background:linear-gradient(135deg,#00ffcc,#00d4ff);border:none;padding:10px 22px;border-radius:6px;cursor:pointer;font-weight:bold;color:#000;font-size:1rem;transition:.2s;margin:4px}.btn:hover{transform:translateY(-2px);box-shadow:0 4px 12px rgba(0,255,204,.3)}.exit{background:transparent;border:1px solid #30363d;color:#f85149}</style></head><body><div class='card'><h1>Chemical Engine</h1><div class='sub'>Native Desktop + Web UI via Webview</div><div id='cnt'>0</div><button class='btn' onclick='run()'>EXECUTE ENGINE</button><button class='btn exit' onclick='window.exitApp()'>EXIT</button><div id='log' style='margin-top:1.5rem;padding:.8rem;background:#0d1117;border-radius:6px;font-family:monospace;font-size:.8rem;color:#8b949e;text-align:left'>> Ready</div></div><script>async function run(){const e=document.getElementById('log');e.innerHTML+='<br>> Calling Chemical...';const r=await window.clickBtn();document.getElementById('cnt').innerText=r.count;e.innerHTML+='<br>> Count updated to '+r.count;e.scrollTop=e.scrollHeight;}</script></body></html>");
    wv.run();
    return 0;
}
```