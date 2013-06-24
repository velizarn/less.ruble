##How to use

Create **less_config.yml** file with destination folders:

```yaml
---
css_destination_folder: "/assets/css"
js_destination_folder: "/assets/js"
```
Create **wro.xml** file to point where are your source files located:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<groups xmlns="http://www.isdc.ro/wro">

	<group name="styles">
		<css minimize="false">/src/less/reset.css</css>
		<css minimize="false">/src/less/style.less</css>
	</group>

	<group name="styles.min">
		<css minimize="false">/src/less/reset.css</css>
		<css minimize="true">/src/less/style.less</css>
	</group>

	<group name="scripts">
		<js minimize="true">/src/js/file.js</js>
	</group>

</groups>
```
these paths are relative to the project root

Select a file from your project or place the cursor inside the editor then go to Eclipse menu > Commands > Less > Compile CSS (JS)

So for above example with following source files:

/src/less/reset.css
```css
body {
	font-size: 100%;
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
}
```

/src/less/style.less
```css
@nice-blue: #5B83AD;
@light-blue: (@nice-blue + #111);
@light-bgr: #F5F5F5;
@radius: 4px;

#header { color: @light-blue; background: @light-bgr; padding: 5px; }
.header { color: (@nice-blue + #AAA); }

.border-radius {
  border-radius: @radius;
  -moz-border-radius: @radius;
  -webkit-border-radius: @radius;
}

.box-shadow (@x: 0, @y: 0, @blur: 1px, @color: #000) {
  box-shadow: @arguments;
  -moz-box-shadow: @arguments;
  -webkit-box-shadow: @arguments;
}
```

Wro4j Runner will create a new file

/assets/css/styles.css
```css
body {
  font-size: 100%;
  font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
}
#header{color:#6c94be;background:#f5f5f5;padding:5px;}.header{color:#ffffff;}.border-radius{border-radius:4px;-moz-border-radius:4px;-webkit-border-radius:4px;}
```
