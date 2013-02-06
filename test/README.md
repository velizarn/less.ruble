
Create _less_config.yml_ file:

```yaml
---
css_destination_folder: "/assets/css"
js_destination_folder: "/assets/js"
```
Create _wro.xml_ file to point where are your source files:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<groups xmlns="http://www.isdc.ro/wro">

	<group name="styles">
		<css minimize="false">/src/less/reset.css</css>
		<css minimize="false">/src/less/style.less</css>
	</group>

	<group name="scripts">
		<js minimize="true">/src/js/file.js</js>
	</group>

</groups>
```

Select a file from your project or place the cursor inside the editor then go to Eclipse menu > Commands > Less > Compile CSS (JS)

So for above example if you have two source files called
_/src/less/reset.css_
_/src/less/style.less_

Wro4j Runner will create a new file
_/assets/css/styles.css_