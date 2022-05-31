local ls = require'luasnip'

ls.config.set_config({
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = false,
})

ls.add_snippets("all", {
    ls.parser.parse_snippet("lorem", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus non interdum nunc. Fusce id velit leo. Nulla commodo mauris vel semper scelerisque. Phasellus nec viverra nunc. Nunc dictum mi vitae velit feugiat, at luctus nibh pulvinar. Nullam a eros ex. Nam eu dapibus justo, et tincidunt lacus. Quisque non porta enim. Integer eget mauris fringilla, tincidunt enim in, finibus nibh. Nunc dictum diam tellus, sit amet congue mi pellentesque nec. Aliquam faucibus dictum libero, ut pulvinar erat malesuada at. Pellentesque dignissim vehicula metus. Ut fermentum turpis nunc.")
})
