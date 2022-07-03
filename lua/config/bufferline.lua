require("bufferline").setup {
	options = {
		numbers = "buffer_id",
		diagnostic = "nvim_lsp",
		diagnostic_update_in_insert = true,
		diagnostics_indicator = function(count)
      		return "("..count..")"
    	end,
	}
}
