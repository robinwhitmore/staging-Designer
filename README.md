# Weebly Developer Docs

1. **[Getting Started](#getting-started)** - Steps to set up the project locally so you can begin developing and writing.
1. **[Developing](#developing)** - Info on working with templates, styles, and data.
1. **[Writing](#writing)** - Info on writing content.

## Getting Started

```
# Install Jekyll and the Gem Bundler
gem install jekyll bundler

# Install gems (~5 min)
bundle install

# Start dev env. Specify one the three config files in the root folder.
jekyll serve --config _config_Designer.yml
# jekyll serve --config _config_Cloud.yml
# jekyll serve --config _config_Platform.yml

# For speedier compilation (0.5s rather than 5s) use the incremental flag.
# Note: Some edits, such as those to data files will not be caught with this flag on.
jekyll serve --config _config_Designer.yml --incremental

# Visit http://localhost:400[X]/
# Check the port number noted in your Terminal. It will be 4000, 4006, or 4008.
```

## 🖥 Developing

### Directory Structure

A list of commonly modified files in the repo.

```
.
├── _data: Data for templates stored in YAML files.
├── _site: Auto-generated. Do not edit.
├── css
|   └── orbit.css - Generated from orbit. Do not edit.
|   └── orbit-external.css - Generated from orbit-3rd-party. Do not edit.
|   └── theme-weebly.scss - Styles for site layout and filling in Orbit's gaps. Also includes Orbit overrides. 
├── js
|   └── customscripts.js - All the JS we write lives in here.
├── pages: Markdown files for the page content.
├── x_*: Auto-generated. Do not edit.
├── search.json - Generates JSON that powers search. Builds index from pages.
```

### Code Style

Please follow the `.editorconfig` settings which are taken from the official Jekyll project. Indent style is '2 spaces'.

### CSS 

#### Writing CSS

The majority of the CSS you'll be modifying lives in `theme-weebly.scss`. Jekyll has built-in support for SASS, so you can utilize variables, extend, and mixins. The available variables are placed at the top of the file.

#### Importing the Latest Orbit Styles

If Orbit goes through significant visual changes then it is worth considering bringing these changes in to Developer Docs to keep this project aligned with the rest of the Weebly ecosystem. The new Orbit styles will not automatically be imported in to Developer Docs. To bring the new styles in, follow the instructions noted below.

This project has two CSS files that bring in Orbit styles. They are both generated from other repos.

1. **orbit-external.css** - Generated from the [orbit-3rd-party](https://github.intern.weebly.net/weebly/orbit-3rd-party) repo. Adds styles to HTML elements. ex. h1, h2, h3, p
1. **orbit.css** - Generated from the [orbit](https://github.intern.weebly.net/weebly/orbit) repo. Includes CSS classes that map to Orbit Components. ex. .Nav, .Card

Do not manually edit either of these files. If you need to override styles from these imports, add them to their respective section near the bottom of `theme-weebly.scss`:

1. "Orbit External - Overrides"
2. "Orbit - Overrides"

#### 1. Updating `orbit-exernal.css`

1. Clone the [orbit-3rd-party repo](https://github.intern.weebly.net/weebly/orbit-3rd-party).
1. Update the Orbit version in `package.json`
1. `npm install`
1. `npm run build`
1. Copy `dist/orbit.css`. Rename to `orbit-external.css`. Drop in to this repo's `/css` folder..

#### 2. Updating `orbit.css`

This process is manual. The steps below might not be complete. Update this README if you find any gaps.

1. Clone the [Orbit repo](https://github.intern.weebly.net/weebly/orbit/).
1. `npm install`
1. Update the webpack config to not hash the CSS classnames. Open up `build/webpack.config.build.js` and update the `localIdentName` value. `localIdentName: '[local]',`
1. `./node_modules/.bin/webpack --config build/webpack.config.build.js`
1. Open up `styles.css`. Do a _find and replace_, replacing all "_0" references with an empty string "".
1. Copy the contents of `style.css` and paste into `css/orbit.css` in this project.
1. You're not quite done yet. Find the Notice section in the CSS. You'll see a set of 'type_' classes. Update each of these selectors to include `.Notice`. ex. `.type_info` becomes `.Notice.type_info`


### Third-party Libraries

- [Jekyll](https://jekyllrb.com/) - Static site generator.
- [Simple Jekyll Search](https://github.com/christian-fei/Simple-Jekyll-Search) 
- [Bootstrap](http://getbootstrap.com/docs/3.3/) - We don't pull in the Bootstrap CSS. We just use the BootstrapJS for Tooltip and Popover functionality.


## ✏️ Writing


### note.html

![Example of Notes](https://raw.githubusercontent.com/robinwhitmore/jekylltechdocs/gh-pages/images/readme/notes.png)

```
{% include note.html content="..." %}
{% include note.html type="tip" content="..." %}
{% include note.html type="warning" content="..." %}
{% include note.html type="error" content="..." %}
```

If you don't specify a note type, it will default to `type="info"`.

#### Using HTML and Variables in a Note

If you want to add HTML to the content of a Note, for example a link, or use variables to construct the message, then you'll need to use the `capture` tag to construct the message and store it in a variable ahead of passing it to the *note*.

![Note with HTML](https://raw.githubusercontent.com/robinwhitmore/jekylltechdocs/gh-pages/images/readme/note_html.png)

```
{% capture my_var_name %}
Add [links](home.html) and use variables inside of the capture tag. {%if site.project=="designer" %}Hi Designer.{% endif %}
{% endcapture %}

{% include note.html content=my_var_name %}
```

Don't use quotes around the content value if you are using a variable.


### label.html

![Example of Labels](https://raw.githubusercontent.com/robinwhitmore/jekylltechdocs/gh-pages/images/readme/labels.png)

```
# Using any of the following content values will automatically color the label.
{% include label.html content="get" %}
{% include label.html content="put" %}
{% include label.html content="post" %}
{% include label.html content="patch" %}
{% include label.html content="delete" %}

# But you are free to pass any content in to the label. It will use default styling.
{% include label.html content="Hello There" %}

```

### image.html

```
{% include image.html file="cl_apps.png" caption="App Detail page in the Cloud Admin" alt="Interface showing form to change details of an app" %}
{% include image.html file="weebly.png" url="http://weebly.com" caption="Weebly.com" alt="Weebly logo" %}
```
