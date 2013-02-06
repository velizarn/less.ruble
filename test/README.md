
Create less_config.yml file:

```yaml
---
css_destination_folder: "/assets/css"
js_destination_folder: "/assets/js"
```
Create wro.xml file:

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