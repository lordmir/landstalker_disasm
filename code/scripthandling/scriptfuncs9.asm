	include "code/scripthandling/scriptfuncs_debugitems.asm"

	if ((REGION=FR)|(REGION=DE))
		include "code/scripthandling/articles/getitemarticle.asm"
ItemArticles:
		if REGION=FR
			incbin "assets_packed/script/itemarticles/itemarticles_fr.bin"
		elseif REGION=DE
			incbin "assets_packed/script/itemarticles/itemarticles_de.bin"
		endif
		include "code/scripthandling/articles/getitemusestring.asm"
ItemUseStringOffsets:
		incbin "assets_packed/script/itemarticles/itemuse_offsets.bin"
		include "code/scripthandling/articles/getitemfoundstring.asm"
ItemFoundStringOffsets:
		incbin "assets_packed/script/itemarticles/itemfound_offsets.bin"
	endif

	include "code/scripthandling/scriptfuncs_flags.asm"
	include "code/scripthandling/scriptfuncs_names.asm"