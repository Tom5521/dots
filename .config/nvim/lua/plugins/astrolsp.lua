return {
	"AstroNvim/astrolsp",
	opts = {
		config = {
			textlsp = {
				settings = {
					textLSP = {
						analysers = {
							languagetool = {
								enabled = true,
								check_text = {
									on_open = true,
									on_save = true,
									on_change = true,
								},
							},
						},
						documents = {
							language = "auto:es",
						},
					},
				},
			},
		},
	},
}
