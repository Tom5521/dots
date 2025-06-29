return {
	"AstroNvim/astrolsp",
	opts = {
		config = {
			ltex = {
				settings = {
					ltex = {
						language = "es",
					},
				},
			},
			--[[ 			
			textlsp = {
				settings = {
					textLSP = {
						analysers = {
							languagetool = {
								enabled = true,
								check_text = {
									on_open = true,
									on_save = true,
									on_change = false,
								},
							},
						},
						documents = {
							language = "auto:es",
						},
					},
				},
			}, ]]
		},
	},
}
