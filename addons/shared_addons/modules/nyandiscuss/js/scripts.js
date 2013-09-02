/*

Author: PyroCMS Dev Team

*/

/**
 * Pyro object
 *
 * The Pyro object is the foundation of all PyroUI enhancements
 */
// It may already be defined in metadata partial
if (typeof(pyro) == 'undefined') {
	var pyro = {};
}

jQuery(function($) {

	// Set up an object for caching things
	pyro.cache = {
		// set this up for the slug generator
		url_titles	: {}
	}

	// Create a clean slug from whatever garbage is in the title field
	pyro.generate_slug = function(input_form, output_form, space_character, disallow_dashes)
	{
		space_character = space_character || '-';

		$(input_form).slugify({ slug: output_form, type: space_character });
	}
});
