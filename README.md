# carc.in-play - Embeddable playground to *compile and run code in*

[carc.in](https://github.com/jhass/carc.in) is a web service that runs code and displays the result.
This repository contains tools to embed an interactive playground in any website and run code on carc.in.

## Usage

The editor component is based on [CodeMirror](https://codemirror.net/), so you need to include codemirror.

This example shows how to embed a [Crystal](crystal-lang.org/) playground:

```html
<link rel="stylesheet" href="vendor/codemirror/codemirror.css" />
<link rel="stylesheet" href="carcin-play.css" />

<pre><code class="crystal-play">puts "Hello World!"
</code></pre>

<script src="vendor/codemirror/codemirror.js"></script>
<script src="vendor/codemirror/crystal/crystal.js"></script>
<script src="carcin.js"></script>
<script src="carcin-play.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll(".crystal-play").forEach(function(code) {
      var wrapper = document.createElement("div");
      code.parentNode.replaceChild(wrapper, code);
      var play = new CarcinPlay(code.innerText, wrapper, {language: "crystal"});
    });
  });
</script>
```

This project consists of three components:

* `carcin.js` - API for carc.in
* `carcin-play.js` - Playground component
* `carcin-play.css` - Styling for playground component

The default styling is intended for use with [mkdocs-material](https://squidfunk.github.io/mkdocs-material/),
a functional is at [samples/hello-world](samples/hello-world).
